﻿function copy-file {
    param(
        [Parameter(Mandatory=$True)]
        [ValidateScript({Test-Path $_ -PathType 'Container'})] 
        [string]$Source,
        [Parameter(Mandatory=$True)]
        [ValidateScript({Test-Path $_ -PathType 'Container'})] 
        [string]$Destination,
        [string]$FileExtension
    
        )
        <#
        .Synopsis
            Simple script to recursively copy files from one directory to another
        #>

    process{
        $Filter = "*.$FileExtension"

	get-childitem -Recurse -Path $Destination -Filter $Filter | remove-item	

        Get-ChildItem -Recurse -Path $Source -Filter $Filter | % {
            write-output $_.FullName
            Copy-Item -Path $_.FullName -Destination $Destination
        }    
    }

}