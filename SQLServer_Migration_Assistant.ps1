Function script-server
{
        param
        (
            [parameter(mandatory=$true)]
            [string]$InstanceName,  
            [string]$DestinationRoot
        )

        Process
        {
            $ErrorActionPreference = "SilentlyContinue"
            [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") | Out-Null
            


            $InstanceObject = New-Object ('Microsoft.SqlServer.Management.Smo.Server') -argumentlist $InstanceName
            $ServerName = $InstanceObject.ComputerNamePhysicalNetBIOS

            $InstanceRoot = $InstanceName.Replace("\","`$")


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
                New-Item $LoginsFile -ItemType file
            }
            $handler = [System.Data.SqlClient.SqlInfoMessageEventHandler] {param($sender, $event) Out-File -Append -filepath $LoginsFile -inputobject $event.Message };
            $SqlConnection = new-Object System.Data.SqlClient.SqlConnection("Server=$InstanceName;DataBase=master;Integrated Security=SSPI")
            $SqlConnection.add_InfoMessage($handler); 
            $SqlConnection.FireInfoMessageEventOnUserErrors = $true;
            $cmd = new-Object System.Data.SqlClient.SqlCommand("dbo.sp_help_revlogin", $SqlConnection)
            $cmd.CommandType = [System.Data.CommandType]'StoredProcedure'
            $SqlConnection.Open()
            $cmd.ExecuteNonQuery() | Out-Null
            $SqlConnection.Close()
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