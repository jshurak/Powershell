    [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") | Out-Null

    $InstanceName = "PHLDVWSSQL002\DVS1201"
    $Instance = New-Object('Microsoft.SqlServer.Management.Smo.Server') $InstanceName
    $Server = $Instance.ComputerNamePhysicalNetBIOS
    
    

    $Result = $NULL
    $Status = $NULL
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
        Write-Output "SSAS found."
    }
    else 
    {
        Write-Output "SSAS not found."
    }
    if(Get-Service -ComputerName $Server -Name $SSRSService)
    {
        Write-Output "SSRS found."
    }
    else 
    {
        Write-Output "SSRS not found."
    }