function sql-fileMaintenance ($InstanceName) {

    
    
    [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") | Out-Null

    $InstanceObject = New-Object ('Microsoft.SqlServer.Management.Smo.Server') -argumentlist $InstanceName

    foreach($db in $InstanceObject.Databases | where-object {$_.isSystemObject -eq 0})
    {
        foreach($filegroup in $db.filegroups)
        {
            foreach($file in $filegroup.files)
            {
                if($file.MaxSize -eq -1)
                {
                    Write-Output "Changing MaxSize and growth for $db.Name"
                    $file.MaxSize = 10240000
                    $file.Growth = 102400
                    $file.Alter()
                }
            }
        }
        foreach($log in $db.LogFiles)
        {
            if($log.MaxSize -eq 2147483648)
            {
                write-output "Changing the log file properties for $db.Name"
                $log.GrowthType = "KB"
                $log.Growth = 100000
                $log.MaxSize = 1000000
                $log.Alter()
            }
        }  
    } 


}