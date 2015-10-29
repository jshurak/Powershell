
<#
    .SYNOPSIS
    A function to generate netbackup restore scripts. It requires a DatabaseRestoreList.txt file containing all the databases to be restored.
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
    [string]$SourceInstance,  
    [string]$TargetInstance
)

function Get-ScriptDirectory
{
    Split-Path $script:MyInvocation.MyCommand.Path
}
function Get-ServerFromInstance($InstanceName)
{
    if($InstanceName.IndexOf('\') -gt 0)
    {
        $ServerName =  $InstanceName.Substring(0,$InstanceName.IndexOf('\'))
    }
    else
    {
        $ServerName = $InstanceName
    }
    return $ServerName
}
function Get-NamedInstance($InstanceName)
{
    $Stub = $InstanceName.Substring($InstanceName.IndexOf('\')+1)
    Return $Stub
}
    
    $SourceHost = Get-ServerFromInstance $SourceInstance
    $TargetHost = Get-ServerFromInstance $TargetInstance
    if($InstanceName.IndexOf('\') -gt 0)
    {
        $SourceInstance = Get-NamedInstance $SourceInstance
    }


    #Get the list of databases to restore
            
    $Location = Get-ScriptDirectory
    $DBList = get-content "$Location\DatabaseRestoreList.txt"


    #Get the most recent Sunday. this will be the latest full backup date
    $MostRecentSunday = (get-date).AddDays(-(get-date).DayOfWeek.value__)

            
    #Get the last Sunday of the month.  This will help determine the policy used
    $DaysInMonth = [datetime]::DaysInMonth((get-date).Year,($MostRecentSunday).month)
    ($DaysInMonth)..($DaysInMonth - 7) | % {
        if((get-date -Year (get-date).Year -Month ($MostRecentSunday).Month -Day $_).DayOfWeek -eq 0)
        {
            $LastSundayOfTheMonth = (get-date -Year (get-date).Year -Month ($MostRecentSunday).Month -Day $_)
        }             
    }

    #Determine the Full Policy to use
    if($MostRecentSunday.ToShortDateString() -eq $LastSundayOfTheMonth.ToShortDateString())
    {
        $NBUFullPolicy = 'MS-SQL_Prod_Monthly'
    }
    else
    {
        $NBUFullPolicy = 'MS-SQL_Prod_Weekly'
    }

    #Create Empty Database HashTable
    $DatabaseHash = @{}

    #Create Policy HashTable
    $PolicyHash = @{}
    if((Get-Date).DayOfWeek.value__ -gt 0)
    {
        $PolicyHash.Add('MS-SQL_Prod_Daily',(get-date).ToShortDateString())
    }
    $PolicyHash.Add($NBUFullPolicy,$MostRecentSunday.ToShortDateString())
            
    #Start the process of building the list
    $Path = "\\$TargetHost\c$\Program Files\VERITAS\NetBackup\bin\bplist.exe"
    $BatchPath = "\\$TargetHost\c$\Program Files\VERITAS\NetBackup\DbExt\MsSql\Daily_Restore.bch"
    $NBUMaster = 'RDGNBMS01'
    if(Test-Path -Path $BatchPath)
    {
        Remove-Item -Path $BatchPath
    }
    New-Item -Path $BatchPath -ItemType File

    $PolicyHash.Keys | % {

        $Policy = $_
        $Date = $PolicyHash.Item($_)
        $Results = ''
        $Results = Invoke-Expression "& `"$Path`" -C $SourceHost -S $NBUMaster -t 15 -R -k `"$Policy`" -s $Date `\" 
        $Results = $Results | select -Unique | Where-Object{$_ -like '*001of*' -and $_ -notlike '*msdb*' -and $_ -notlike '*master*' -and $_ -notlike '*model*'}

        if($DatabaseHash.Count -eq 0)
        {
            foreach ($r in $Results) 
            {
                $Database = $r.Substring($r.IndexOf('db') + 3,$r.Substring($r.IndexOf('db') + 3).IndexOf('.'))
                $DatabaseHash.Add($Database,@($r))
            }  
        }
        else
        {
            foreach ($r in $Results) 
            {
                $Database = $r.Substring($r.IndexOf('inc') + 4,$r.Substring($r.IndexOf('inc') + 4).IndexOf('.'))
                $DatabaseHash.$Database += $r
            }
        }
    }

    #Remove Databases from Hash table that are not in the DatabaseRestoreList.txt
    $RemovalList = New-Object System.Collections.ArrayList
    $DatabaseHash.Keys | % {
        $Restore = 0
        $DatabaseName = $_
        ForEach($db in $DBList)
        {
            if($db -eq $DatabaseName)
            {
                $Restore = 1
            }
        }
        if($Restore -eq 0)
        {
            $RemovalList.Add($DatabaseName)
        }
    }
    ForEach($db in $RemovalList)
    {
        $DatabaseHash.Remove($db)
    }

    $DatabaseHash.Keys | % {
        $DatabaseName = $_
        $i = 1
        $BackupFiles = $DatabaseHash.Item($_)
        foreach($Image in $BackupFiles)
        {
            $Image = $Image.Substring(0,$Image.IndexOf(':'))
            $FileCount = $BackupFiles.Count
            if($FileCount -eq $i)
            {
                $RecoveryState = 'RECOVERED'
            }
            else
            {
                $RecoveryState = 'NOTRECOVERED'
            }

            $Template = @"
OPERATION RESTORE
OBJECTTYPE DATABASE
DATABASE "$DatabaseName"
NBIMAGE "$Image"
SQLHOST "$TargetHost"
NBSERVER "$NBUMaster"
STRIPES 004
BROWSECLIENT "$SourceHost"
MAXTRANSFERSIZE 6
BLOCKSIZE 7
RESTOREOPTION REPLACE
RECOVEREDSTATE $RecoveryState
NUMBUFS 2
ENDOPER TRUE

"@
            Add-Content -Value $Template -Path $BatchPath
                    
            $i += 1
                    
        }
            
    }
                                 
