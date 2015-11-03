#. "C:\Users\jshurak\Desktop\GitHub\kmhp_dms\lib\config.ps1"
. "C:\Users\jshurak\Desktop\GitHub\Powershell\SQLServer_Migration_Assistant.ps1"

Submit-SQLStatement -ServerInstance "phldvwsidsql001" -Database "CMS" -Query "SELECT InstanceName,Environment FROM MonitoredInstances WHERE Deleted = 0 and 
InstanceName in ('KMHPJIVARPTPA20'
,'phlprwssql006'
,'phlprwssql007'
,'Phlprwsesql001'
,'Phlprwsesqlr001'
,'Phlprwsesqlr002'
,'phlprwsesqlr003'
,'phlprwsspsql001'
) " | % {

    
    script-server -InstanceName $_.InstanceName -DestinationRoot "\\kmhpemcfspa21\ISTSG\TSG\nsg\Database_Unix_SA\Database Administration Team\MSSQL Admin\DR" -Environment $_.Environment

}