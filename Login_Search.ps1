$outfile = '\\nasfsu01\phlusers\jshurak\My Documents\facoper_footprint.txt'
if(!(Test-Path $outfile))
{
    New-Item -Path "$outfile" -ItemType file
}

Submit-SQLStatement $CMSServer $CMSProdDB $ModuleName "select instancename from monitoredinstances where deleted = 0 and monitorinstance = 1" | % {
try{
    $InstanceName = $_.InstanceName
    $InstanceObject = New-Object ('Microsoft.SqlServer.management.SMO.Server') $InstanceName
    if($InstanceObject.ComputerNamePhysicalNetBIOS -ne $null){

        $InstanceObject.Logins | where-object {$_.name -eq 'facoper'} | % {
            Add-Content $outfile "`n$InstanceName"
        }
        
    }else{
       log-message $ModuleName "$InstanceName not found or not online. Check accuracy and availability"        
    }
}
Catch
    {
        $message = $_.Exception.Message
        $Message = "$Message : $InstanceName : $JobName"
    
        log-message $ModuleName $message
    } 
}
