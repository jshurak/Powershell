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
            [string]$UtilityDatabase
        )

        Process
        {

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
select 'exec sp_CONFIGURE ''show advanced options'', 0' 
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

            $ErrorActionPreference = "SilentlyContinue"
            [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") | Out-Null
            


            $InstanceObject = New-Object ('Microsoft.SqlServer.Management.Smo.Server') -argumentlist $InstanceName
            $ServerName = $InstanceObject.ComputerNamePhysicalNetBIOS

            $InstanceRoot = $InstanceName.Replace("\","`$")

            if([string]::IsNullOrEmpty($UtilityDatabase))
            {
                $UtilityDatabase = "Master"
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
            generate-inventory -InstanceName $InstanceName -DestinationRoot $WorkDir
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
            if(!(Test-Path $File))
            {
                New-Item -Path "$File" -ItemType file
            }

            Get-ChildItem -Path $DestinationRoot -Recurse | Where-Object {$_.Name -like "__All*"} | % {
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
        $message = $_.Exception.Message
        $Message = "$Message : $ServerInstance : $Database : $Query"
        #$message | out-file -append -filepath 
        log-message $ModuleName $message
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
            $message = $_.Exception.Message
            $Message = "$Message : $ServerInstance : $Database : $Query"
            #$message | out-file -append -filepath 
            log-message $ModuleName $message
        }  
    }
}

function generate-inventory($InstanceName,$DestinationRoot) 
{
    <#
        .SYNOPSIS
        A function to generate an inventory sheet for a SQL Server instance
        .DESCRIPTION
        Accepts InstanceName and Destination directory.  Function creates a Server smo object and pulls various properties.  
     #>

    [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") | Out-Null
    $Instance = New-Object('Microsoft.SqlServer.Management.Smo.Server') $InstanceName

    $os = Get-WmiObject Win32_operatingsystem -ComputerName $Instance.ComputerNamePhysicalNetBIOS
    Add-Member -InputObject $Instance -MemberType NoteProperty -Name OperatingSystem -Value $os.Caption
    Add-Member -InputObject $Instance -MemberType NoteProperty -Name ServicePack -Value $os.CSDVersion

    Submit-SQLStatement -ServerInstance "PHLDVWSSQL002\DVS1201" -Database "CMS" -ModuleName "generate-inventory" -Query "exec ReportServerIOPS @Show_Max_Transfers = 1, @ServerName = '$InstanceName'" | % {
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
    $AgentJobCount = ($Instance.JobServer.Jobs | Where-Object {$_.IsEnabled -eq $true}).Count
    $LinkedServerCount = $Instance.LinkedServers.Count
    $DatabaseCount = $Instance.Databases.Count
    $LoginsCount = $Instance.Logins.Count


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
                <th id="firstrow" colspan="2">SQL Instance Information</th>
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
                <th>Logins Count:</th>
                    <td>$LoginsCount</td>
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
                <th>Category</th>
            </tr>
"@
$AgentDataRows = ""
foreach($agentjob in $Instance.JobServer.Jobs | Where-Object {$_.IsEnabled -eq $true})
{
    $JobName = $agentjob.name
    $JobCategory = $agentjob.Category
    $AgentDataRows = $AgentDataRows + "<tr><td>$JobName</td><td>$JobCategory</td></tr>"
}

$html = $html + $AgentDataRows + 
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