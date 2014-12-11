$InstanceName = "KDEVSQLPA22\HYPERION_DEV"

$Instance = $InstanceName.Substring($InstanceName.IndexOf('\')+1)
$ServerName = $InstanceName.Substring(0,$InstanceName.IndexOf('\'))

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SqlWmiManagement") | Out-Null

$wmi = new-object "Microsoft.SqlServer.Management.Smo.Wmi.ManagedComputer" "$ServerName" -ErrorAction 'Stop'

$Port=$wmi.ServerInstances["$Instance"].ServerProtocols["Tcp"].IPAddresses["IPAll"].IPAddressProperties["TcpPort"].Value

if(!$Port)
{
    $Port=$wmi.ServerInstances["$Instance"].ServerProtocols["Tcp"].IPAddresses["IPAll"].IPAddressProperties["TcpDynamicPorts"].Value
    if(!$Port)
    {
        $Port="Not Found"
    }
    else
    {
        $Port = $Port + ", Dynamic"
    }
}

