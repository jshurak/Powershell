<#
         .SYNOPSIS
            A function to manage log shipping.

         .DESCRIPTION
            User inputs the a source and target servername and an existing database on the source server. The script will clean up any reminants of existing log
            shipping, synchronize databases on the source and target servers with a full backup and implement log shipping.  Optionally, the user can pass the -CleanupOnly flag as 1 to remove log shipping between the source and target servers for the specified database.  This option will bring the secondary database out of recovery. Optionally, the user can bypass the synchronization 
            process by passing the -SeedDatabase as 0.  The script assumes the databases are in sync.
         .PARAMETER SourceServer
            The server that will act as the Primary server in log shipping.  
         .PARAMETER TargetServer
            The server that will act as the secondary server in log shipping.
         .PARAMETER MonitorServer
            The server to act as a monitor server.  Optional.
         .PARAMETER Database
            The database to be log shipped.  This will be the secondary database name as well.
         .PARAMETER SeedDatabase
            A bit parameter. Set to 1, a full backup will be executed against the primary database. The database on the secondary database will be dropped and restored from this backup. Setting this to 0 will bypass this process. The default value is 1.
         .PARAMETER CleanupOnly
            A bit parameter. Set to 1, the function will remove log shipping between the primary, secondary and monitoring server (if specified) for the specified database and bring the target server's database out of recovery. The cleanup procedure runs no matter what.  It must be ensured that Log shipping is not set up between the servers and database before attempting to implement log shipping. Setting this parameter to 1 stops the script after the clean up process. Setting this parameter to 2 will clean up the primary server only. Setting this parameter to 3 will cleanup the secondary server and bring the defined database out of recovery. The default is 0. 
         .PARAMETER SeedDirectory
            Setting this will determine the location to store the full database backup used to seed the secondary database.  Its default is null and if not specified, will use the SQL_TLog file share.
         .EXAMPLE
            build-logshipping -SourceServer 'SourceServer' -TargetServer 'TargetServer' -SourceDatabase 'Database'
            This example shows the basic usage.  It will build log shipping for the specified database.  It will create a full backup of the database on the source server, drop any existing database of that name
            on the target server and restore the database leaving in recovery.  It will them build log shipping between the two.
         .EXAMPLE
            build-logshipping -SourceServer 'SourceServer' -TargetServer 'TargetServer' -SourceDatabase 'Database' -CleanupOnly 1 
            This example will remove log shipping for the supplied database between the source and target servers and bring the target database out of recovery.
           
         #>
    param
    (
        [parameter(mandatory=$true)]
        [string]$SourceInstance,
        [string]$TargetInstance,
        [string]$MonitorInstance = "",
        [string]$Database,
        [int]$SeedDatabase = 1,
        [int]$CleanupOnly = 0,
        [string]$SeedDirectory = ""
    )


function Submit-SQLStatement
{
    param([string]$ServerInstance,[string]$Database,[string]$ModuleName,[string]$Query,[Int32]$QueryTimeout=600)
    $conn=new-object System.Data.SqlClient.SQLConnection
    $conn.ConnectionString=”Server={0};Database={1};Integrated Security=True” -f $ServerInstance,$Database

    Try
    {
        $conn.Open()
        $con = 1
    }
    catch
    {
        $message = $_.Exception.Message
        $Message = "$Message : $ServerInstance : $Database : $Query"
        #$message | out-file -append -filepath 
        log-message $ModuleName $message
        $con = 0
    }

    if ($con -eq 1)
    {
    
 
        try
        {      
           $cmd=new-object system.Data.SqlClient.SqlCommand($Query,$conn)
           $cmd.CommandTimeout=$QueryTimeout
           $ds=New-Object system.Data.DataSet
           $da=New-Object system.Data.SqlClient.SqlDataAdapter($cmd)
           [void]$da.fill($ds)
           $ds.Tables[0]
           $conn.Close()
        }
        Catch
        {
            $message = $_.Exception.Message
            $Message = "$Message : $ServerInstance : $Database : $Query"
            #$message | out-file -append -filepath 
            log-message $ModuleName $message
        }  
    }
}


