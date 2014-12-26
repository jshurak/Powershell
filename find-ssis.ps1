[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") | Out-Null
$InstanceObject = New-Object ('Microsoft.SqlServer.Management.Smo.Server') -argumentlist "SQL2008R2RPT\RPT"

$SSISHash = [ordered]@{}
$SSISCount = 0

foreach($job in $InstanceObject.JobServer.Jobs)
{
 
    foreach($step in $job.JobSteps)
    {
        $id = $step.ID
        if($step.command.Contains(".dts"))
        {
            
            $location = $step.Command.Substring($step.Command.LastIndexOf("`"",$step.Command.IndexOf(".dts")) + 1,$step.Command.IndexOf("`"",$step.Command.IndexOf(".dts"))-$step.Command.LastIndexOf("`"",$step.Command.IndexOf(".dts")) - 1)
            $SSISHash.Add("$job.Name - Step $id",$location)
        }
    }

}
$SSISHash.Count
foreach($h in $SSISHash.Keys)
{
    
    Write-Output $h $SSISHash.Item($h)
}