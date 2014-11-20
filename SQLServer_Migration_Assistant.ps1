﻿Function script-server
{
        <#
         .SYNOPSIS
            A function to generate SQL scripts for server level objects.
         .DESCRIPTION
            User inputs the Instance name and an optional destination directory.  For scripting logins the sp_help_rev_login stored procedure should exist on the server. A database
            name can be supplied for the optional $UtilityDatabase parameter for special location. It will default to the Master database.
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

exec sp_configure 'show advanced options',0
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
            $LoginsFile = $LoginsDir + "\Logins.sql"
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
            $ConfigFile = $ConfigDir + "\Config.sql"
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

function generate-inventory 
{
        param
        (
            [parameter(mandatory=$true)]
            [string]$InstanceName,  
            [string]$DestinationRoot
        )
    
$html = 
@"
<html>
    <head>
            $InstanceName Inventory Sheet
    </head>
    <body>
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

    Add-Member -InputObject $Instance -MemberType NoteProperty -Name OperatingSystem -Value $os.Caption
    Add-Member -InputObject $Instance -MemberType NoteProperty -Name ServicePack -Value $os.CSDVersion
    

    $Instance
}