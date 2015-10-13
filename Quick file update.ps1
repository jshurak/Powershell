$serverArray = @()

$serverArray += 'PHLPRWSVRSQL001'
$serverArray += 'PHLPRWSVFSQL001'
$serverArray += 'phlprwsswsql001'
$serverArray += 'Phlprwssqlm03'
$serverArray += 'Phlprwssqlm02'
$serverArray += 'Phlprwssqlm01'
$serverArray += 'phlprwssql008'
$serverArray += 'phlprwssql007'
$serverArray += 'phlprwssql006'
$serverArray += 'PHLPRWSSQL004'
$serverArray += 'PHLPRWSSQL003'
$serverArray += 'PHLPRWSSQL002'
$serverArray += 'PHLPRWSSQL001'
$serverArray += 'phlprwsfrsql001'
$serverArray += 'phlprwsevsql001'
#$serverArray += 'jivasql'


foreach($server in $serverArray){
    (Get-Content  "\\$server\c`$\Program Files\VERITAS\NetBackup\DbExt\MsSql\FULL.bch").Replace('MS-SQL_Prod_Weekly','MS-SQL_Prod_Monthly') | Set-Content "\\$server\c`$\Program Files\VERITAS\NetBackup\DbExt\MsSql\MFULL.bch"
    
}

#(Get-Content '\\kmhpemcfspa21\ISTSG\TSG\nsg\Database_Unix_SA\Database Administration Team\MSSQL Admin\
#Server Build Documents and Scripts\New Server Build Scripts\Server Creation\NBU backup batch files\Batch Files Productio
#n\FULL.bch').Replace('MS-SQL_Prod_Weekly','MS-SQL_Prod_Monthly') | Set-Content '\\kmhpemcfspa21\ISTSG\TSG\nsg\Database_U
#nix_SA\Database Administration Team\MSSQL Admin\Server Build Documents and Scripts\New Server Build Scripts\Server Creat
#ion\NBU backup batch files\Batch Files Production\MFULL.bch'

