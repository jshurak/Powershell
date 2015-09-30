Function script-server
{
        <#
         .SYNOPSIS
            A function to generate SQL scripts for server level objects.
         .DESCRIPTION
            User inputs the Instance name and an optional destination directory.  For scripting logins the sp_help_rev_login stored procedure should exist on the server. A database
            name can be supplied for the optional $UtilityDatabase parameter for special location. It will default to the Master database. It then calls the generate-inventory function to create an html inventory sheet.
         .EXAMPLE
            script-server -InstanceName "PHLDVWSSQL002\DVS1201"
            This example shows the basic usage.  It will script out the provided instances into the directory local to the powershell session.

            script-server -InstanceName "PHLDVWSSQL002\DVS1201" -DestinationRoot "\\kmhpemcfspa21\ISTSG\TSG\nsg\Database_Unix_SA\Database Administration Team\MSSQL Admin\Virtualization Effort\ServerScripts"
            This example scripts out the provided instance to the network drive provided.
           
            script-server -InstanceName "PHLDVWSSQL002\DVS1201" -DestinationRoot "c:\ServerScripts" -UtilityDatabase "Data_Collection"
            This example scripts the provided instance to the specified directory, using the data_collection database as the sp_rev_help_login location. 
         #>


        param
        (
            [parameter(mandatory=$true)]
            [string]$InstanceName,  
            [string]$DestinationRoot,
            [string]$UtilityDatabase,
            [string]$Environment
        )

        Process
        {

        $ErrorActionPreference = "SilentlyContinue"
        $ConfigQuery = ""
        $ConfigQuery = 
@"
set nocount on
IF OBJECT_ID('tempdb..#configuration') IS NOT NULL
	DROP TABLE #configuration

create table #configuration
(
	[id] int identity(1,1),
	entry varchar(256)
)
exec sp_configure 'show advanced options',1
reconfigure
insert into #configuration
select 'exec sp_CONFIGURE ''show advanced options'', 1' 
insert into #configuration
select 'reconfigure'
insert into #configuration
select 'exec sp_configure ''' + name + ''', ' + cast(value_in_use as nvarchar(10))
	from sys.configurations
	where name<>'show advanced options'
insert into #configuration
select 'reconfigure'

exec sp_configure 'show advanced options',1
reconfigure
DECLARE @entry varchar(256),@id int
while (select count(*) from #configuration)>0
BEGIN
	select top 1 
		@id	= [id],
		@entry = [entry]
	from #configuration

	PRINT @entry

	DELETE FROM #configuration
	where [id] = @id
END
"@

            
            [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") | Out-Null
            


            $InstanceObject = New-Object ('Microsoft.SqlServer.Management.Smo.Server') -argumentlist $InstanceName
            $ServerName = $InstanceObject.ComputerNamePhysicalNetBIOS

            $InstanceRoot = $InstanceName.Replace("\","`$")

            if([string]::IsNullOrEmpty($UtilityDatabase))
            {
                $UtilityDatabase = "Master"
            }
            if([string]::IsNullOrEmpty($Environment))
            {
                $Environment = "PRODUCTION"
            }

            if([string]::IsNullOrEmpty($ServerName))
            {
                write-output "Connection to $InstanceName failed. Exiting script."
                return
            }

            #Declaring Object arrays for scripting
            $AgentArray = @("Alerts","Operators","ProxyAccounts","Jobs")


            $Scriptor = New-Object ('Microsoft.SqlServer.Management.Smo.Scripter') $InstanceName
            $Scriptor.Options.DriAllConstraints = $true; 
            $Scriptor.Options.DriAllKeys        = $true; 
            $Scriptor.Options.DriClustered      = $true; 
            $Scriptor.Options.DriDefaults       = $true; 
            $Scriptor.Options.DriIndexes        = $true; 
            $Scriptor.Options.DriNonClustered   = $true; 
            $Scriptor.Options.DriPrimaryKey     = $true; 
            $Scriptor.Options.DriUniqueKeys     = $true; 
 
            $Scriptor.Options.AnsiFile          = $true; 
            $Scriptor.Options.ClusteredIndexes  = $true; 
            $Scriptor.Options.IncludeHeaders    = $true; 
            $Scriptor.Options.Indexes           = $true; 
            $Scriptor.Options.SchemaQualify     = $true; 
            $Scriptor.Options.Triggers          = $true; 
            $Scriptor.Options.XmlIndexes        = $true; 
        
            #Set Default Destination
            if($DestinationRoot -eq $null)
            {
                $DestinationRoot = ".\"
            }
            else
            {
                #Destination parameter given, verify it has a backslash at the end. If not, add it.
                if($DestinationRoot.Substring($DestinationRoot.Length -1) -ne '\')
                {
                    $DestinationRoot = $DestinationRoot + "\"
                }
                #Test the existance of the destination root, create if not
                if(!(Test-Path $DestinationRoot))
                {
                    New-Item $DestinationRoot -ItemType directory
                }
            }

            $WorkDir = $DestinationRoot + $InstanceRoot
            if(!(Test-Path -Path $WorkDir)){
                New-Item $WorkDir -ItemType directory 
            }


            $LinkedServerObject = $InstanceObject.LinkedServers
            if($LinkedServerObject)
            {
                $item = 'LinkedServers'
                $LinkedServerDir = $WorKDir + "\LinkedServers"
                $retval = script-object $InstanceObject LinkedServers $WorkDir
                  if((test-path "$LinkedServerDir") -and $retval -eq 1)
                  {
                       Consolidate-Files $item "$LinkedServerDir"
                  }
            }

            #Script out all SQL Server Agent Objects
            $AgentObject = $InstanceObject.JobServer
            if($AgentObject)
            {
                $AgentDir = $WorKDir + "\Agent"
                if(!(Test-Path -Path $AgentDir))
                {
                    New-Item $AgentDir -ItemType directory 
                }
              ForEach ($item in $AgentArray){
                  $retval = script-object $AgentObject $item $AgentDir
                  if((test-path "$AgentDir\$item") -and $retval -eq 1)
                  {
                       Consolidate-Files $item "$AgentDir\$item"
                  }
               }
            }

            #Script out Logins
            $LoginsDir = $WorkDir + "\Logins"
            $LoginsFile = $LoginsDir + "\__All_Logins.sql"
            if(!(Test-Path $LoginsDir))
            {
                New-Item $LoginsDir -ItemType directory
            }
            if(Test-Path $LoginsFile)
            {
                rm $LoginsFile
                New-Item $LoginsFile -ItemType file
            }
            $handler = [System.Data.SqlClient.SqlInfoMessageEventHandler] {param($sender, $event) Out-File -Append -filepath $LoginsFile -inputobject $event.Message };
            $SqlConnection = new-Object System.Data.SqlClient.SqlConnection("Server=$InstanceName;DataBase=$UtilityDatabase;Integrated Security=SSPI")
            $SqlConnection.add_InfoMessage($handler); 
            $SqlConnection.FireInfoMessageEventOnUserErrors = $true;
            $cmd = new-Object System.Data.SqlClient.SqlCommand("dbo.sp_help_revlogin", $SqlConnection)
            $cmd.CommandType = [System.Data.CommandType]'StoredProcedure'
            $SqlConnection.Open()
            $cmd.ExecuteNonQuery() | Out-Null
            $SqlConnection.Close()

            #Script out configuration
            $ConfigDir = $WorkDir + "\Configuration"
            $ConfigFile = $ConfigDir + "\__All_Config.sql"
            if(!(Test-Path $ConfigDir))
            {
                New-Item $ConfigDir -ItemType directory
            }
            if(Test-Path $ConfigFile)
            {
                rm $ConfigFile
                New-Item $ConfigFile -ItemType file
            }
            $handler = [System.Data.SqlClient.SqlInfoMessageEventHandler] {param($sender, $event) Out-File -Append -filepath $ConfigFile -inputobject $event.Message };
            $SqlConnection = new-Object System.Data.SqlClient.SqlConnection("Server=$InstanceName;DataBase=$UtilityDatabase;Integrated Security=SSPI")
            $SqlConnection.add_InfoMessage($handler); 
            $SqlConnection.FireInfoMessageEventOnUserErrors = $true;
            $cmd = new-Object System.Data.SqlClient.SqlCommand("$ConfigQuery", $SqlConnection)
            $cmd.CommandType = [System.Data.CommandType]'Text'
            $SqlConnection.Open()
            $cmd.ExecuteNonQuery() | Out-Null
            $SqlConnection.Close()
            (Get-Content $ConfigFile | Select-Object -Skip 2) | Set-Content $ConfigFile

            consolidate-all -InstanceName $InstanceName -DestinationRoot $WorkDir
            generate-inventory -InstanceName $InstanceName -DestinationRoot $WorkDir -Environment $Environment
            Report-ServerGroups -ServerName $ServerName -Destination $WorkDir
        }
}

Function consolidate-all
{
        <#
        .SYNOPSIS
            Consolidate all the things!
        .DESCRIPTION
            Trolls through the provided directory and consolidates all the consolidated files into one script.
        #>
        param
        (
            [parameter(mandatory=$true)] $InstanceName,
            [parameter(mandatory=$true)] $DestinationRoot
        )

        process
        {
            $InstanceName = $InstanceName.Replace("\","`$")
            $File = "$DestinationRoot`\$InstanceName`_Deployment_Script.sql"

            if(!(Test-Path $DestinationRoot))
            {
                write-output "$DestinationRoot not found. Exiting script."
                return
            }
            if(Test-Path $File)
            {
                Remove-Item -Path "$File" 
                New-Item -Path "$File" -ItemType file
            }
            if(!(Test-Path $File))
            {
                New-Item -Path "$File" -ItemType file
            }
            #Create logins first!
            Get-ChildItem -Path $DestinationRoot -Recurse | Where-Object {$_.name -eq "__All_Logins.sql"} | % {
                $CurrentFile = $_.FullName
                get-content $CurrentFile | Add-Content $File
                
            }


            Get-ChildItem -Path $DestinationRoot -Recurse | Where-Object {$_.Name -like "__All*" -and $_.Name -ne "__All_Logins.sql"} | % {
                $CurrentFile = $_.FullName
                get-content $CurrentFile | Add-Content $File
            }
        }
            
}


Function Consolidate-Files($type,$dir) {
    $ConFile = "__All_$type.sql"
    $ConDir = "$dir\$ConFile"

    #Generate single File
    if(!(Test-Path -Path $ConDir)){
            New-Item $ConDir -ItemType file
    }
    else{
        Remove-Item $ConDir 
        New-Item $ConDir -ItemType file
    }
    
    Get-ChildItem $dir | where-object -FilterScript {$_.Name -ne $ConFile} |
    ForEach-Object {
        $CurrentFile = "$dir\$_"
        Get-Content $CurrentFile | Add-Content $ConDir
    } #end single alert file
}

function script-object {

    [CmdletBinding(SupportsShouldProcess=$true)]
    param([parameter(ValueFromPipeline=$true)]$Object,[string]$type,[string]$WorkDir)
    
    
    process{
        $ChangeFlag = 0
        $Dir = $WorkDir + "\$Type" 
       
        $Object.$Type | Where-Object -filterscript {$_.PSObject.Properties.Match('isSystemObject').Count -eq 0 -or $_.isSystemObject -eq 0} |
        ForEach-Object {
            if(!(Test-Path -Path $Dir)){
                New-Item $Dir -ItemType directory 
            }
            $Name = $_.name -replace '\\',"`$"
            $Name = $Name -replace ':',"`_"
            $Name = $Name -replace '/',"`_"
            $File = "$Dir" + "\" + $Name + ".sql"
            if(!(Test-Path $File)){
                $Scriptor.Options.FileName = $File
                $Scriptor.EnumScript($_)
                (Get-Content $File | Select-Object -Skip 1) | Set-Content $File
                $ChangeFlag = 1
            }Else{
                $Scriptor.Options.FileName = $File
                $Scriptor.EnumScript($_)
                (Get-Content $File | Select-Object -Skip 1) | Set-Content $File
                $ChangeFlag = 1

                <#$TmpFile = "$File.TMP"
                $Scriptor.Options.FileName = $TmpFile
                $Scriptor.EnumScript($_)
                (Get-Content $TmpFile | Select-Object -Skip 1) | Set-Content $TmpFile
                $FileHash = Get-Hash $File
                $TMPHash = Get-Hash $TmpFile
                if(Compare-Object $FileHash $TMPHash){
                    Remove-Item $File
                    Rename-Item $TmpFile $File
                    $ChangeFlag = 1
                }else{
                    Remove-Item $TmpFile
                }#>
                
            }
        } #Tables
        Return $ChangeFlag
    }
}

function Submit-SQLStatement
{
    param([string]$ServerInstance,[string]$Database,[string]$ModuleName,[string]$Query,[Int32]$QueryTimeout=600)
    $conn=new-object System.Data.SqlClient.SQLConnection
    $conn.ConnectionString=”Server={0};Database={1};Integrated Security=True” -f $ServerInstance,$Database

    Try
    {
        $conn.Open()
        $con = 1
    }
    catch
    {
        $Message = $_.Exception.Message
        $Message = "$Message : $ServerInstance : $Database : $Query"
        $Message
        $con = 0
    }

    if ($con -eq 1)
    {
    
 
        try
        {      
           $cmd=new-object system.Data.SqlClient.SqlCommand($Query,$conn)
           $cmd.CommandTimeout=$QueryTimeout
           $ds=New-Object system.Data.DataSet
           $da=New-Object system.Data.SqlClient.SqlDataAdapter($cmd)
           [void]$da.fill($ds)
           $ds.Tables[0]
           $conn.Close()
        }
        Catch
        {
            $Message = $_.Exception.Message
            $Message = "$Message : $ServerInstance : $Database : $Query"
            #$message | out-file -append -filepath 
            $Message
        }  
    }
}

function generate-inventory($InstanceName,$DestinationRoot,$Environment) 
{
    <#
        .SYNOPSIS
        A function to generate an inventory sheet for a SQL Server instance
        .DESCRIPTION
        Accepts InstanceName and Destination directory.  Function creates a Server smo object and pulls various properties.  
     #>



 
    [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") | Out-Null
    [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SqlWmiManagement") | Out-Null
    $Instance = New-Object('Microsoft.SqlServer.Management.Smo.Server') $InstanceName
    $Server = $Instance.ComputerNamePhysicalNetBIOS

    try
    {
        $PingResult = get-wmiobject win32_pingStatus -f "address = '$Server'"
        $IPAddress = $PingResult.IPV4Address.IPAddressToString
        $os = Get-WmiObject Win32_operatingsystem -ComputerName $Instance.ComputerNamePhysicalNetBIOS
        Add-Member -InputObject $Instance -MemberType NoteProperty -Name OperatingSystem -Value $os.Caption
        Add-Member -InputObject $Instance -MemberType NoteProperty -Name ServicePack -Value $os.CSDVersion
        Add-Member -InputObject $Instance -MemberType NoteProperty -Name IPAddress -Value "$IPAddress"
    }
    catch [System.OutOfMemoryException]
    {
        Add-Member -InputObject $Instance -MemberType NoteProperty -Name OperatingSystem -Value "NA"
        Add-Member -InputObject $Instance -MemberType NoteProperty -Name ServicePack -Value "NA"
        Add-Member -InputObject $Instance -MemberType NoteProperty -Name IPAddress -Value "NA"
    }
        


    Submit-SQLStatement -ServerInstance "PHLDVWSSQL002\DVS1201" -Database "CMS" -ModuleName "generate-inventory" -Query "exec ReportServerIOPS @Show_Max_Transfers = 1, @ServerName = '$Servername'" | % {
        $CollectionDate = $_.CollectionDate
        $MaxTransfers = [system.math]::Round($_."Transfers\Sec",2)
        $Reads = [system.math]::Round($_."Reads\Sec",2)
        $Writes = [system.math]::Round($_."Writes\Sec",2)


    }
        if($CollectionDate -eq $null){$CollectionDate = "NA"}
        if($MaxTransfers -eq $null){$MaxTransfers = "NA"}
        if($Reads -eq $null){$Reads = "NA"}
        if($Writes -eq $null){$Writes = "NA"}

    Add-Member -InputObject $Instance -MemberType NoteProperty -Name MaxTransfers -Value $MaxTransfers
    Add-Member -InputObject $Instance -MemberType NoteProperty -Name MaxTransfersDate -Value $CollectionDate
    Add-Member -InputObject $Instance -MemberType NoteProperty -Name Reads -Value $Reads
    Add-Member -InputObject $Instance -MemberType NoteProperty -Name Writes -Value $Writes
    
    #server information
    $Name = $Instance.InstanceName
    $ServerName = $Instance.ComputerNamePhysicalNetBIOS
    $OS = $Instance.OperatingSystem
    $OSSP = $Instance.ServicePack
    $Memory = [system.math]::Round($Instance.PhysicalMemory/1024) 
    $Memory = "$Memory`GB"
    $Cores = $Instance.Processors
    $MaxTransfersDate = $Instance.MaxTransfersDate
    $MaxIO = $Instance.MaxTransfers
    $ReadsIO = $Instance.Reads
    $WritesIO = $Instance.Writes

    #instance information
    switch -Wildcard ($Instance.VersionMajor.ToString()+"."+($Instance.VersionMinor).ToString())
        {
            "11*"   {$SQLVersion = "2012"}
            "10.5*" {$SQLVersion = "2008 R2"}
            "10.0*" {$SQLVersion = "2008"}
            "9.0*" {$SQLVersion = "2005"}
        }
    $SQLEdition = $Instance.Edition
    $SQLServicePack = $Instance.Information.ProductLevel
    $SQLMaxMemory = [system.math]::Round($Instance.Configuration.MaxServerMemory.RunValue/1024)
    $SQLMaxMemory = "$SQLMaxMemory`GB"
    $ServiceAccount = $Instance.ServiceAccount
    $AgentJobCount = ($Instance.JobServer.Jobs | Where-Object {$_.IsEnabled -eq $true}).Count
    $LinkedServerCount = $Instance.LinkedServers.Count
    $DatabaseCount = $Instance.Databases.Count
    $LoginsCount = $Instance.Logins.Count


    #Check SSIS packages on the filesystem
    $SSISHash = [ordered]@{}
    $SSISCount = 0
    foreach($job in $Instance.JobServer.Jobs)
    {
        foreach($step in $job.JobSteps)
        {
            $stepID = $step.ID
            if($step.command.Contains(".dts"))
            {9
                $out = $InstanceName.Replace("\","`$")
                $location = $step.Command.Substring($step.Command.LastIndexOf("`"",$step.Command.IndexOf(".dts")) + 1,$step.Command.IndexOf("`"",$step.Command.IndexOf(".dts"))-$step.Command.LastIndexOf("`"",$step.Command.IndexOf(".dts")) - 1)
                $SSISHash.Add("$job.Name - Step $StepID",$location)
                copy-ssis -ServerName $ServerName -JobName $Job.Name -StepNum $stepID -File $location -Destination "z:\$out" 
            }
        }

    }
    $SSISCount = $SSISHash.Count



    #SSRS/SSAS existence
    $SSAS = $false
    $SSRS = $false

    if($InstanceName.Contains("\")){
       $Stub = $InstanceName.Substring($InstanceName.IndexOf('\')+1)
       $AgentService = "SQLAgent`$$Stub"
       $SSASService = "MSOLAP`$$Stub"
       $SSRSService = "ReportServer`$$Stub"
    }else{
       $AgentService = 'SQLSERVERAGENT'
       $SSASService = 'MSSQLServerOLAPService'
       $SSRSService = 'ReportServer'
    }


    if(Get-Service -ComputerName $Server -Name $SSASService)
    {
        $SSAS = $true
    }
    if(Get-Service -ComputerName $Server -Name $SSRSService)
    {
        $SSRS = $true
    }
    

    $MountHash = @{}
    Submit-SQLStatement -ServerInstance "PHLDVWSSQL002\DVS1201" -Database "CMS" -ModuleName "Drive" -Query ($DriveQuery -f $ServerName) | % {
        $MountHash.Add($_.MountPoint,$_.SizeInGB)
            
    }
    
    if($InstanceName.IndexOf('\') -gt 0)
    {
        $InstanceStub = $InstanceName.Substring($InstanceName.IndexOf('\')+1)
        $ServerName = $InstanceName.Substring(0,$InstanceName.IndexOf('\'))
    }
    else
    {
        $InstanceStub = 'MSSQLSERVER'
        $ServerName = $InstanceName
    }

    
    $wmi = new-object "Microsoft.SqlServer.Management.Smo.Wmi.ManagedComputer" "$ServerName" -ErrorAction 'Stop'
    try
    {
        $Port=$wmi.ServerInstances["$InstanceStub"].ServerProtocols["Tcp"].IPAddresses["IPAll"].IPAddressProperties["TcpPort"].Value
        if(!$Port)
        {
            $Port=$wmi.ServerInstances["$InstanceStub"].ServerProtocols["Tcp"].IPAddresses["IPAll"].IPAddressProperties["TcpDynamicPorts"].Value
            if(!$Port)
            {
                $Port="Not Found"
            }
            else
            {
                $Port = $Port + ", Dynamic"
            }
        }
    }
    catch
    {
        Submit-SQLStatement $InstanceName 'master' $ModuleName "select local_tcp_port as Port from sys.dm_exec_connections where session_id = @@SPID" | % {
                $Port = $_.Port
                $PortType='UNKNOWN'
        }
    }
    
    




$html = 
@"
<html>
    <head>
    <style>
    body {
        background:#FFFFFF;
    }
    h1 {
        color: #000000;
        font-family: "Trebuchet MS", Helvetica, sans-serif;
        
    }
    table{
        border: 1px solid black;
        border-collapse: collapse;
        text-align: left;
        font-family: "Trebuchet MS", Helvetica, sans-serif;
    }

    
    td, tr th {
        border: 1px solid;
        border-width: 1px;
        border-color: #7DCFC6;
        background: #FAFCFA;
        font-family: "Trebuchet MS", Helvetica, sans-serif;
    }
    #firstrow{
        background-color:#C1F6B9;
    }

    </style>
            <h1>$InstanceName Inventory Sheet</h1>
    </head>
    <body>
        <p>
        <table>
            <tr>
                <th id="firstrow" colspan="2">Server Information</th>
            </tr>           
            <tr>
                <th>ServerName:</th>
                    <td>$ServerName</td>
            </tr>
            <tr>
                <th>Operating System:</th>
                    <td>$OS</td>
            </tr>
            <tr>
                <th>Operating System Service Pack:</th>
                    <td>$OSSP</td>
            </tr>
            <tr>
                <th>IPAddress:</th>
                    <td>$IPAddress</td>
            </tr>
            <tr>
                <th>Server Memory:</th>
                    <td>$Memory</td>
            </tr>
            <tr>
                <th>Processor Core Count:</th>
                    <td>$Cores</td>
            </tr>
            <tr>
                <th>Max Transfers Date</th>
                    <td>$MaxTransfersDate</td>
            </tr>
            <tr>
                <th>Max IO</th>
                    <td>$MaxIO</td>
            </tr>
            <tr>    
                <th>Reads</th>
                    <td>$ReadsIO</td>
            </tr>
            <tr>    
                <th>Writes</th>
                    <td>$WritesIO</td>
            </tr>
        </table>
        <p>
        <table>
            <tr>
                <th id="firstrow" colspan="2">Server Drive Information</th>
            </tr>
            <tr>
                <th>Mount Point</th>
                <th>Size in GB</th>
            </tr>
"@
$MountPointRows = ""
$MountHash.Keys | % {
    $Point = $_
    $PointSize = $MountHash.Item($_)

    $MountPointRows = $MountPointRows + "<tr><td>$Point</td><td>$PointSize</td></tr>"
}

$html = $html + $MountPointRows + 
@"
       </table>
        <p>
        <table>
            <tr>
                <th id="firstrow" colspan="2">SQL Instance Information</th>
            </tr>
            <tr>
                <th>Environment:</th>
                    <td>$Environment</td>
            </tr>
            <tr>
                <th>SQL Version:</th>
                    <td>$SQLVersion</td>
            </tr>
            <tr>
                <th>SQL Edition:</th>
                    <td>$SQLEdition</td>
            </tr>
            <tr>
                <th>Service Pack:</th>
                    <td>$SQLServicePack</td>
            </tr>
            <tr>
                <th>Port:</th>
                    <td>$Port</td>
            </tr>
            <tr>
                <th>Service Account:</th>
                    <td>$ServiceAccount</td>
            </tr>
            <tr>
                <th>Max Memory Setting:</th>
                    <td>$SQLMaxMemory</td>
            </tr>
            <tr>
                <th>Database Count:</th>
                    <td>$DatabaseCount</td>
            </tr>
            <tr>
                <th>Agent Job Count:</th>
                    <td>$AgentJobCount</td>
            </tr>
            <tr>
                <th>Linked Server Count:</th>
                    <td>$LinkedServerCount</td>
            </tr>
            <tr>
                <th>SSIS Package Count:</th>
                    <td>$SSISCount</td>
            </tr>
            <tr>
                <th>Logins Count:</th>
                    <td>$LoginsCount</td>
            </tr>
            <tr>
                <th>Analysis Services:</th>
                    <td>$SSAS</td>
            </tr>
                        <tr>
                <th>Reporting Services:</th>
                    <td>$SSRS</td>
            </tr>
        </table>
        <p>
        <h2>Server Level Objects</h2>
        <table>
            <tr>
                <th id="firstrow" colspan="2">Linked Servers</th>
            <tr>
            <tr>
                <th>Name</th>
                <th>Type</th>
            </tr>
"@
$LinkedDataRows =""
foreach($linkedServer in $Instance.LinkedServers)
{
    $LinkedServerName = $linkedserver.Name
    $LinkedServerType = $linkedserver.ProductName
    $LinkedDataRows = $LinkedDataRows + "<tr><td>$LinkedServerName</td><td>$LinkedServerType</td></tr>"
}

$html = $html + $LinkedDatarows + 
@"

        </table>
        <p>
        <table>
            <tr>
                <th id="firstrow" colspan="2">SQL Agent Jobs</th>
            <tr>
            <tr>
                <th>Name</th>
                <th>PackageLocation</th>
            </tr>
"@
$AgentDataRows = ""
foreach($agentjob in $Instance.JobServer.Jobs | Where-Object {$_.IsEnabled -eq $true})
{
    $JobName = $agentjob.name
    $JobCategory = $agentjob.Category
    $PackageLocation = $SSISHash.Item($JobName)
    $AgentDataRows = $AgentDataRows + "<tr><td>$JobName</td><td>$JobCategory</td></tr>"
}
$html = $html + $AgentDataRows + 
@"

        </table>
        <p>
        <table>
            <tr>
                <th id="firstrow" colspan="3">SSIS Packages</th>
            <tr>
            <tr>
                <th>Job Step</th>
                <th>Package Location</th>
            </tr>
"@
$SSISRows = ""
foreach($h in $SSISHash.Keys)
{
    $HName = $h
    $HLocation = $SSISHash.Item($h)
    $SSISRows = $SSISRows + "<tr><td>$HName</td><td>$HLocation</td></tr>"
}
$html = $html + $SSISRows + 
@"

        </table>
        <p>
        <table>
            <tr>
                <th id="firstrow" colspan="3">Databases</th>
            <tr>
            <tr>
                <th>Name</th>
                <th>Recovery Model</th>
                <th>Size in MB</th>
            </tr>
"@
$DatabaseRows = ""
foreach($db in $Instance.Databases | Where-Object {$_.IsSystemObject -eq $false})
{
    $DatabaseName = $db.Name
    $RecoveryModel = $db.RecoveryModel
    $Size = $db.Size
    $DatabaseRows = $DatabaseRows + "<tr><td>$DatabaseName</td><td>$RecoveryModel</td><td>$Size</td></tr>"
}
$html = $html + $DatabaseRows + 
@"
        </table>
    </body>
</html>
"@
        $InstanceRoot = $InstanceName.Replace("\","`$")

        $File = "$DestinationRoot\$InstanceRoot`_Inventory.html"

        Set-Content -Path $File -Value $html

}

function create-instanceobject
{
    param
    (
        [parameter(mandatory=$true)]
        [string]$InstanceName
    )

    $Instance = New-Object -TypeName PSObject
    Add-Member -InputObject $Instance -MemberType NoteProperty -Name ServerName -Value $InstanceName.Substring(0,$InstanceName.IndexOf("\"))
    Add-Member -InputObject $Instance -MemberType NoteProperty -Name InstanceName -Value $InstanceName

    $os = Get-WmiObject Win32_operatingsystem -ComputerName $Instance.ServerName
    $mem = Get-WmiObject Win32_ComputerSystem -ComputerName $Instance.ServerName
    $TotalMemory = [system.math]::Round($mem.TotalPhysicalMemory/1024/1024/1024)

    Add-Member -InputObject $Instance -MemberType NoteProperty -Name OperatingSystem -Value $os.Caption
    Add-Member -InputObject $Instance -MemberType NoteProperty -Name ServicePack -Value $os.CSDVersion
    Add-Member -InputObject $Instance -MemberType NoteProperty -Name PhysicalMemory  -Value "$TotalMemory`GB"

    Submit-SQLStatement -ServerInstance $InstanceName -Database "master" -ModuleName "create-instanceobject" -query ""

    return $Instance
}

function copy-ssis 
{
    param(
        [Parameter(Mandatory=$true)]
        [string]$ServerName,
        [string]$JobName,
        [int]$StepNum,
        [string]$File,
        [string]$Destination
    )

    #removes invalid characters from job name
    $JobName = $JobName | Remove-InvalidFileNameChars

    $Step = "Step $StepNum"

    
    #get unc path
    if($File.Substring(0,2) -ne "\\")
    {
        $File = $File -replace ':','$'
        $File = "\\$ServerName\$File"
    }
    
    if(!(Test-Path $File))
    {
        write-output "$File not found. Exiting."
        return
    }
    
    #add SSIS folder under Agent folder
    $dir = $Destination + "\Agent\SSIS"
    if(!(Test-Path $dir))
    {
        New-Item -Path $dir -ItemType directory
    }

    #Update directory and add folder for job if it does not exist
    $dir = $dir + "\$JobName"
    if(!(Test-Path $dir))
    {
        New-Item -Path $dir -ItemType directory
    }

    #update directory and add folder for job step if it does not exist
    $dir = $dir + "\$Step"
    if(!(Test-Path $dir))
    {
        New-Item -Path $dir -ItemType directory
    }
    
    $OutFile = $File.Substring($File.LastIndexOf("\",$File.IndexOf(".dts")) + 1)
    $OutFile = "$dir\$OutFile"

    #If outfile exists, deleted before copying
    if(Test-Path $OutFile)
    {
        Remove-Item $OutFile 
    }

    Copy-Item -Path $File -Destination $OutFile


}


Function Remove-InvalidFileNameChars {
  param(
    [Parameter(Mandatory=$true,
      Position=0,
      ValueFromPipeline=$true,
      ValueFromPipelineByPropertyName=$true)]
    [String]$Name
  )

  $invalidChars = [IO.Path]::GetInvalidFileNameChars() -join ''
  $re = "[{0}]" -f [RegEx]::Escape($invalidChars)
  return ($Name -replace $re)
}

function Report-ServerGroups ($ServerName,$Destination) {

    $server=$ServerName
    $computer = [ADSI]"WinNT://$server,computer"
    $outfile = "$Destination\AD_GroupReport.txt"
    $content = ""
    $computer.psbase.children | where { $_.psbase.schemaClassName -eq 'group' } | foreach {
        $GroupName = $_.name
        $content = $content + "`n$GroupName `n"
        $content = $content + "------ `n"
        $group =[ADSI]$_.psbase.Path
        $group.psbase.Invoke("Members") | foreach {$content = $content + $_.GetType().InvokeMember('Name', 'GetProperty', $null, $_, $null) + "`n"}
    } 
     Out-File -FilePath $outfile -InputObject $content
}