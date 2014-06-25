#[System.Data.Sql.SqlDataSourceEnumerator]::Instance.GetDataSources()
Get-Content ..\..\Clients\AMFC\ServerList.txt | Export-CliXml C:\Users\jshurak\Documents\GitHub\Powershell\servers.xml
$xml = [xml] (gc C:\Users\jshurak\Documents\GitHub\Powershell\servers.xml)
$xml.Save([Console]::Out)