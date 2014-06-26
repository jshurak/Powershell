param(
    [Parameter(Mandatory=$True)]
    [ValidateScript({Test-Path $_ -PathType 'Container'})] 
    [string]$Source,
    [Parameter(Mandatory=$True)]
    [ValidateScript({Test-Path $_ -PathType 'Container'})] 
    [string]$Destination
    
    )


process{

}
