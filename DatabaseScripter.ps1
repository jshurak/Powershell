<#
    Script loops though a sql server instance to script individual database objects into individual sql fies.  
#>
#For initial build user local server - will need to change to grab all servers
$InstanceName = 'SHURAK-DT'
$DestinationRoot = 'C:\Users\jshurak\Development\DMS\SQL\'


#$ErrorActionPreference = 'SilentlyContinue'
$ModuleName = 'DatabaseScripter'
$RunDate = get-date -format 'yyyyMMdd'



#These items should move to a separate file
[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SMO") | Out-Null


write-host "Processing $InstanceName"
# new instance object -  Initialize the instance
$InstanceObject = New-Object ('Microsoft.SqlServer.Management.Smo.Server') -argumentlist $InstanceName
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

#Create WorkDir, check for existance and create if not 
$WorkDir = $DestinationRoot + $InstanceName
if(!(Test-Path -Path $WorkDir)){
    New-Item $WorkDir -ItemType directory 
}

#Build the databases
$InstanceObject.Databases |
ForEach-Object{
    $CurrentDatabase = $_

    $DatabaseName = $CurrentDatabase.Name

    write-host "Processing $DatabaseName"
    
    #Check For existence of database subfolder
    $DBWorkDir = $DestinationRoot + $InstanceName + "\" + $DatabaseName
    if(!(Test-Path -Path $DBWorkDir)){
        New-Item $DBWorkDir -ItemType directory 
    }

    #Script Database
    $CurrentDatabase.Script() | out-file "$DBWorkDir\$DatabaseName.sql"

    #Process Schemas - curr
    $SWorkDir = $DBWorkDir + "\Schemas" 
    $CurrentDatabase.Schemas | Where-Object -filterscript {$_.isSystemObject -eq 0} |
    ForEach-Object {
        if(!(Test-Path -Path $SWorkDir)){
            New-Item $SWorkDir -ItemType directory 
        }
        $Scriptor.Options.FileName = "$SWorkDir" + "\" + $_.name + ".sql"
        $Scriptor.EnumScript($_)
           #$File = "$WorkDir" + "\" + $_.name + ".sql"
           #$_.script() | out-file $File
    } #Tables
    # End table processessing 

    
    #Process Tables - curr
    $TWorkDir = $DBWorkDir + "\Tables" 
    $CurrentDatabase.Tables | Where-Object -filterscript {$_.isSystemObject -eq 0} |
    ForEach-Object {
        if(!(Test-Path -Path $TWorkDir)){
            New-Item $TWorkDir -ItemType directory 
        }
        $Scriptor.Options.FileName = "$TWorkDir" + "\" + $_.name + ".sql"
        $Scriptor.EnumScript($_)
           #$File = "$WorkDir" + "\" + $_.name + ".sql"
           #$_.script() | out-file $File
    } #Tables
    # End table processessing 

    #Begin View Processessing
    #Create view folder
    $VWorkDir = $DBWorkDir + "\Views" 
    $CurrentDatabase.Views| Where-Object -filterscript {$_.isSystemObject -eq 0} |
    ForEach-Object {
        if(!(Test-Path -Path $VWorkDir)){
            New-Item $VWorkDir -ItemType directory 
        }
        $Scriptor.Options.FileName = "$VWorkDir" + "\" + $_.name + ".sql"
        $Scriptor.EnumScript($_)
           #$File = "$WorkDir" + "\" + $_.name + ".sql"
           #$_.script() | out-file $File
    } #Views
    # End View processessing 

    #Begin Stored Procedure Processessing
    #Create view folder
    $SPWorkDir = $DBWorkDir + "\SP" 
    $CurrentDatabase.StoredProcedures| Where-Object -filterscript {$_.isSystemObject -eq 0} |
    ForEach-Object {
        if(!(Test-Path -Path $SPWorkDir)){
            New-Item $SPWorkDir -ItemType directory 
        }
        $Scriptor.Options.FileName = "$SPWorkDir" + "\" + $_.name + ".sql"
        $Scriptor.EnumScript($_)
           #$File = "$WorkDir" + "\" + $_.name + ".sql"
           #$_.script() | out-file $File
    } #Views
    # End Stored Procedure processessing 

    #Begin Functions Processessing
    #Create view folder
    $FWorkDir = $DBWorkDir + "\UDF" 
    $CurrentDatabase.UserDefinedFunctions | Where-Object -filterscript {$_.isSystemObject -eq 0} |
    ForEach-Object {
        if(!(Test-Path -Path $FWorkDir)){
            New-Item $FWorkDir -ItemType directory 
        }
        $Scriptor.Options.FileName = "$FWorkDir" + "\" + $_.name + ".sql"
        $Scriptor.EnumScript($_)
           #$File = "$WorkDir" + "\" + $_.name + ".sql"
           #$_.script() | out-file $File
    } #Views
    # End Stored Procedure processessing 


    #Begin Triggers Processessing
    
    $TWorkDir = $DBWorkDir + "\Triggers" 
    $CurrentDatabase.Triggers | Where-Object -filterscript {$_.isSystemObject -eq 0} |
    ForEach-Object {
        if(!(Test-Path -Path $TWorkDir)){
            New-Item $TWorkDir -ItemType directory 
        }
        $Scriptor.Options.FileName = "$TWorkDir" + "\" + $_.name + ".sql"
        $Scriptor.EnumScript($_)
           #$File = "$WorkDir" + "\" + $_.name + ".sql"
           #$_.script() | out-file $File
    } 
    # End Trigger processessing 

    #Begin Assemblies Processessing
    
    $AWorkDir = $DBWorkDir + "\Assemblies" 
    $CurrentDatabase.Assemblies | Where-Object -filterscript {$_.isSystemObject -eq 0} |
    ForEach-Object {
        if(!(Test-Path -Path $AWorkDir)){
            New-Item $AWorkDir -ItemType directory 
        }
        $Scriptor.Options.FileName = "$AWorkDir" + "\" + $_.name + ".sql"
        $Scriptor.EnumScript($_)
           #$File = "$WorkDir" + "\" + $_.name + ".sql"
           #$_.script() | out-file $File
    } 
    # End Assemblies processessing 

    #Begin UserDefinedDataTypes Processessing
    $UDDTWorkDir = $DBWorkDir + "\Types\UserDefinedDataTypes" 
    $CurrentDatabase.UserDefinedDataTypes | Where-Object -filterscript {$_.isSystemObject -eq 0} |
    ForEach-Object {
        if(!(Test-Path -Path $UDDTWorkDir)){
            New-Item $UDDTWorkDir -ItemType directory 
        }
        $Scriptor.Options.FileName = "$UDDTWorkDir" + "\" + $_.name + ".sql"
        $Scriptor.EnumScript($_)
           #$File = "$WorkDir" + "\" + $_.name + ".sql"
           #$_.script() | out-file $File
    } 
    # End UserDefinedDataTypes processessing 

} #end database objects