function log-message {
    param([string]$ModuleName,[string]$Message)
    
    $ModuleName = $ModuleName
    $date = get-date -format 'yyyyMMdd'
    $MsgDate =get-date -format 'yyyy-MM-dd hhmmss'
    $logfile = "$ModuleName.txt"
    $outfile = "$LoggingDirectory$logfile"
    
    $outMessage = "$MsgDate` : $ModuleName` : $Message"
    $outMessage | out-file -append -filepath $outfile

}
function delete-log {
    param([string]$ModuleName,[string]$LoggingDirectory)
    $logfile = "$ModuleName.txt"
    $outfile = "$LoggingDirectory$logfile"
    if(test-path -Path $outfile)
    {
        remove-item -Path $outfile
    }
}
function Get-ScriptDirectory
{
    Split-Path $script:MyInvocation.MyCommand.Path
}
function Get-ServerFromInstance($InstanceName)
{
    if($InstanceName.IndexOf('\') -gt 0)
    {
        $ServerName =  $InstanceName.Substring(0,$InstanceName.IndexOf('\'))
    }
    else
    {
        $ServerName = $InstanceName
    }
    return $ServerName
}
$SourceServer = Get-ServerFromInstance -InstanceName $SourceInstance
$TargetServer = Get-ServerFromInstance -InstanceName $TargetInstance
if($MonitorInstance -ne [string]::Empty)
{
    $MonitorServer = Get-ServerFromInstance -InstanceName $MonitorInstance
}
switch($CleanupOnly)
{
    2
    {
        $ServerArray = @($SourceServer)
        $InstanceArray = @($SourceInstance)
    }
    3
    {
        $ServerArray = @($TargetServer)
        $InstanceArray = @($TargetInstance)
    }
    default
    {
        $ServerArray = @($SourceServer,$TargetServer)
        $InstanceArray = @($SourceInstance,$TargetInstance)
    }
}



$Path = Get-ScriptDirectory
$ModuleName = "$Database`_LS_Setup_$(get-date -format 'yyyyMMdd')"
$LoggingDirectory = "$Path\"
delete-log $ModuleName $LoggingDirectory
#Test Server connections
if($MonitorInstance -ne [string]::Empty)
{
    $ServerArray += $MonitorServer
    $InstanceArray += $MonitorInstance
}
try
{
    foreach($server in $ServerArray)
    {
        if($server -ne [string]::Empty)
        {
            Test-Connection -ComputerName $Server -Count 1 -ErrorAction Stop     
        }
    }
}
catch
{
    log-message $ModuleName $_
    $response = read-host "Script could not find $Server. Please Check the log."
    exit
}

#Verify instance connectivity
try
{
    foreach($Instance in $InstanceArray)
    {
        if(!(Submit-SQLStatement -ServerInstance $Instance -Database 'master' -ModuleName $ModuleName -Query "SELECT @@SERVERNAME"))
        {
            throw 
        }
    }
}
catch
{
    log-message $ModuleName "Error Connecting to $Instance"
    read-host "Script could not connect to $Instance."
    exit
}
#verify database exists
try
{
    $dbid = Submit-SQLStatement -ServerInstance $SourceInstance -Database 'master' -ModuleName $ModuleName -Query "SELECT database_id FROM sys.databases WHERE name = N'$Database'"
    if($dbid -eq $null)
    {
        throw
    }
}
catch
{
    log-message $ModuleName "$Database not found on $SourceInstance."
    $response = read-host "Script did not find the $Database database on $SourceInstance.  Please verify." 
    if($response -ne 'continue' -and $CleanupOnly -eq 1)
    {
        exit
    }
}
$FileShareServerName = $SourceInstance.Replace('\','$')
$FileShare = "\\KMHPEMCFSPA21\SQL_TLog\$FileShareServerName\$Database"
if($SeedDirectory -eq [string]::Empty)
{
    $SeedDirectory = $FileShare
}


#Clean up any previous log shipping remenants
$PrimaryCleanup1 = @"
    exec master.dbo.sp_delete_log_shipping_primary_secondary @primary_database = N'$Database', @Secondary_Server = N'$TargetInstance',@Secondary_database = N'$Database'
"@
$PrimaryCleanup2 = @"
    exec master.dbo.sp_delete_log_shipping_primary_database @database = N'$Database'
"@
$SecondaryCleanup1 = @"
    exec master.dbo.sp_delete_log_shipping_secondary_database @secondary_database = N'$Database'
"@
$MonitorCleanup = @"
    DELETE FROM msdb.dbo.log_shipping_monitor_primary WHERE primary_database = N'$Database';DELETE FROM msdb.dbo.log_shipping_monitor_secondary WHERE secondary_database = N'$Database';
"@

log-message $ModuleName "Cleaning up log shipping for $Database."
try{

    switch ($CleanupOnly)
    {
        2
        {
            Submit-SQLStatement $SourceInstance 'master' $ModuleName $PrimaryCleanup1
            Submit-SQLStatement $SourceInstance 'master' $ModuleName $PrimaryCleanup2
            if($MonitorInstance -ne [string]::Empty)
            {
               Submit-SQLStatement $MonitorInstance 'master' $ModuleName $MonitorCleanup
               log-message $ModuleName "Cleaning up for $Database complete for $MonitorInstance."
            }
            log-message $ModuleName "Cleaning up for $Database complete for $SourceInstance."
        }
        3
        {
            Submit-SQLStatement $TargetInstance 'master' $ModuleName $SecondaryCleanup1
            if($MonitorInstance -ne [string]::Empty)
            {
               Submit-SQLStatement $MonitorInstance 'master' $ModuleName $MonitorCleanup
               log-message $ModuleName "Cleaning up for $Database complete for $MonitorInstance."
            }
            log-message $ModuleName "Cleaning up for $Database complete."
            log-message $ModuleName "Bringing $Database on $TargetInstance out of recovery."
            if(!(Submit-SQLStatement $TargetInstance 'master' $ModuleName "IF (SELECT state FROM sys.databases WHERE NAME = '$Database') = 1 RESTORE DATABASE $Database WITH RECOVERY;"))
            {
                throw
            }
        }
        default
        {
            Submit-SQLStatement $SourceInstance 'master' $ModuleName $PrimaryCleanup1
            Submit-SQLStatement $TargetInstance 'master' $ModuleName $SecondaryCleanup1
            Submit-SQLStatement $SourceInstance 'master' $ModuleName $PrimaryCleanup2
            if($MonitorInstance -ne [string]::Empty)
            {
               Submit-SQLStatement $MonitorInstance 'master' $ModuleName $MonitorCleanup
            }
            log-message $ModuleName "Cleaning up for $Database complete."
            log-message $ModuleName "Bringing $Database on $TargetInstance out of recovery."
            if(!(Submit-SQLStatement $TargetInstance 'master' $ModuleName "IF (SELECT state FROM sys.databases WHERE NAME = '$Database') = 1 RESTORE DATABASE $Database WITH RECOVERY;"))
            {
                throw
            }
        }
    }


}
catch{
    log-message $MonitorInstance $_ 
}

if($CleanupOnly -eq 0)
{
    if($SeedDatabase -eq 1)
    {
        log-message $ModuleName "Seeding $Database on $TargetInstance"
        if(!(Test-Path -path "$SeedDirectory\FULL" -PathType Container))
        {
            New-Item -Path "$SeedDirectory\FULL" -ItemType directory
        }

        if(Test-Path -Path "$SeedDirectory\FULL\$Database`_FULL.bak")
        {
            Remove-Item -Path "$SeedDirectory\FULL\$Database`_FULL.bak"
        }

        $PrimaryPrepSQL = @"
         ALTER DATABASE $Database SET RECOVERY FULL
 
         BACKUP DATABASE $Database
         TO DISK = '$SeedDirectory\FULL\$Database`_FULL.bak'
"@

        log-message $ModuleName "Setting Recovery to full for $Database and taking a full backup."
        Submit-SQLStatement $SourceInstance 'master' $ModuleName $PrimaryPrepSQL

        $SecondaryPrepSQL = @"
            IF db_id('$Database') is not null
	        DROP DATABASE LS_TEST

            RESTORE DATABASE $Database
            FROM DISK = '$SeedDirectory\FULL\$Database`_FULL.bak'
            WITH REPLACE, NORECOVERY
"@

        log-message $ModuleName "Dropping $Database on $TargetInstance and restoring fresh copy"
        Submit-SQLStatement $TargetInstance 'master' $ModuleName $SecondaryPrepSQL
        log-message $ModuleName "Seed complete for $Database on $TargetInstance"
    }

    $PrimaryLSBuild = @"
    DECLARE @LS_BackupJobId	AS uniqueidentifier 
    DECLARE @LS_PrimaryId	AS uniqueidentifier 
    DECLARE @SP_Add_RetCode	As int 


    EXEC @SP_Add_RetCode = master.dbo.sp_add_log_shipping_primary_database 
		    @database = N'LS_Test' 
		    ,@backup_directory = N'$FileShare\LOG' 
		    ,@backup_share = N'$FileShare\LOG' 
		    ,@backup_job_name = N'LSBackup_$Database' 
		    ,@backup_retention_period = 4320
		    ,@backup_compression = 2
		    ,@backup_threshold = 60 
		    ,@threshold_alert_enabled = 1
		    ,@history_retention_period = 5760 
		    ,@backup_job_id = @LS_BackupJobId OUTPUT 
		    ,@primary_id = @LS_PrimaryId OUTPUT 
		    ,@overwrite = 1 

"@
    if($MonitorInstance -ne [string]::Empty)
    {
        $PrimaryLSBuild = $PrimaryLSBuild + @"
            ,@monitor_server = N'$MonitorInstance' 
            ,@monitor_server_security_mode = 1 
            ,@ignoreremotemonitor = 1 

"@
    }

    $PrimaryLSBuild = $PrimaryLSBuild + @"

    IF (@@ERROR = 0 AND @SP_Add_RetCode = 0) 
    BEGIN 

    DECLARE @LS_BackUpScheduleUID	As uniqueidentifier 
    DECLARE @LS_BackUpScheduleID	AS int 


    EXEC msdb.dbo.sp_add_schedule 
		    @schedule_name =N'LSBackupSchedule_$SourceInstance' 
		    ,@enabled = 1 
		    ,@freq_type = 4 
		    ,@freq_interval = 1 
		    ,@freq_subday_type = 4 
		    ,@freq_subday_interval = 20 
		    ,@freq_recurrence_factor = 0 
		    ,@active_start_date = 20150930 
		    ,@active_end_date = 99991231 
		    ,@active_start_time = 0 
		    ,@active_end_time = 235900 
		    ,@schedule_uid = @LS_BackUpScheduleUID OUTPUT 
		    ,@schedule_id = @LS_BackUpScheduleID OUTPUT 

    EXEC msdb.dbo.sp_attach_schedule 
		    @job_id = @LS_BackupJobId 
		    ,@schedule_id = @LS_BackUpScheduleID  

    EXEC msdb.dbo.sp_update_job 
		    @job_id = @LS_BackupJobId 
		    ,@enabled = 1 


    END 


    EXEC master.dbo.sp_add_log_shipping_primary_secondary 
		    @primary_database = N'$Database' 
		    ,@secondary_server = N'$TargetInstance' 
		    ,@secondary_database = N'$Database' 
		    ,@overwrite = 1 

    -- ****** End: Script to be run at Primary: [$SourceInstance]  ******

"@
    log-message $ModuleName "Building log shipping for $Database."
    log-message $ModuleName "Setting up $Database as the primary on $SourceInstance."
    Submit-SQLStatement $SourceInstance 'msdb' $ModuleName $PrimaryLSBuild

    if($MonitorInstance -ne [string]::Empty)
    {
    $MonitorPrimaryMetricQuery = @"
 SELECT
 primary_id,
 primary_server,
 primary_database,
 backup_threshold,
 threshold_alert,
 threshold_alert_enabled,
 history_retention_period
FROM msdb.dbo.log_shipping_monitor_primary 
WHERE primary_database = '$Database'
"@
    Submit-SQLStatement $SourceInstance 'msdb' $ModlueName $MonitorPrimaryMetricQuery | % {
        $PrimaryGUID = $_.primary_id
        $BackupThreshold = $_.backup_threshold
        $ThresholdAlert = $_.threshold_alert
        $ThresholdAlertEnabled = $_.threshold_alert_enabled
        $HistoryRetentionPeriod = $_.history_retention_period

    }
    $MonitorStep1 = @"
        -- ****** Begin: Script to be run at Monitor: [$MonitorInstance] ******


    EXEC msdb.dbo.sp_processlogshippingmonitorprimary 
		    @mode = 1 
		    ,@primary_id = N'$PrimaryGUID' 
		    ,@primary_server = N'$SourceInstance' 
		    ,@monitor_server = N'$MonitorInstance' 
		    ,@monitor_server_security_mode = 1 
		    ,@primary_database = N'$Database' 
		    ,@backup_threshold = $BackupThreshold 
		    ,@threshold_alert = $ThresholdAlert
		    ,@threshold_alert_enabled = $ThresholdAlertEnabled 
		    ,@history_retention_period = $HistoryRetentionPeriod 

    -- ****** End: Script to be run at Monitor: [$MonitorInstance] ******
"@

        log-message $ModuleName "Adding Primary info to $MonitorInstance"
        Submit-SQLStatement $MonitorInstance 'master' $ModuleName $MonitorStep1
    }
    $SecondaryLSBuild = @"
    -- Execute the following statements at the Secondary to configure Log Shipping 
    -- for the database [$TargetInstance].[$Database],
    -- the script needs to be run at the Secondary in the context of the [msdb] database. 
    ------------------------------------------------------------------------------------- 
    -- Adding the Log Shipping configuration 

    -- ****** Begin: Script to be run at Secondary: [RDGPRWSMDSQL001] ******


    DECLARE @LS_Secondary__CopyJobId	AS uniqueidentifier 
    DECLARE @LS_Secondary__RestoreJobId	AS uniqueidentifier 
    DECLARE @LS_Secondary__SecondaryId	AS uniqueidentifier 
    DECLARE @LS_Add_RetCode	As int 


    EXEC @LS_Add_RetCode = master.dbo.sp_add_log_shipping_secondary_primary 
		    @primary_server = N'$SourceInstance' 
		    ,@primary_database = N'$Database' 
		    ,@backup_source_directory = N'$FileShare\LOG' 
		    ,@backup_destination_directory = N'$FileShare\LOG' 
		    ,@copy_job_name = N'LSCopy_$SourceInstance`_$Database' 
		    ,@restore_job_name = N'LSRestore_$SourceInstance`_$Database' 
		    ,@file_retention_period = 4320 
		    ,@overwrite = 1 
		    ,@copy_job_id = @LS_Secondary__CopyJobId OUTPUT 
		    ,@restore_job_id = @LS_Secondary__RestoreJobId OUTPUT 
		    ,@secondary_id = @LS_Secondary__SecondaryId OUTPUT 
"@
    if($MonitorInstance -ne [string]::Empty)
    {
        $SecondaryLSBuild = $SecondaryLSBuild + @"
		    ,@monitor_server = N'$MonitorInstance' 
		    ,@monitor_server_security_mode = 1 
"@
    }
    $SecondaryLSBuild = $SecondaryLSBuild + @"

    IF (@@ERROR = 0 AND @LS_Add_RetCode = 0) 
    BEGIN 

    DECLARE @LS_SecondaryCopyJobScheduleUID	As uniqueidentifier 
    DECLARE @LS_SecondaryCopyJobScheduleID	AS int 


    EXEC msdb.dbo.sp_add_schedule 
		    @schedule_name =N'DefaultCopyJobSchedule' 
		    ,@enabled = 1 
		    ,@freq_type = 4 
		    ,@freq_interval = 1 
		    ,@freq_subday_type = 4 
		    ,@freq_subday_interval = 20 
		    ,@freq_recurrence_factor = 0 
		    ,@active_start_date = 20150930 
		    ,@active_end_date = 99991231 
		    ,@active_start_time = 0 
		    ,@active_end_time = 235900 
		    ,@schedule_uid = @LS_SecondaryCopyJobScheduleUID OUTPUT 
		    ,@schedule_id = @LS_SecondaryCopyJobScheduleID OUTPUT 

    EXEC msdb.dbo.sp_attach_schedule 
		    @job_id = @LS_Secondary__CopyJobId 
		    ,@schedule_id = @LS_SecondaryCopyJobScheduleID  

    DECLARE @LS_SecondaryRestoreJobScheduleUID	As uniqueidentifier 
    DECLARE @LS_SecondaryRestoreJobScheduleID	AS int 


    EXEC msdb.dbo.sp_add_schedule 
		    @schedule_name =N'DefaultRestoreJobSchedule' 
		    ,@enabled = 1 
		    ,@freq_type = 4 
		    ,@freq_interval = 1 
		    ,@freq_subday_type = 4 
		    ,@freq_subday_interval = 20 
		    ,@freq_recurrence_factor = 0 
		    ,@active_start_date = 20150930 
		    ,@active_end_date = 99991231 
		    ,@active_start_time = 0 
		    ,@active_end_time = 235900 
		    ,@schedule_uid = @LS_SecondaryRestoreJobScheduleUID OUTPUT 
		    ,@schedule_id = @LS_SecondaryRestoreJobScheduleID OUTPUT 

    EXEC msdb.dbo.sp_attach_schedule 
		    @job_id = @LS_Secondary__RestoreJobId 
		    ,@schedule_id = @LS_SecondaryRestoreJobScheduleID  


    END 


    DECLARE @LS_Add_RetCode2	As int 


    IF (@@ERROR = 0 AND @LS_Add_RetCode = 0) 
    BEGIN 

    EXEC @LS_Add_RetCode2 = master.dbo.sp_add_log_shipping_secondary_database 
		    @secondary_database = N'$Database' 
		    ,@primary_server = N'$SourceInstance' 
		    ,@primary_database = N'$Database' 
		    ,@restore_delay = 20 
		    ,@restore_mode = 0 
		    ,@disconnect_users	= 0 
		    ,@restore_threshold = 60   
		    ,@threshold_alert_enabled = 1 
		    ,@history_retention_period	= 5760 
		    ,@overwrite = 1 
		    
"@
    if($MonitorInstance -ne [string]::Empty)
    {
       $SecondaryLSBuild = $SecondaryLSBuild + @"
            ,@ignoreremotemonitor = 1 
"@
    }            

    $SecondaryLSBuild = $SecondaryLSBuild + @"

    END 


    IF (@@error = 0 AND @LS_Add_RetCode = 0) 
    BEGIN 

    EXEC msdb.dbo.sp_update_job 
		    @job_id = @LS_Secondary__CopyJobId 
		    ,@enabled = 1 

    EXEC msdb.dbo.sp_update_job 
		    @job_id = @LS_Secondary__RestoreJobId 
		    ,@enabled = 1 

    END 


    -- ****** End: Script to be run at Secondary: [$TargetInstance] ******

    
"@
    log-message $ModuleName "Setting up $Database as secondary on $TargetInstance"
    Submit-SQLStatement $TargetInstance 'msdb' $ModuleName $SecondaryLSBuild
    if($MonitorInstance -ne [string]::Empty)
    {
    $MonitorSecondaryMetricQuery = @"
    SELECT
     secondary_id,
     secondary_server,
     secondary_database,
     restore_threshold,
     threshold_alert,
     threshold_alert_enabled,
     history_retention_period
    FROM msdb.dbo.log_shipping_monitor_secondary 
    WHERE primary_database = '$Database' 
    AND primary_server = '$SourceInstance'
"@
    Submit-SQLStatement $TargetInstance 'msdb' $ModuleName $MonitorSecondaryMetricQuery | % {
        $SecondaryGUID = $_.secondary_id
        $RestoreThreshold = $_.restore_threshold
        $SecondaryThresholdAlert = $_.threshold_alert
        $SecondaryThresholdAlertEnabled = $_.threshold_alert_enabled
        $SecondaryHistoryRetentionPeriod = $_.history_retention_period
    }
    $MonitorStep2 = @"

    -- ****** Begin: Script to be run at Monitor: [$MonitorInstance] ******


    EXEC msdb.dbo.sp_processlogshippingmonitorsecondary 
		    @mode = 1 
		    ,@secondary_server = N'$TargetInstance' 
		    ,@secondary_database = N'$Database' 
		    ,@secondary_id = N'$SecondaryGUID' 
		    ,@primary_server = N'$SourceInstance' 
		    ,@primary_database = N'$Database' 
		    ,@restore_threshold = $RestoreThreshold   
		    ,@threshold_alert = $SecondaryThresholdAlert 
		    ,@threshold_alert_enabled = $SecondaryThresholdAlertEnabled
		    ,@history_retention_period	= $SecondaryHistoryRetentionPeriod 
		    ,@monitor_server = N'$MonitorInstance' 
		    ,@monitor_server_security_mode = 1 
    -- ****** End: Script to be run at Monitor: [$MonitorInstance] ******

"@

        log-message $ModuleName "Adding secondary information to $MonitorInstance"
        Submit-SQLStatement $MonitorInstance 'master' $ModuleName $MonitorStep2
     }

    log-message $ModuleName "Log shipping build complete for $Database."
    }