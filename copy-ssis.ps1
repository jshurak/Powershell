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