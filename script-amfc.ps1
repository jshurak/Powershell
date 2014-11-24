. "C:\Users\jshurak\Desktop\GitHub\kmhp_dms\lib\config.ps1"
. "C:\Users\jshurak\Desktop\GitHub\Powershell\SQLServer_Migration_Assistant.ps1"

Submit-SQLStatement -ServerInstance $CMSServer -Database $CMSProdDB -Query "SELECT InstanceName FROM MonitoredInstances WHERE Deleted = 0 " | % {

    script-server -InstanceName $_.InstanceName -DestinationRoot "c:\ServerScripts"

}