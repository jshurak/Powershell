<#
    This is a generic wrapper script to facilitate log shipping management for multiple databases.  
    This is built on the premise of connectivity to the Source and Target instances. In the event of a DR 'bubble', it will need to exist on both networks.
    To migrate to a different server:
        1) Copy this and the build-logshipping.ps1 files to the new server.  These files must exist in the same directory
        2) Update the $DatabaseList array with the correct databases
        3) Update Source and Target Instance Variables
        4) Update the CleanupValue variable - set to 1 cleans up both Source and Target. Set to 2 will clean up the Source only.  Set to 3 will clean up the Target only.
#>
$Path = Split-Path $script:MyInvocation.MyCommand.Path
$DatabaseList = @('BESMgmt', 'BMSStore', 'PROD_CERME', 'prod_internet', 'prod_member_portal', 'prod_member_portal_medicare', 'prod_member_portal_tpa', 'Prod_Web_Contracts', 'Prod_Web_Insight', 'Prod_Web_Insight_Restore')
$SourceInstance = 'PHLPRWSSQL006'
$TargetInstance = 'RDGPRWSSQL006'
$CleanupValue = 2

foreach($Database in $DatabaseList)
{
    Invoke-Expression "$Path\build-logshipping.ps1 -SourceInstance $SourceInstance -TargetInstance $TargetInstance -Database $Database -CleanupOnly $CleanupValue"
}