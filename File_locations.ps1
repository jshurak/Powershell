
            
            $InstanceName = "PHLDVWSSQL002\DVS1201"

$DriveQuery = 
@"
select MountPoint,TotalCapacity/1024/1024/1024 as SizeInGB
from monitoredDrives md INNER JOIN MonitoredServers ms on md.ServerID = ms.ServerID
WHERE servername = '$ServerName'
and md.deleted = 0
order by MountPoint
"@            




            [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") | Out-Null
            $InstanceObject = New-Object ('Microsoft.SqlServer.Management.Smo.Server') -argumentlist $InstanceName
            $ServerName = $InstanceObject.ComputerNamePhysicalNetBIOS

            $MountHash = @{}

            Submit-SQLStatement -ServerInstance "PHLDVWSSQL002\DVS1201" -Database "CMS" -ModuleName "Drive" -Query $DriveQuery | % {
                $MountHash.Add($_.MountPoint,$_.SizeInGB)
            
            }


            $MountHash.keys | % {
                write-output "$_"
                Write-Output $MountHash.Item($_)
            }