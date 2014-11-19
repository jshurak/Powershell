Add-Type -AssemblyName "Microsoft.SqlServer.Smo, Version=10.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91";
[Microsoft.SqlServer.Management.Smo.SmoApplication]::EnumAvailableSqlServers()