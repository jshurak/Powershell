#. "C:\Users\jshurak\Desktop\GitHub\kmhp_dms\lib\config.ps1"
. "C:\Users\jshurak\Desktop\GitHub\Powershell\SQLServer_Migration_Assistant.ps1"

Submit-SQLStatement -ServerInstance "PHLDVWSSQL002\DVS1201" -Database "CMS" -Query "SELECT InstanceName,Environment FROM MonitoredInstances WHERE Deleted = 0 and MonitorInstance = 1" | % {

    
    script-server -InstanceName $_.InstanceName -DestinationRoot "\\kmhpemcfspa21\ISTSG\TSG\nsg\Database_Unix_SA\Database Administration Team\MSSQL Admin\Virtualization Effort\DesignPlanning\ServerScripts" -Environment $_.Environment

}