Function Script-Instance {

    param(
        [parameter(mandatory=$true)]
        [string]$InstanceName,
        [parameter(mandatory=$true)]
        [string]$DestinationRoot
    )

    process
    {
        $AgentArray = @("Alerts","Operators","ProxyAccounts","Jobs")
        $DatabaseArray = @("Schemas","Tables","Views","StoredProcedures","Synonyms","UserDefinedFunctions","Triggers","Assemblies","UserDefinedDataTypes","UserDefinedTableTypes","UserDefinedTypes","XMLSchemaCollections")


        
        

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

        #Script out all SQL Server Agent Objects
        $AgentObject = $InstanceObject.JobServer
        if($AgentObject){
            $AgentDir = $WorKDir + "\Agent"
            if(!(Test-Path -Path $AgentDir)){
                New-Item $AgentDir -ItemType directory 
            }
          ForEach ($item in $AgentArray){
              $retval = script-object $AgentObject $item $AgentDir
              if((test-path "$AgentDir\$item") -and $retval -eq 1){
                   Consolidate-Files $item "$AgentDir\$item"
              }
           }
        }

        #Script out all SQL Server Agent Objects
        $LinkedServerObject = $InstanceObject.LinkedServers
        if($LinkedServerObject){
            $LinkedServerDir = $WorKDir + "\LinkedServers"
            $retval = script-object $InstanceObject LinkedServers $WorkDir
              if((test-path "$LinkedServerDir\$item") -and $retval -eq 1){
                   Consolidate-Files $item "$LinkedServerDir\$item"
              }
        }
    
        #Build the databases
        $InstanceObject.Databases | where-object -FilterScript {$_.Name -ne 'tempdb'} |
        ForEach-Object{
            $CurrentDatabase = $_
            $DatabaseName = $CurrentDatabase.Name
  
            #Check For existence of database subfolder
            $DBWorkDir = $DestinationRoot + $InstanceName + "\Databases\" + $DatabaseName
            if(!(Test-Path -Path $DBWorkDir)){
                New-Item $DBWorkDir -ItemType directory 
            }  

            #Script Database
            $CurrentDatabase.Script() | out-file "$DBWorkDir\$DatabaseName.sql"

            ForEach ($Item in $DatabaseArray){
               $retval = script-object $CurrentDatabase $Item $DBWorkDir
                if((test-path "$DBWorkDir\$item") -and $retval -eq 1){
                   Consolidate-Files $item "$DBWorkDir\$item"
                }
            }
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
            $File = "$Dir" + "\" + $Name + ".sql"
            if(!(Test-Path $File)){
                $Scriptor.Options.FileName = $File
                $Scriptor.EnumScript($_)
                (Get-Content $File | Select-Object -Skip 1) | Set-Content $File
                $ChangeFlag = 1
            }Else{
                $TmpFile = "$File.TMP"
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
                }
                
            }
        } #Tables
        Return $ChangeFlag
    }
}

<#
.SYNOPSIS
    Gets the hash value
    
.DESCRIPTION
    Gets the hash value of a file or string
    It uses System.Security.Cryptography.HashAlgorithm (http://msdn.microsoft.com/en-us/library/system.security.cryptography.hashalgorithm.aspx)
    and FileStream Class (http://msdn.microsoft.com/en-us/library/system.io.filestream.aspx)
    
    Written by Josep Martínez Vilà: http://dbadailystuff.com/2013/03/11/get-hash-a-powershell-hash-function/
    Based on: http://blog.brianhartsock.com/2008/12/13/using-powershell-for-md5-checksums/ and some ideas on Microsoft Online Help

.PARAMETER File
    File to get the hash from.
    
.PARAMETER Text
    Text string to get the hash from
    
.PARAMETER Algorithm
    Type of hash algorithm to use. Default is SHA1
    
.EXAMPLE
    C:\PS> Get-Hash "myFile.txt"
    Gets the SHA1 from myFile.txt file. When there's no explicit parameter, it uses -File

.EXAMPLE    
    Get-Hash -File "C:\temp\myFile.txt"
    Gets the SHA1 from myFile.txt file
    
.EXAMPLE
    C:\PS> Get-Hash -Algorithm "MD5" -Text "Hello Wold!" 
    Gets the MD5 from a string
       
.EXAMPLE
    C:\PS> "Hello Wold!" | Get-Hash
    We can pass a string throught the pipeline    
 ##>
function Get-Hash
{
    Param
    (
        [parameter(Mandatory=$true, ValueFromPipeline=$true, ParameterSetName="set1")]
        [String]
        $text,
        [parameter(Position=0, Mandatory=$true, ValueFromPipeline=$false, ParameterSetName="set2")]
        [String]
        $file = "",
        [parameter(Mandatory=$false, ValueFromPipeline=$false)]
        [ValidateSet("MD5", "SHA", "SHA1", "SHA-256", "SHA-384", "SHA-512")]
        [String]
        $algorithm = "SHA1"
    )

    Begin
    {
        $hashAlgorithm = [System.Security.Cryptography.HashAlgorithm]::Create($algorithm)
    }
	Process
	{
        $md5StringBuilder = New-Object System.Text.StringBuilder 50
        $ue = New-Object System.Text.UTF8Encoding 

        if ($file){
            try {
                if (!(Test-Path $file)){
                    throw "Test-Path returned false."
                }
            }
            catch {
                throw "Get-Hash - File not found or without permisions: [$file]. $_"
            } 

            try {        
                [System.IO.FileStream]$fileStream = [System.IO.File]::Open($file, [System.IO.FileMode]::Open);
                $hashAlgorithm.ComputeHash($fileStream) | % { [void] $md5StringBuilder.Append($_.ToString("x2")) }
            }
            catch {
                throw "Get-Hash - Error reading or hashing the file: [$file]"
            } 
            finally {
                $fileStream.Close()
                $fileStream.Dispose()
            }
        }
        else {
            $hashAlgorithm.ComputeHash($ue.GetBytes($text)) | % { [void] $md5StringBuilder.Append($_.ToString("x2")) }
        }
        
        return $md5StringBuilder.ToString()
    }
}