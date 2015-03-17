Submit-SQLStatement -ServerInstance "PHLDVWSSQL002\DVS1201" -Database "CMS_P" -Query "exec dbo.MonitoredDatabases_GetDatabases @ModuleName = 'gather-diffsizes'" | % {
  
    find-diffsize -ServerID $_.ServerID -InstanceName $_.InstanceName -InstanceID $_.InstanceID -DatabaseName $_.DatabaseName -DatabaseGUID $_.DatabaseGUID    
}