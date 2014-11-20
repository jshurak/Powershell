EXEC msdb.dbo.sp_add_alert @name=N'Error Number 823', 
		@message_id=823, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Error Number 824', 
		@message_id=824, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Error Number 825', 
		@message_id=825, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Log shipping Primary Server Alert.', 
		@message_id=14420, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=0, 
		@include_event_description_in=5, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Log shipping Secondary Server Alert.', 
		@message_id=14421, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=0, 
		@include_event_description_in=5, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 016', 
		@message_id=0, 
		@severity=16, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 017', 
		@message_id=0, 
		@severity=17, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 018', 
		@message_id=0, 
		@severity=18, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 019', 
		@message_id=0, 
		@severity=19, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 020', 
		@message_id=0, 
		@severity=20, 
		@enabled=0, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 021', 
		@message_id=0, 
		@severity=21, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 022', 
		@message_id=0, 
		@severity=22, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 023', 
		@message_id=0, 
		@severity=23, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 024', 
		@message_id=0, 
		@severity=24, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 025', 
		@message_id=0, 
		@severity=25, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:15 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Backup Configuration', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Backup Config]    Script Date: 11/20/2014 2:09:15 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Backup Config', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'set nocount on
go
select ''exec sp_CONFIGURE ''''show advanced options'''', 1'' + char(13) + char(10) + '' go'' + char(13) + char(10) + '' reconfigure'' 
go
select ''exec sp_configure '''''' + name + '''''', '' + cast(value_in_use as nvarchar(10))
	+ char(13) + char(10) + ''go'' 
	from sys.configurations
	where name<>''show advanced options''
go
select ''reconfigure''
', 
		@database_name=N'master', 
		@output_file_name=N'G:\Backup\Config.txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily 5am', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20111029, 
		@active_end_date=99991231, 
		@active_start_time=50000, 
		@active_end_time=235959, 
		@schedule_uid=N'cdfd706f-c436-4984-a8e7-37b695469264'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:15 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Backup Databases.Subplan_1', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Subplan_1]    Script Date: 11/20/2014 2:09:15 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Subplan_1', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/Server "$(ESCAPE_NONE(SRVR))" /SQL "Maintenance Plans\Backup Databases" /set "\Package\Subplan_1.Disable;false"', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily Backup', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140128, 
		@active_end_date=99991231, 
		@active_start_time=20000, 
		@active_end_time=235959, 
		@schedule_uid=N'6dc237ca-c47d-4f41-ab48-3e9a2f67d0bd'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:15 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Backup Logins', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Backup Logins]    Script Date: 11/20/2014 2:09:15 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Backup Logins', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec sp_help_revlogin', 
		@database_name=N'master', 
		@output_file_name=N'G:\Backup\Logins.txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily 5am', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20111029, 
		@active_end_date=99991231, 
		@active_start_time=50000, 
		@active_end_time=235959, 
		@schedule_uid=N'3983d526-4966-486e-ba0b-acfba345a339'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:15 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Backup Transaction Log.Subplan_1', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Subplan_1]    Script Date: 11/20/2014 2:09:15 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Subplan_1', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/Server "$(ESCAPE_NONE(SRVR))" /SQL "Maintenance Plans\Backup Transaction Log" /set "\Package\Subplan_1.Disable;false"', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:16 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Capture DB Statistics', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Collect Server Information]    Script Date: 11/20/2014 2:09:16 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Collect Server Information', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'Use Data_Collection
go
drop table SQL_Server_Info_Old
go
sp_rename ''SQL_Server_Info'',''SQL_Server_Info_Old''
go
create table #Drive (DriveLetter varchar(25))
insert into #Drive (DriveLetter) select distinct LEFT(physical_name,2) FROM sys.master_files as MF inner join sys.databases as DB on MF.database_id = DB.database_id
declare @tmp varchar(250)
SET @tmp = ''''
select @tmp = @tmp + DriveLetter + '', '' from #Drive
--select @tmp
create table #Drive2 (DriveLetter varchar(25))
insert into #Drive2 (DriveLetter) SELECT Distinct left(physical_device_name,2) FROM msdb.dbo.backupmediafamily
declare @tmp2 varchar(250)
SET @tmp2 = ''''
select @tmp2 = @tmp2 + DriveLetter + '', '' from #Drive2
--select @tmp2
SELECT 
''1 - Server'' as [Type],
SERVERPROPERTY(''ServerName'') as Instance,
SERVERPROPERTY(''ComputerNamePhysicalNetBIOS'') as [Host/DB Name],
SERVERPROPERTY(''Edition'') as [Edition/Compatibility Level], /*shows 32 bit or 64 bit*/
SERVERPROPERTY(''ProductLevel'') as [Product/Recover], /* RTM or SP1 etc*/
Case SERVERPROPERTY(''IsClustered'') when 1 then ''CLUSTERED'' else ''STANDALONE'' end as [Type/Max Size],
SERVERPROPERTY(''ComputerNamePhysicalNetBIOS'') as [Servers/Size],
(select cast(cpu_count as nvarchar(10))+'' core / ''+cast(cpu_count/hyperthread_ratio as nvarchar(10))+'' procs'' as MB from sys.dm_os_sys_info) as [CPU/Growth],
(select physical_memory_kb/1024 from sys.dm_os_sys_info) as MB,
(select SUBSTRING(@tmp, 0, LEN(@tmp)))+'', Backup ''+(select SUBSTRING(@tmp2, 0, LEN(@tmp2))) as Drives,
@@VERSION as [Version Info]
Into SQL_Server_Info
Drop table #Drive
Drop table #Drive2
--go
--select * from SQL_Server_Info
----union all 
----select * from SQL_Server_Info_Old
--go
----Drop Table SQL_Server_Changes
--Insert Into SQL_Server_Changes
--select getdate() as [Date], 
--cast(New.Instance as varchar(100)) as Instance, 
--cast(New.[CPU/Growth] as varchar(100)) as CPU, 
--cast(Old.[CPU/Growth] as varchar(100)) as [Old_CPU], 
--cast(New.MB as varchar(100)) as MB, 
--cast(Old.MB as varchar(100)) as Old_MB,
--cast(New.[Product/Recover] as varchar(100)) as Product, 
--cast(Old.[Product/Recover] as varchar(100)) as [Old_Product],
--cast(New.Drives as varchar(100)) as Drives, 
--cast(Old.Drives as varchar(100)) as Old_Drives
----Into SQL_Server_Changes
--from SQL_Server_Info as New inner join SQL_Server_Info_Old as Old on New.Instance = Old.Instance
--where (Old.[CPU/Growth] <> New.[CPU/Growth] 
--or Old.Drives <> New.Drives 
--or Old.[Product/Recover] <> New.[Product/Recover]
--or Old.MB <> New.MB) and New.Instance <> ''tempdb''
--go
----select * from SQL_Server_Changes', 
		@database_name=N'DATA_COLLECTION', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Collect DB Information]    Script Date: 11/20/2014 2:09:16 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Collect DB Information', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'Use Data_Collection
go
drop table SQL_DB_Info_Old
go
sp_rename ''SQL_DB_Info'',''SQL_DB_Info_Old''
go
SELECT 
''2 - Database'' as [Type],
SERVERPROPERTY(''ServerName'') as Instance,
db_name(MF.database_id) as Name,
compatibility_level,
recovery_model_desc,
cast((max_size)/128 as varchar(50)) as [Max_Size],
cast((size)/128 as varchar(50)) as [Size],
cast((growth)/128 as varchar(50)) as [Growth],
Case when physical_name like ''%.mdf'' or physical_name like ''%.ndf'' then ''DATA'' else ''LOG'' end As [File_Type],
LEFT(physical_name,2) as Drive, 
[FILE_ID],
Case when DB.is_read_only = 1 then ''Read Only'' else ''Read\Write'' end as DB_Status
--,physical_name
--,*
into SQL_DB_Info
FROM sys.master_files as MF inner join sys.databases as DB on MF.database_id = DB.database_id
go
select * from SQL_DB_Info
--union all 
--select * from SQL_DB_Info_Old
go
--Insert Into SQL_DB_Changes
select getdate() as [Date], 
cast(New.Instance as varchar(100)) as Instance,
cast(New.Name as varchar(100)) as Name, 
cast(New.Max_Size as varchar(100)) as Max_Size, 
cast(Old.Max_Size as varchar(100)) as Old_Max_Size, 
cast(New.Size as varchar(100)) as Size, 
cast(Old.Size as varchar(100)) as Old_Size,
New.[File_Type],
New.[File_ID]
--, *
--Into SQL_DB_Changes
from SQL_DB_Info as New full outer join SQL_DB_Info_Old as Old on New.Name = Old.Name and Old.[File_Type] = New.[File_Type] and New.[File_ID] = Old.[File_ID]
where (Old.Max_Size <> New.Max_Size or Old.Size <> New.Size) and 
New.Name <> ''tempdb''
and New.Name <> ''master''
and New.Name <> ''model''
and New.Name <> ''tempdb''
and New.Name <> ''msdb''
--and New.[File_Type] <> ''LOG''
go
--Insert Into SQL_DB_Changes
select getdate() as [Date], 
cast(New.Instance as varchar(100)) as Instance,
cast(New.Name as varchar(100)) as Name, 
cast(New.Max_Size as varchar(100)) as Max_Size, 
cast(0 as varchar(100)) as Old_Max_Size, 
cast(New.Size as varchar(100)) as Size, 
cast(0 as varchar(100)) as Old_Size,
New.[File_Type],
New.[File_ID]
from SQL_DB_Info as New full outer join SQL_DB_Info_Old as Old 
on New.Name = Old.Name and Old.[Type] = New.[Type] and New.[File_ID] = Old.[File_ID]
where New.Name <> ''tempdb''
and New.Name <> ''master''
and New.Name <> ''model''
and New.Name <> ''tempdb''
and New.Name <> ''msdb''
--and New.[File_Type] <> ''LOG''
and New.Name not in (select Name from SQL_DB_Changes)
go
--select * from SQL_DB_Changes
--delete from SQL_DB_Changes where [DATE] > ''2012-11-26 17:29:13.000''
--select * from SQL_DB_Changes order by name, date', 
		@database_name=N'DATA_COLLECTION', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Capture DB Statistics', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20121113, 
		@active_end_date=99991231, 
		@active_start_time=30000, 
		@active_end_time=235959, 
		@schedule_uid=N'50da2b81-ce8f-4c5b-9b6f-00724fa5533d'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:16 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Check Blocked Processes', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Check Blocked Processes]    Script Date: 11/20/2014 2:09:16 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Check Blocked Processes', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'USE DATA_COLLECTION 
go 

declare @data_count int 
declare @date_captured datetime
declare @duration_minutes int = 5
declare @default_days int = 30
DECLARE @email_body VarChar(2000)
DECLARE @profile_name varchar(2000) = N''MS SQL Mail''
DECLARE @recipients varchar(2000) = ''DL-KMHP_MSSQLDBAGroup@kmhp.com''
DECLARE @subject varchar(2000)
DECLARE @retention datetime

-- capture current date and time
set @date_captured = GETDATE()

-- insert data into table
INSERT INTO BLOCKED_PROCESSES
	( session_id,
      host_name,
      login_name,
      start_time,
      totalReads,
      totalWrites,
      totalCPU,
      writes_in_tempdb,
      sql_text,
      blocking_session_id,
      blocking_text,
      date_captured)
SELECT  x.session_id,
        x.host_name,
        x.login_name,
        x.start_time,
        x.totalReads,
        x.totalWrites,
        x.totalCPU,
        x.writes_in_tempdb,
    (
            -- Query gets XML text for the sql query for the session_id
            SELECT      text AS [text()]
            FROM  sys.dm_exec_sql_text(x.sql_handle)
            FOR XML PATH(''''), TYPE

    )AS sql_text,
     COALESCE(x.blocking_session_id, 0) AS blocking_session_id,
    (
        SELECT p.text
        FROM
        (
            -- Query gets the corresponding sql_handle info to find the XML text in the next query
            SELECT MIN(sql_handle) AS sql_handle
            FROM sys.dm_exec_requests r2
            WHERE r2.session_id = x.blocking_session_id
        ) AS r_blocking
        CROSS APPLY
        (
            -- Query will pull back the XML text for a blocking session if there is any from the sql_haldle
            SELECT text AS [text()]
            FROM sys.dm_exec_sql_text(r_blocking.sql_handle)
            FOR XML PATH(''''), TYPE
        ) p (text)
    ) AS blocking_text,
    @date_captured as date_captured
FROM
(
-- Query returns active session_id and metadata about the session for resource, blocking, and sql_handle
    SELECT  r.session_id,
            s.host_name,
            s.login_name,
            r.start_time,
            r.sql_handle,
            r.blocking_session_id,
            SUM(r.reads) AS totalReads,
            SUM(r.writes) AS totalWrites,
            SUM(r.cpu_time) AS totalCPU,
            SUM(tsu.user_objects_alloc_page_count + tsu.internal_objects_alloc_page_count) AS writes_in_tempdb
    FROM    sys.dm_exec_requests r
    JOIN    sys.dm_exec_sessions s ON s.session_id = r.session_id
    JOIN    sys.dm_db_task_space_usage tsu ON s.session_id = tsu.session_id and r.request_id = tsu.request_id
    WHERE   r.status IN (''running'', ''runnable'', ''suspended'')
      and r.blocking_session_id <> 0
    GROUP BY    r.session_id,
                s.host_name,
                s.login_name,
                r.start_time,
                r.sql_handle,
                r.blocking_session_id
) x

-- delete data where the duration
-- is less than 5 minutes or have
-- logged for 30 days or more

delete from BLOCKED_PROCESSES
where duration_minutes < @duration_minutes or 
	  DATEDIFF(D,start_time,duration_minutes) >= @default_days


set @retention = (GETDATE() - 30)
delete from DATA_COLLECTION..BLOCKED_PROCESSES where date_captured < @retention

select @data_count = COUNT(*)
from BLOCKED_PROCESSES
where date_captured=@date_captured

if @data_count > 0 
	begin
		set @subject = N''Blocked processes were found on '' + convert(nvarchar(20),@date_captured,100)

		set @email_body = N''Number of blocked processes found:  '' + CAST(@data_count as nvarchar(10)) + CHAR(13) + N''Duration time:  >=  '' + cast(@duration_minutes as nvarchar(5)) + 
					'' minute(s)'' + char(13) + char(13) + ''***Run the sp_CURRENT_BLOCKED_PROCESSES stored procedure to view the most recent blocked processes.''
				
		EXEC msdb.dbo.sp_send_dbmail
			@profile_name = @profile_name,
			@recipients = @recipients,
			@subject = @subject,
			@body = @email_body	
	end', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Every 10 mins', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=10, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20111029, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'6bcde8e0-e018-4487-8063-372ca14c4153'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:16 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Check DB Integrity.Subplan_1', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Subplan_1]    Script Date: 11/20/2014 2:09:16 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Subplan_1', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/Server "$(ESCAPE_NONE(SRVR))" /SQL "Maintenance Plans\Check DB Integrity" /set "\Package\Subplan_1.Disable;false"', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Check DB Integrity.Subplan_1', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20140128, 
		@active_end_date=99991231, 
		@active_start_time=180000, 
		@active_end_time=235959, 
		@schedule_uid=N'418ba5c4-f87a-4608-a5ce-33e8c6a5e89a'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:16 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Check DB Space', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Check DB Space]    Script Date: 11/20/2014 2:09:16 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Check DB Space', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'/*  Script to check the database space on all databases on the server except system databases.
  There is no input parameters
  Author - Derrick Williams
  Date - 6/9/2011
*/

--Checks to ensure that the temp table is not there, if so it deletes it.
IF ((SELECT OBJECT_ID(''tempdb..#DB_SPACE_CHECK'')) IS NOT NULL)
BEGIN
     DROP TABLE #DB_SPACE_CHECK
END

--Checks to ensure that the temp table is not there, if so it deletes it.
IF ((SELECT OBJECT_ID(''tempdb..#DB_SPACE_CHECK2'')) IS NOT NULL)
BEGIN
     DROP TABLE #DB_SPACE_CHECK2
END

IF ((SELECT OBJECT_ID(''tempdb..#TEST_SYSMAIL_PROFILES'')) IS NOT NULL)
	BEGIN
		DROP TABLE #TEST_SYSMAIL_PROFILES;
	END

--Builds the server names - database names - and free space and inserts into the temp table
select 
	@@servername as ServerName,
	DB_NAME(database_id) AS DatabaseName, 
	CAST([Name] AS varchar(20)) AS NameofFile,
	CAST(physical_name AS varchar(100)) AS PhysicalFile,
	type_desc AS FileType,
	((size * 8)/1024) AS FileSize,
	MaxFileSize = 
	CASE WHEN max_size = -1 OR max_size = 268435456 THEN ''UNLIMITED''
		WHEN max_size = 0 THEN ''NO_GROWTH'' 
		WHEN max_size <> -1 OR max_size <> 0 THEN CAST(((max_size * 8) / 1024) AS varchar(15))
		ELSE ''Unknown''
	END,
	SpaceRemainingMB = 
	CASE WHEN max_size = -1 OR max_size = 268435456 THEN ''UNLIMITED''
		WHEN max_size <> -1 OR max_size = 268435456 THEN CAST((((max_size - size) * 8) / 1024) AS varchar(10))
		ELSE ''Unknown''
	END,
	Growth = 
		CASE WHEN growth = 0 THEN ''FIXED_SIZE''
		WHEN growth > 0 THEN ((growth * 8)/1024)
		ELSE ''Unknown''
	END,
	GrowthType = 
		CASE WHEN is_percent_growth = 1 THEN ''PERCENTAGE''
		WHEN is_percent_growth = 0 THEN ''MBs''
		ELSE ''Unknown''
	END
into #DB_SPACE_CHECK FROM master.sys.master_files
WHERE state = 0 AND 
	  type_desc IN (''LOG'', ''ROWS'')
ORDER BY database_id, 
		 file_id

-- create temp table to store email profiles
CREATE TABLE #TEST_SYSMAIL_PROFILES
	(principal_id int,
	 principal_name varchar(200),
	 profile_id int,
	 profile_name varchar(200),
	 is_default bit)

-- insert email profiles into temp table
insert into #TEST_SYSMAIL_PROFILES
EXECUTE msdb.dbo.sysmail_help_principalprofile_sp;

-- Variable Declaration
DECLARE @unlimited_count int
DECLARE @server_name VarChar(2000)
DECLARE @database_name VarChar(2000)
DECLARE @space_remaining VarChar(2000)
DECLARE @file_type VarChar(2000)
DECLARE @email_body VarChar(2000)
DECLARE @profile_name varchar(2000) 
DECLARE @recipients varchar(2000) 
DECLARE @subject varchar(2000)

-- retrieve email profile
SELECT TOP 1 @profile_name = profile_name
FROM #TEST_SYSMAIL_PROFILES

-- count number of "UNLIMITED" databases
select @unlimited_count = COUNT(*) 
from #DB_SPACE_CHECK
where (MaxFileSize = ''UNLIMITED'' OR SpaceRemainingMB = ''UNLIMITED'') AND 
	  DatabaseName NOT IN (''master'',''model'',''msdb'',''ReportServer'',''ReportServerTempDB'') AND
	  DatabaseName NOT LIKE ''wslogdb70%''

-- set default variables for email
SET @recipients = ''DL-KMHP_MSSQLDBAGroup@kmhp.com''

IF @unlimited_count = 0 -- indicates there are no databases listed as ''UNLIMITED'' therefore process normally
	BEGIN		

		-- calculate the percent used from #DB_SPACE_CHECK temp table
		-- and store into #DB_SPACE_CHECK2 temp table
		select * , 
			   CAST(((CAST(MaxFileSize as decimal(18,4))-CAST(SpaceRemainingMB as decimal(18,4)))/CAST(MaxFileSize as decimal(18,4))) as decimal(18,4)) as PercentUsed
		into #DB_SPACE_CHECK2 
		from #DB_SPACE_CHECK
		where DatabaseName NOT IN (''master'',''model'',''msdb'',''ReportServer'',''ReportServerTempDB'') AND
			  DatabaseName NOT LIKE ''wslogdb70%''

		-- build cursor for #DB_SPACE_CHECK2 temp table
		DECLARE limited_db_cursor CURSOR FOR
			SELECT ServerName,
				   DatabaseName,
				   SpaceRemainingMB,
				   FileType 
			FROM #DB_SPACE_CHECK2 
			where DatabaseName not in (''master'',''model'',''msdb'',''ReportServer'',''ReportServerTempDB'') AND
				  ((FileType = N''ROWS'' AND PercentUsed >= 0.9700) OR 
				  (FileType = N''LOG'' AND PercentUsed >= 0.9000))
		
		OPEN limited_db_cursor
		FETCH NEXT FROM limited_db_cursor
		INTO @server_name, @database_name, @space_remaining, @file_type

		-- Check @@FETCH_STATUS to see if there are any more rows to fetch.
		WHILE @@FETCH_STATUS = 0
		BEGIN
			-- set the subject line to include the server name
			SET @subject = @server_name + '' Space Alert'' 

			-- define the body of the email
            select @email_body = ''Server Name:  '' + @server_name + CHAR(10) +
							     ''Database Name:  '' + @database_name + CHAR(10) +
							     ''Current MB Free:  '' + @space_remaining + CHAR(10) +
							     ''File Type:  '' + @file_type

			-- only send email if the file type is ROWS or LOG
            if (@file_type = ''ROWS'' OR @file_type = ''LOG'')          
			    EXEC msdb.dbo.sp_send_dbmail
                @profile_name = @profile_name,
                @recipients = @recipients,
                @subject = @subject,
                @body = @email_body
		    else
				print ''no criteria match''

            FETCH NEXT FROM limited_db_cursor
            INTO @server_name, @database_name, @space_remaining, @file_type
		END
		
		--close and deallocate the cursor
		close limited_db_cursor
		deallocate limited_db_cursor
	END

ELSE -- indicates some databases are listed as ''UNLIMITED'' so therefore alert DBAs to fix the issue
	BEGIN

		-- build cursor for #DB_SPACE_CHECK temp table
		DECLARE unlimited_db_cursor CURSOR FOR
			SELECT ServerName,
				   DatabaseName,
				   SpaceRemainingMB,
				   FileType 
			FROM #DB_SPACE_CHECK 
			where (MaxFileSize = ''UNLIMITED'' OR SpaceRemainingMB = ''UNLIMITED'') AND 
				  DatabaseName NOT IN (''master'',''model'',''msdb'',''ReportServer'',''ReportServerTempDB'') AND
				  DatabaseName NOT LIKE ''wslogdb70%''
		
		OPEN unlimited_db_cursor
		FETCH NEXT FROM unlimited_db_cursor
		INTO @server_name, @database_name, @space_remaining, @file_type

		-- Check @@FETCH_STATUS to see if there are any more rows to fetch.
		WHILE @@FETCH_STATUS = 0
		BEGIN
			
			-- set the subject line
			SET @subject = @database_name + '' on '' + @server_name + '' is listed as Unlimited''

			-- define the body of the email
            select @email_body = ''Server Name:  '' + @server_name + CHAR(10) +
							     ''Database Name:  '' + @database_name + CHAR(10) +
							     ''Current MB Free:  '' + @space_remaining + CHAR(10) +
							     ''File Type:  '' + @file_type

            if (@file_type = ''ROWS'' OR @file_type = ''LOG'')          
			    EXEC msdb.dbo.sp_send_dbmail
                @profile_name = @profile_name,
                @recipients = @recipients,
                @subject = @subject,
                @body = @email_body
		    else
				print ''no criteria match''

            FETCH NEXT FROM unlimited_db_cursor
            INTO @server_name, @database_name, @space_remaining, @file_type
		END
		
		--close and deallocate the cursor
		close unlimited_db_cursor
		deallocate unlimited_db_cursor
	END
go
', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Every 15 Minutes', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=15, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140212, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'6e72d0bd-71eb-4b19-bf9b-c99b8b1099f7'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:16 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Check Disk Space', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Check Disk Space]    Script Date: 11/20/2014 2:09:16 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Check Disk Space', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'use master
go

-- set configuration for OLE automation
-- (will be used with the file system object)
EXEC sp_configure ''Ole Automation Procedures'', 1
GO 

-- commit reconfiguration
RECONFIGURE
GO

IF OBJECT_ID(''tempdb..#TEST_SYSMAIL_PROFILES'') IS NOT NULL
	BEGIN
		DROP TABLE #TEST_SYSMAIL_PROFILES;
	END

-- create temp table to store email profiles
CREATE TABLE #TEST_SYSMAIL_PROFILES
	(principal_id int,
	 principal_name varchar(200),
	 profile_id int,
	 profile_name varchar(200),
	 is_default bit)
	 
-- insert email profiles into temp table
insert into #TEST_SYSMAIL_PROFILES
EXECUTE msdb.dbo.sysmail_help_principalprofile_sp;	
	
-- removes temp table if it exists
IF OBJECT_ID(''tempdb..#drives'') IS NOT NULL 
	BEGIN
		DROP TABLE #drives
	END
	
/*
   Displays the free space,free space percentage 
   plus total drive size for a server
*/
SET NOCOUNT ON

DECLARE @hr int
DECLARE @fso int
DECLARE @drive char(1)
DECLARE @odrive int
DECLARE @TotalSize varchar(20)
DECLARE @MB bigint ; SET @MB = 1048576

DECLARE @profile_name varchar(2000) 

-- retrieve email profile
SELECT TOP 1 @profile_name = profile_name
FROM #TEST_SYSMAIL_PROFILES

-- create temp table
CREATE TABLE #drives (drive char(1) PRIMARY KEY,
                      FreeSpace int NULL,
                      TotalSize int NULL)

-- insert drive information into temp table
INSERT #drives(drive,FreeSpace) 
EXEC master.dbo.xp_fixeddrives

-- initialize file system object
EXEC @hr=sp_OACreate ''Scripting.FileSystemObject'',@fso OUT
IF @hr <> 0 EXEC sp_OAGetErrorInfo @fso

-- declare cursor to retrieve drives from
-- the temp table
DECLARE dcur CURSOR LOCAL FAST_FORWARD
FOR SELECT drive from #drives
ORDER by drive

OPEN dcur

FETCH NEXT FROM dcur INTO @drive

-- process data from temp table
WHILE @@FETCH_STATUS=0
BEGIN
		-- use the GetDrive method from the file system object to
		-- set the @odrive variable to the drive in the cursor
        EXEC @hr = sp_OAMethod @fso,''GetDrive'', @odrive OUT, @drive
        IF @hr <> 0 EXEC sp_OAGetErrorInfo @fso
        
        -- retrieve total size of drive
        EXEC @hr = sp_OAGetProperty @odrive,''TotalSize'', @TotalSize OUT
        IF @hr <> 0 EXEC sp_OAGetErrorInfo @odrive
		
		-- update the temp table with the
		-- total size of the drive
        UPDATE #drives
        SET TotalSize=@TotalSize/@MB
        WHERE drive=@drive
        
        FETCH NEXT FROM dcur INTO @drive
END

CLOSE dcur
DEALLOCATE dcur

-- close the file system object
EXEC @hr=sp_OADestroy @fso
IF @hr <> 0 EXEC sp_OAGetErrorInfo @fso

DECLARE @drive_location varchar(50)
DECLARE @total_disk_size int
DECLARE @space_used int
DECLARE @space_available int
DECLARE @percent_used varchar(50)
DECLARE @percent_available varchar(50)
DECLARE @email_body varchar(max)
DECLARE @recipients varchar(2000) 
DECLARE @subject varchar(2000)
DECLARE @fields varchar(2000)

SET @recipients = ''DL-KMHP_MSSQLDBAGroup@kmhp.com'' -- distribution list
SET @subject = ''SERVER DRIVE SPACE ALERT  FOR '' + @@SERVERNAME -- email subject line

-- declare cursor to retrieve data
DECLARE DRIVE_SPACE_CURSOR CURSOR FOR 
	SELECT drive AS DRIVE_LOCATION,
		   TotalSize as TOTAL_DISK_SIZE_MB,
		   TotalSize-FreeSpace AS SPACE_USED_MB,
		   FreeSpace as SPACE_AVAILABLE_MB,
		   CAST(CAST(CAST((CAST(TotalSize as decimal(18,4))-CAST(FreeSpace as decimal(18,4)))/TotalSize as decimal(18,4))*100 as decimal(18,2)) as varchar(10)) + ''%'' AS PERCENT_USED,
		   CAST(CAST(CAST((CAST(FreeSpace as decimal(18,4)))/TotalSize as decimal(18,4))*100 as decimal(18,2)) as varchar(10)) + ''%'' AS PERCENT_AVAILABLE
	FROM #drives
	WHERE CAST(CAST(FreeSpace as decimal(18,4))/CAST(TotalSize as decimal(18,4)) as decimal(18,4)) <= 0.0300
	ORDER BY drive
	
SET @email_body = NULL -- set email body to null initially

OPEN DRIVE_SPACE_CURSOR

FETCH NEXT FROM DRIVE_SPACE_CURSOR INTO @drive_location,
										@total_disk_size,
										@space_used,
										@space_available,
										@percent_used,
										@percent_available

-- process records from the cursor
WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @email_body IS NULL 
			BEGIN -- make initial email body
				SET @email_body = ''Drive Letter:  '' + @drive_location + CHAR(13) +
								  ''Total Disk Size (MB):  '' + CAST(@total_disk_size as varchar(100)) + CHAR(13) + 
								  ''Space Used (MB):  '' + CAST(@space_used as varchar(100)) + CHAR(13) + 
								  ''Space Available (MB):  '' + CAST(@space_available as varchar(100)) + CHAR(13) + 
								  ''Percent Used:  '' + @percent_used + CHAR(13) + 
								  ''Percent Available:  '' + @percent_available + CHAR(13) + CHAR(13)
			END
		ELSE
			BEGIN -- append email body to the previous one
				SET @email_body = @email_body + ''Drive Letter:  '' + @drive_location + CHAR(13) +
								  ''Total Disk Size (MB):  '' + CAST(@total_disk_size as varchar(100)) + CHAR(13) + 
								  ''Space Used (MB):  '' + CAST(@space_used as varchar(100)) + CHAR(13) + 
								  ''Space Available (MB):  '' + CAST(@space_available as varchar(100)) + CHAR(13) + 
								  ''Percent Used:  '' + @percent_used + CHAR(13) + 
								  ''Percent Available:  '' + @percent_available + CHAR(13) + CHAR(13)			
			END
						  
		FETCH NEXT FROM DRIVE_SPACE_CURSOR INTO @drive_location,
												@total_disk_size,
												@space_used,
												@space_available,
												@percent_used,
												@percent_available
	END


CLOSE DRIVE_SPACE_CURSOR
DEALLOCATE DRIVE_SPACE_CURSOR

-- send email if the body is not null
IF @email_body IS NOT NULL
	BEGIN
		EXEC msdb.dbo.sp_send_dbmail
			@profile_name = @profile_name,
			@recipients = @recipients,
			@subject = @subject,
			@body = @email_body
	END
go


', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily 30mins', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=24, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20111029, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'e0b685bc-d045-47b1-94c9-dd3ab2625179'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:16 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Check Server Status', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Check Server Status]    Script Date: 11/20/2014 2:09:16 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Check Server Status', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'USE master 
go 
--IF OBJECT_ID(''serverstartup'') IS NOT NULL 
--	BEGIN
--		DROP PROC serverstartup;
--	END

--GO
	
--CREATE PROC serverstartup
--AS

SET NOCOUNT ON

-- remove the ##sqlservice temp table if it exists
IF EXISTS(SELECT 1 FROM tempdb..sysobjects where name =''##sqlservice'')
	DROP TABLE ##sqlservice

-- create a new ##sqlservice temp table
CREATE TABLE ##sqlservice (details VARCHAR(100))

-- remove the ##agentservice temp table if it exists
IF EXISTS(SELECT 1 FROM tempdb..sysobjects where name =''##agentservice'')
	DROP TABLE ##agentservice

-- create a new ##agentservice temp table
CREATE TABLE ##agentservice (details VARCHAR(100))

-- remove the #TEST_SYSMAIL_PROFILES temp table if it exists
IF OBJECT_ID(''tempdb..#TEST_SYSMAIL_PROFILES'') IS NOT NULL
	BEGIN
		DROP TABLE #TEST_SYSMAIL_PROFILES;
	END
	
-- create temp table to store email profiles
CREATE TABLE #TEST_SYSMAIL_PROFILES
	(principal_id int,
	 principal_name varchar(200),
	 profile_id int,
	 profile_name varchar(200),
	 is_default bit)
	
DECLARE @sname VARCHAR(100), @starttime VARCHAR(30)
DECLARE @authmode VARCHAR(25), @subject VARCHAR(250)
DECLARE @insname VARCHAR(50),@agentname VARCHAR(50)
DECLARE @sqlstatus VARCHAR(100), @agentstatus VARCHAR(100)
DECLARE @dbstatus VARCHAR(100), @dbdetail VARCHAR(2000)
DECLARE @sctsql VARCHAR(200), @HTML VARCHAR(8000)
DECLARE @recipients varchar(200)

DECLARE @profile_name varchar(2000) 

	 
-- insert email profiles into temp table
insert into #TEST_SYSMAIL_PROFILES
EXECUTE msdb.dbo.sysmail_help_principalprofile_sp;

-- retrieve email profile
SELECT TOP 1 @profile_name = profile_name
FROM #TEST_SYSMAIL_PROFILES

SET @recipients = ''DL-KMHP_MSSQLDBAGroup@kmhp.com'' -- add distribution list(s) here

-- retrieve the server name, authentication mode
-- and start time
SELECT @sname = @@SERVERNAME
SELECT @authmode=case SERVERPROPERTY(''IsIntegratedSecurityOnly'') when 1 then ''Windows'' else ''Mixed'' end 
SELECT @starttime=CONVERT(VARCHAR(30),create_date,109) from sys.databases where database_id=2

-- retrieve the service names (MS SQL Server and MS SQL Server Agent)
IF (serverproperty(''InstanceName'')) IS NOT NULL
	BEGIN
		SET @insname=''mssql$''+CONVERT(VARCHAR(40),serverproperty(''InstanceName''))
		SET @agentname=''sqlagent$''+CONVERT(VARCHAR(40),serverproperty(''InstanceName''))
	END
ELSE
	BEGIN
		SET @insname=''mssqlserver''
		SET @agentname=''sqlserveragent''
	END

-- retrieve the status of the MS SQL Server instance	
SELECT @sctsql=''EXEC master.dbo.xp_cmdshell ''''sc query ''+@insname+'' | FIND "STATE"''''''
INSERT ##sqlservice
EXEC (@sctsql)

-- retrieve the status of the MS SQL Server Agent instance
SELECT @sctsql=''EXEC master.dbo.xp_cmdshell ''''sc query ''+@agentname+'' | FIND "STATE"''''''
INSERT ##agentservice
EXEC (@sctsql)

-- set the status for running or not running (MS SQL Server)
IF EXISTS(SELECT 1 FROM ##sqlservice WHERE details LIKE ''%RUNNING%'')
	SET @sqlstatus = ''Running''
ELSE 
	SET @sqlstatus = ''<font color="red">Not Running</font>''

-- set the status for running or not running (MS SQL Server Agent)	
IF EXISTS(SELECT 1 FROM ##agentservice WHERE details LIKE ''%RUNNING%'')
	SET @agentstatus = ''Running''
ELSE
	SET @agentstatus = ''<font color="red">Not Running</font>''

-- detemine if the databases are online or offline	
IF EXISTS (SELECT 1 FROM sys.databases WHERE state_desc<>''ONLINE'')
	BEGIN
		SET @dbstatus= ''<font color="red">Some of the database(s) are offline</font>''
		SELECT @dbdetail = ''<table border="1"><tr><th>Database Name</th><th>Database Status</th></tr><tr>''
		SELECT @dbdetail = @dbdetail + ''<td  align="Center">'' + name + ''</td><td  align="Center">''+state_desc+''</td></tr></table>'' FROM sys.databases WHERE state_desc<>''ONLINE''
	END
ELSE
	BEGIN
		SET @dbdetail = ''''
		SET @dbstatus=''All databases are online''
	END

-- set the subject for the email	
SET @subject=@sname+'' : SQL Server Service is Offline. Please Check''

-- set the email body in HTML format
SET @HTML=''<h3>''+@sname+''</h3><br>''+''<table border="1"><tr><th>SQL Server Startup time</th><th>SQL Server Service</th><th>SQL Agent Service</th> <th>Database(s) Status</th><th>Authentication Mode</th></tr><tr><td align="Center">''+
@starttime+''</td><td align="Center">''+@sqlstatus+''</td><td align="Center">''+@agentstatus+''</td><td align="Center">''+@dbstatus+''</td><td align="Center">''+@authmode+''</td></tr></table><br><br>''+@dbdetail

-- if either statuses are not running send the an email
IF @sqlstatus <> ''Running'' OR @agentstatus <> ''Running''
	BEGIN
		EXEC msdb.dbo.sp_send_dbmail  
			@profile_name = @profile_name,
			@recipients =@recipients,
			@subject=@subject,
			@body =@HTML,
			@body_format =''HTML''
	END 
GO

--Enabling startup parameter for that procedure
--EXEC sp_procoption ''serverstartup'',''startup'',True
--GO
', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Every 10 mins', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=10, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20111031, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'3c858cb0-cc20-4951-8967-bed39568b8e5'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:16 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.60.Min', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [execute powershell]    Script Date: 11/20/2014 2:09:16 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'execute powershell', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe G:\CMS\jobs\30_Min.ps1', 
		@flags=0, 
		@proxy_name=N'CMS'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TrackJobHistory]    Script Date: 11/20/2014 2:09:16 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TrackJobHistory', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec TrackHistory 1', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Alert New Databases]    Script Date: 11/20/2014 2:09:16 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Alert New Databases', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec Alert_Databases', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'every 60 min', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=8, 
		@freq_subday_interval=2, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140321, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'12cface4-75a5-4643-8bbe-72d11d5b2fb6'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:17 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.Alerts.Backups', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Execute Backup Alert]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Execute Backup Alert', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'Alert_Backups ''PRODUCTION''', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Bi Hourly During business hours', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=8, 
		@freq_subday_interval=2, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140415, 
		@active_end_date=99991231, 
		@active_start_time=71500, 
		@active_end_time=191500, 
		@schedule_uid=N'b240c237-5dde-42fa-9428-e1c3f85cad81'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:17 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.Alerts.DatabaseFileSpace', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Execute DatabaseFile Alerts]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Execute DatabaseFile Alerts', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec Alert_DatabaseFiles ''hourly'',''production''', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Hourly', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=8, 
		@freq_subday_interval=1, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140320, 
		@active_end_date=99991231, 
		@active_start_time=1500, 
		@active_end_time=235959, 
		@schedule_uid=N'd50b12b7-4e20-47f7-809b-3d9898dac816'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Data Collector]    Script Date: 11/20/2014 2:09:17 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Data Collector' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Data Collector'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.CounterCollector', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'Data Collector', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Run Resource Collection]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Run Resource Collection', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe G:\CMS\jobs\PerfCounters.ps1', 
		@flags=0, 
		@proxy_name=N'CMS'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Every 5 Minutes', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=5, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140714, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'e33a698c-017f-4648-bf0c-8bf82d3b7c18'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:17 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.Daily.Collection', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [execute powershell]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'execute powershell', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe G:\CMS\jobs\Daily.ps1', 
		@flags=0, 
		@proxy_name=N'CMS'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Run Daily Reports]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Run Daily Reports', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec Alert_AgentJobs ''DEVELOPMENT''
go
exec Alert_Backups ''DEVELOPMENT''
go
exec Alert_DatabaseFiles ''Daily'',''DEVELOPMENT''
go
exec Alert_Databases
GO
exec Alert_AgentJobs ''PRODUCTION''
go
exec Alert_Backups ''PRODUCTION''
go
exec Alert_DatabaseFiles ''Daily'',''PRODUCTION''
go
', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'daily', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140327, 
		@active_end_date=99991231, 
		@active_start_time=71500, 
		@active_end_time=235959, 
		@schedule_uid=N'587fd2d8-a08e-4cef-bacb-8ab5de08e87a'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:17 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.Purge', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Purges CollectionLog and history tables based on corresponding values in config table.', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'KMHP\jshurak', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Execute SP]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Execute SP', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec CMS.dbo.Purge_CMS', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Monthly Purge', 
		@enabled=1, 
		@freq_type=16, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20140522, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'8bd115e2-febc-4db2-8ed9-df5d0f3269f4'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Data Collector]    Script Date: 11/20/2014 2:09:17 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Data Collector' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Data Collector'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.ResourceMonitor', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'Data Collector', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Run Resource Collection]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Run Resource Collection', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe G:\CMS\jobs\Resources.ps1', 
		@flags=0, 
		@proxy_name=N'CMS'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Checking for Active Blocking]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Checking for Active Blocking', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC Alert_Blocking', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Alert DriveSpace]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Alert DriveSpace', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec Alert_DriveSpace ''PRODUCTION''', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'10 Minutes', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=10, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140310, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'74fe8fa1-b286-4977-bd87-bae53097cba8'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:17 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.ServerInstanceMonitoring', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Run Powershell]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Run Powershell', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe G:\CMS\jobs\ServerInstanceMonitoring.ps1', 
		@flags=0, 
		@proxy_name=N'CMS'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Run Alert procs]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Run Alert procs', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec Alert_OfflineInstances ''PRODUCTION''
GO
exec Alert_OfflineServers ''PRODUCTION''
GO
exec Alert_OfflineServices ''PRODUCTION''
GO', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'5 Minutes', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=5, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140602, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'0a4a04a1-e839-490e-a97b-f395c2059a6c'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:17 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.TrackHistory', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Record Yesterday's stats]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Record Yesterday''s stats', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec TrackHistory', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Track Baselines]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Track Baselines', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec TrackBaseline', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Nightly', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140313, 
		@active_end_date=99991231, 
		@active_start_time=100, 
		@active_end_time=235959, 
		@schedule_uid=N'fa3d8775-253f-46ce-a8ef-bc3a151452e6'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:18 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CommandLog Cleanup', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [CommandLog Cleanup]    Script Date: 11/20/2014 2:09:18 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'CommandLog Cleanup', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "DELETE FROM [dbo].[CommandLog] WHERE StartTime < DATEADD(dd,-30,GETDATE())" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\CommandLogCleanup_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:18 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DatabaseBackup - SYSTEM_DATABASES - FULL', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DatabaseBackup - SYSTEM_DATABASES - FULL]    Script Date: 11/20/2014 2:09:18 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DatabaseBackup - SYSTEM_DATABASES - FULL', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "EXECUTE [dbo].[DatabaseBackup] @Databases = ''SYSTEM_DATABASES'', @Directory = N''C:\Backup'', @BackupType = ''FULL'', @Verify = ''Y'', @CleanupTime = NULL, @CheckSum = ''Y'', @LogToTable = ''Y''" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\DatabaseBackup_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:18 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DatabaseBackup - USER_DATABASES - DIFF', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DatabaseBackup - USER_DATABASES - DIFF]    Script Date: 11/20/2014 2:09:18 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DatabaseBackup - USER_DATABASES - DIFF', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "EXECUTE [dbo].[DatabaseBackup] @Databases = ''USER_DATABASES'', @Directory = N''C:\Backup'', @BackupType = ''DIFF'', @Verify = ''Y'', @CleanupTime = NULL, @CheckSum = ''Y'', @LogToTable = ''Y''" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\DatabaseBackup_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:18 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DatabaseBackup - USER_DATABASES - FULL', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DatabaseBackup - USER_DATABASES - FULL]    Script Date: 11/20/2014 2:09:18 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DatabaseBackup - USER_DATABASES - FULL', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "EXECUTE [dbo].[DatabaseBackup] @Databases = ''USER_DATABASES'', @Directory = N''C:\Backup'', @BackupType = ''FULL'', @Verify = ''Y'', @CleanupTime = NULL, @CheckSum = ''Y'', @LogToTable = ''Y''" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\DatabaseBackup_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:18 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DatabaseBackup - USER_DATABASES - LOG', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DatabaseBackup - USER_DATABASES - LOG]    Script Date: 11/20/2014 2:09:18 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DatabaseBackup - USER_DATABASES - LOG', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "EXECUTE [dbo].[DatabaseBackup] @Databases = ''USER_DATABASES'', @Directory = N''C:\Backup'', @BackupType = ''LOG'', @Verify = ''Y'', @CleanupTime = NULL, @CheckSum = ''Y'', @LogToTable = ''Y''" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\DatabaseBackup_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:18 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DatabaseIntegrityCheck - SYSTEM_DATABASES', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DatabaseIntegrityCheck - SYSTEM_DATABASES]    Script Date: 11/20/2014 2:09:18 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DatabaseIntegrityCheck - SYSTEM_DATABASES', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "EXECUTE [dbo].[DatabaseIntegrityCheck] @Databases = ''SYSTEM_DATABASES'', @LogToTable = ''Y''" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\DatabaseIntegrityCheck_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:18 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DatabaseIntegrityCheck - USER_DATABASES', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DatabaseIntegrityCheck - USER_DATABASES]    Script Date: 11/20/2014 2:09:18 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DatabaseIntegrityCheck - USER_DATABASES', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "EXECUTE [dbo].[DatabaseIntegrityCheck] @Databases = ''USER_DATABASES'', @LogToTable = ''Y''" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\DatabaseIntegrityCheck_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:18 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'History Cleanup.Subplan_1', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Subplan_1]    Script Date: 11/20/2014 2:09:18 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Subplan_1', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/Server "$(ESCAPE_NONE(SRVR))" /SQL "Maintenance Plans\History Cleanup" /set "\Package\Subplan_1.Disable;false"', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'History Cleanup.Subplan_1', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20140128, 
		@active_end_date=99991231, 
		@active_start_time=230000, 
		@active_end_time=235959, 
		@schedule_uid=N'06e1fc89-9e74-4cfd-9969-c7746df1eaeb'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:18 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'IndexOptimize - USER_DATABASES', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [IndexOptimize - USER_DATABASES]    Script Date: 11/20/2014 2:09:18 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'IndexOptimize - USER_DATABASES', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "EXECUTE [dbo].[IndexOptimize] @Databases = ''USER_DATABASES'', @LogToTable = ''Y''" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\IndexOptimize_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:18 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Output File Cleanup', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Output File Cleanup]    Script Date: 11/20/2014 2:09:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Output File Cleanup', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'cmd /q /c "For /F "tokens=1 delims=" %v In (''ForFiles /P "G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG" /m *_*_*_*.txt /d -30 2^>^&1'') do if EXIST "G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG"\%v echo del "G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG"\%v& del "G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG"\%v"', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\OutputFileCleanup_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [ProcessAppVReportingData]    Script Date: 11/20/2014 2:09:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'ProcessAppVReportingData' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'ProcessAppVReportingData'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'ProcessAppVReportingDataJob', 
		@enabled=1, 
		@notify_level_eventlog=3, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Process AppV Reporting Data. --- AmHealth contact: Michael Sorino & Michael Gallager -- disabled 10/7/14', 
		@category_name=N'ProcessAppVReportingData', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Process AppV Reporting Data]    Script Date: 11/20/2014 2:09:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Process AppV Reporting Data', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'Exec dbo.spProcessClientReport', 
		@database_name=N'AppVReportingQA', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Process AppV Reporting Data Schedule', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20120823, 
		@active_end_date=99991231, 
		@active_start_time=100, 
		@active_end_time=235959, 
		@schedule_uid=N'dc8d32ff-974b-41dc-a6a4-93c7cb5a26dd'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Rebuild Fragmented Indexes (variable)', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeFrag Tables]    Script Date: 11/20/2014 2:09:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeFrag Tables', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXECUTE dbo.IndexOptimize
@Databases = ''ALL_DATABASES'',
@FragmentationLow = NULL,
@FragmentationMedium = ''INDEX_REORGANIZE,INDEX_REBUILD_ONLINE,INDEX_REBUILD_OFFLINE'',
@FragmentationHigh = ''INDEX_REBUILD_ONLINE,INDEX_REBUILD_OFFLINE'',
@FragmentationLevel1 = 5,
@FragmentationLevel2 = 30,
@UpdateStatistics = ''ALL'',
@OnlyModifiedStatistics = ''Y'',
@SortInTempdb = ''Y'',
@PartitionLevel = ''Y'',
@LogToTable = ''Y''
', 
		@database_name=N'DATA_COLLECTION', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Index2', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=64, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20120928, 
		@active_end_date=99991231, 
		@active_start_time=20000, 
		@active_end_time=235959, 
		@schedule_uid=N'ecd7f060-1f9f-44df-9020-f7937de03330'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Recycle Agent Error Log', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Agent Error Log Step]    Script Date: 11/20/2014 2:09:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Agent Error Log Step', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec sp_cycle_agent_errorlog -- run this job every week on Sunday Night
go', 
		@database_name=N'msdb', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Sunday at Midnight', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20111102, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'3148faa3-eef8-4145-a5b8-3f69f599f2a1'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Recycle Error Log', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Cycle Error Log]    Script Date: 11/20/2014 2:09:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Cycle Error Log', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC sp_cycle_errorlog
GO', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily Midnight', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20111029, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'094d4278-406a-4eda-a74c-73ebabff7261'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Server Status', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Server Status]    Script Date: 11/20/2014 2:09:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Server Status', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @server_start_time DATETIME, 
@row INT; 

SELECT @server_start_time = login_time 
FROM master.sys.sysprocesses 
WHERE spid = 1 ; 

select @row = (select MAX(row_num) from server_restart_time)
set @row = (@row + 1)
insert into server_restart_time SELECT @server_start_time, @row


if @server_start_time = (select service_restart from server_restart_time where row_num = (@row-1))
delete from server_restart_time where row_num = @row

select * from server_restart_time', 
		@database_name=N'DATA_COLLECTION', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20131205, 
		@active_end_date=99991231, 
		@active_start_time=230000, 
		@active_end_time=235959, 
		@schedule_uid=N'5713ed3c-4398-448c-9c84-616770ad5761'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'sp_delete_backuphistory', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [sp_delete_backuphistory]    Script Date: 11/20/2014 2:09:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'sp_delete_backuphistory', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d msdb -Q "DECLARE @CleanupDate datetime SET @CleanupDate = DATEADD(dd,-30,GETDATE()) EXECUTE dbo.sp_delete_backuphistory @oldest_date = @CleanupDate" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\sp_delete_backuphistory_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'sp_purge_jobhistory', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [sp_purge_jobhistory]    Script Date: 11/20/2014 2:09:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'sp_purge_jobhistory', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d msdb -Q "DECLARE @CleanupDate datetime SET @CleanupDate = DATEADD(dd,-30,GETDATE()) EXECUTE dbo.sp_purge_jobhistory @oldest_date = @CleanupDate" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\sp_purge_jobhistory_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'syspolicy_purge_history', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Verify that automation is enabled.]    Script Date: 11/20/2014 2:09:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Verify that automation is enabled.', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=1, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'IF (msdb.dbo.fn_syspolicy_is_automation_enabled() != 1)
        BEGIN
            RAISERROR(34022, 16, 1)
        END', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Purge history.]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Purge history.', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC msdb.dbo.sp_syspolicy_purge_history', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Erase Phantom System Health Records.]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Erase Phantom System Health Records.', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'PowerShell', 
		@command=N'if (''$(ESCAPE_SQUOTE(INST))'' -eq ''MSSQLSERVER'') {$a = ''\DEFAULT''} ELSE {$a = ''''};
(Get-Item SQLSERVER:\SQLPolicy\$(ESCAPE_NONE(SRVR))$a).EraseSystemHealthPhantomRecords()', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'syspolicy_purge_history_schedule', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20080101, 
		@active_end_date=99991231, 
		@active_start_time=20000, 
		@active_end_time=235959, 
		@schedule_uid=N'9f503e7a-f6cf-4b4e-969d-fb9bac2e7598'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:20 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'sysutility_get_cache_tables_data_into_aggregate_tables_daily', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'At every 12:01 AM stroke, the data of the cache tables get aggregated and put into corresponding aggregate by day tables.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Aggregate current days data from the cache tables into the server aggregation table]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Aggregate current days data from the cache tables into the server aggregation table', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @now DATETIME; SELECT @now = GETUTCDATE(); EXEC [sysutility_ucp_core].sp_copy_cache_table_data_into_aggregate_tables @aggregation_type=2, @endTime=@now', 
		@database_name=N'sysutility_mdw', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Purge cache table history data based on retention period]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Purge cache table history data based on retention period', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC [sysutility_ucp_core].[sp_purge_cache_tables];', 
		@database_name=N'sysutility_mdw', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Purge resource health policy evaluation history based on trailing window]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Purge resource health policy evaluation history based on trailing window', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC msdb.dbo.sp_sysutility_ucp_delete_policy_history', 
		@database_name=N'msdb', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'OccursOnceADayAt12:01AM', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20080218, 
		@active_end_date=99991231, 
		@active_start_time=100, 
		@active_end_time=235959, 
		@schedule_uid=N'acb4d2d5-d2ee-4d33-b82e-a296a41fc225'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:20 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'sysutility_get_cache_tables_data_into_aggregate_tables_hourly', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'At every hour''s stroke, the data of the cache tables get aggregated and put into corresponding aggregate by hour tables.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Aggregate current hours data from the cache tables into the server aggregation table]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Aggregate current hours data from the cache tables into the server aggregation table', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @now DATETIMEOFFSET(7); SELECT @now = SYSDATETIMEOFFSET(); EXEC [sysutility_ucp_core].sp_copy_cache_table_data_into_aggregate_tables @aggregation_type=1, @endTime=@now', 
		@database_name=N'sysutility_mdw', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'OccursEveryOneHour', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=8, 
		@freq_subday_interval=1, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140918, 
		@active_end_date=99991231, 
		@active_start_time=100, 
		@active_end_time=235959, 
		@schedule_uid=N'51a7404f-7bd0-4210-87b7-da1eb2ff3f6e'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:20 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'sysutility_get_views_data_into_cache_tables', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Gets all the views data into corresponding cache tables after every 15 minutes', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Insert latest data from live tables into cache tables]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Insert latest data from live tables into cache tables', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC [sysutility_ucp_staging].sp_copy_live_table_data_into_cache_tables', 
		@database_name=N'sysutility_mdw', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Execute resource health policy evaluation job]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Execute resource health policy evaluation job', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'PowerShell', 
		@command=N'$serverName = ''$(ESCAPE_SQUOTE(SRVR))'';
                                   $path = Convert-UrnToPath "PolicyStore[@Name=`''$serverName`'']";
                                   dir $path\Policies -FORCE | where { $_.IsSystemObject -eq $true -and $_.Name -like ''Utility*'' } | Invoke-PolicyEvaluation -TargetServerName $serverName;', 
		@database_name=N'msdb', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Compute resource health states]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Compute resource health states', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC msdb.dbo.sp_sysutility_ucp_calculate_health', 
		@database_name=N'msdb', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'OccursEvery15Minutes', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=15, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140918, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'7c3e972b-6e4b-4c61-9061-715d8b9ba531'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Utility - Managed Instance]    Script Date: 11/20/2014 2:09:20 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Utility - Managed Instance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Utility - Managed Instance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'sysutility_mi_collect_and_upload', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Collect configuration and performance information', 
		@category_name=N'Utility - Managed Instance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Record batch start time]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Record batch start time', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'
               USE tempdb
               
               IF OBJECT_ID (''[tempdb].[dbo].[sysutility_batch_time_internal]'') IS NOT NULL
               BEGIN
                  DROP TABLE [tempdb].[dbo].[sysutility_batch_time_internal];
               END;
               
               CREATE TABLE [tempdb].[dbo].[sysutility_batch_time_internal] (
                  latest_batch_time datetimeoffset(7) PRIMARY KEY NOT NULL
               );
                  
               -- The DC job needs to access the timestamp in this table, and it may not run under a login that 
               -- is mapped to a user in tempdb, so grant SELECT permissions to public.  The table contains no 
               -- sensitive data (only a single datetimeoffset value), so granting read permission to public 
               -- does create a security problem. 
               GRANT SELECT ON [tempdb].[dbo].[sysutility_batch_time_internal] TO PUBLIC;

               -- Save the start time for the current execution of the managed instance data collection job
               INSERT INTO [tempdb].[dbo].[sysutility_batch_time_internal] (latest_batch_time) VALUES (SYSDATETIMEOFFSET());', 
		@database_name=N'tempdb', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Stage Data Collected from PowerShell Script]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Stage Data Collected from PowerShell Script', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'PowerShell', 
		@command=N'[Void] [System.Reflection.Assembly]::LoadWithPartialName("System.Data")
[Void] [System.Reflection.Assembly]::LoadWithPartialName("System.Diagnostics")
[Void] [System.Reflection.Assembly]::LoadWithPartialName("System.Collections")

###############################################################################
# Powershell settings
###############################################################################

# Generate an error if attempt to access a nonexisting variable
Set-PsDebug -Strict

# Global settings for what to do on a error, warning, or verbose call
# Change these settings to change how this script writes output in the agent logs
# Settings also affects how SQL Agent reports success or failure in the script
# Options are:
#      Continue - Continue processing and notify the user 
#             - Agent reaction: step will report success, and
#                           log will include message
#      Inquire - Stop processing and ask the user how it should proceed 
#             - Agent reaction: step fails with "cannot invoke this function"
#                           the Agent PS provider does not implement this
#      SilentlyContinue - Continue processing without notifying the user
#                    - Agent reaction:  will not fail step 
#                                 and will not log any message
#      Stop - Stop processing when an action occurs
#          - Agent reaction: step will fail with message in log
$VerbosePreference = "SilentlyContinue"
$WarningPreference = "Continue"
$ErrorActionPreference = "Stop"

###############################################################################
# Global Variables
###############################################################################

# The following line uses SQL Agent tokens to set the server name
# ESCAPE_SQUOTE(SRVR) with a $ sign in front is a special token to SQL Agent
# When the job is run, SQL Agent will expand the string to the server name
# Use single quotes so that PS considers the string a literal and will not
# try to expand the $ reference and the script will not fail in a test environment
$serverName = ''$(ESCAPE_SQUOTE(SRVR))''

# Currently the best way to tell if the script is running in Agent
# is to check if the console is not the ConsoleHost.  The Powershell
# subsystem for Agent has no console and thus writing to the host directly
# does not show up in the Agent logs.
$isNotConsole = ($host.Name -ne "ConsoleHost")

$connection = $null
$transaction = $null
$isVistaOrXPSp2OrHigher = $null
$sleepTimeoutSeconds = 5
$directoryNameToDeviceId=$null

$cpuStageTableName = "[msdb].[dbo].[sysutility_mi_cpu_stage_internal]"
$cpuStageDataTable = $null
$cpuNumProcessorsColumnName = "num_processors"
$cpuNameColumnName = "cpu_name"
$cpuCaptionColumnName = "cpu_caption"
$cpuFamilyIdColumnName = "cpu_family_id"  
$cpuArchitectureIdColumnName = "cpu_architecture_id"
$cpuMaxClockSpeedColumnName = "cpu_max_clock_speed"
$cpuClockSpeedColumnName = "cpu_clock_speed"
$cpuL2CacheSizeColumnName = "l2_cache_size"
$cpuL3CacheSizeColumnName = "l3_cache_size"
# Start of collection column names
$cpuInstanceProcessorUsageStartTicks = "instance_processor_usage_start_ticks"
$cpuInstanceCollectTimeStartTicks = "instance_collect_time_start_ticks"
$cpuComputerProcessorIdleStartTicks = "computer_processor_idle_start_ticks"
$cpuComputerCollectTimeStartTicks = "computer_collect_time_start_ticks"
# End of collection column names
$cpuInstanceProcessorUsageEndTicks = "instance_processor_usage_end_ticks"
$cpuInstanceCollectTimeEndTicks = "instance_collect_time_end_ticks"
$cpuComputerProcessorIdleEndTicks = "computer_processor_idle_end_ticks"
$cpuComputerCollectTimeEndTicks = "computer_collect_time_end_ticks"


$volumeStageTableName = "[msdb].[dbo].[sysutility_mi_volumes_stage_internal]"
$volumeStageDataTable = $null
$volumeDeviceIdColumnName = "volume_device_id"
$volumeNameColumnName = "volume_name"
$volumeCapacityColumnName = "capacity_mb"
$volumeFreeSpaceColumnName = "free_space_mb"

$smoStageTableName = "[msdb].[dbo].[sysutility_mi_smo_stage_internal]"
$smoStageDataTable = $null
$smoTypeColumnName = "object_type"
$smoUrnColumnName = "urn"
$smoPropertyNameColumnName = "property_name"
$smoPropertyValueColumnName = "property_value"

###############################################################################
# Functions that help with handling output to SQL Agent
#
# Sql Agent PS provider does not write output to the log from
# the warnings, errors, and verbose Write cmdlets.  The following
# functions wrap these cmdlets for execution as an agent job step.
###############################################################################

# This function is a helper function throws an exception if the passed in object 
# is null or empty.  The intent is to mimic the PowerShell version 2.0 parameter 
# validation function with the same name. The paramter validation is available 
# in 2.0 or higher, but this script can run in 1.0 or 2.0 runtime environment.
function ValidateNotNullOrEmpty($object)
{
    if(($object -eq $null) -or ($object -eq ""))
    {
        throw "The argument is null or empty."
    }
}

# This function helps control control flow for the agent step context
# When running within agent, there are different semantics for writing
# errors, warnings, and messages.  In addition, when running inside an
# agent step, the script will automatically collect and stage data.
# However, if the script is loaded in a PS environment outside of 
# agent, the script will not automatically start to collect and stage data
#
# Returns True if the script is run inside an agent step
#         False if the script is run outside an agent step 
function Get-IsAgentStep
{
   $global:isNotConsole
}

function Write-AgentLog([String] $prefix, [String] $printString, [String] $preference)
{
   if((Get-IsAgentStep) -and ($preference -ne "SilentlyContinue"))
   {
      [Console]::Error.WriteLine($prefix + $printString)
   }
}

function Get-PrintString ($object)
{
   ValidateNotNullOrEmpty $object
   
   $date = Get-Date -DisplayHint Time
   $printString = $date.ToString() + " : " +  $object.ToString()
   $printString
}

function Write-ScriptVerbose ($object)
{
   $printString = Get-PrintString $object
   
   Write-AgentLog "VERBOSE : " $printString $VerbosePreference 
   Write-Verbose $printString
}


function Write-ScriptWarning ($object)
{
   $printString = Get-PrintString $object
   
   Write-AgentLog "WARNING : " $printString $WarningPreference 
   Write-Warning $printString
}

function Write-ScriptError ($object)
{
   $printString = Get-PrintString $object
   
   Write-AgentLog "ERROR : " $printString $ErrorActionPreference 
   Write-Error $printString   
}

function Resolve-Error ($ErrorRecord=$Error[0])
{
   $errorString = $ErrorRecord | Format-List * -Force  | Out-String
   Write-ScriptWarning $errorString
   $errorString = $ErrorRecord.InvocationInfo | Format-List * | Out-String
   Write-ScriptWarning $errorString
   $Exception = $ErrorRecord.Exception
   
   # Print the entire stack of exceptions
   for ($i = 0; $Exception; $i++, ($Exception = $Exception.InnerException))
   {   Write-ScriptWarning ("$i" * 80)
       $errorString = $Exception | Format-List * -Force  | Out-String
      Write-ScriptWarning $errorString
   }
}


###############################################################################
# Connection Functions help to send queries to and manage the connection 
# to the server .
###############################################################################
function Get-Connection
{
   if($global:serverName.Contains(''ESCAPE_SQUOTE(SRVR)''))
   {
      throw "The global variable serverName has not been set."
   }
   if($global:connection -eq $null)
   {
      Write-ScriptVerbose "Opening connection to $global:serverName"
      $connString="Application Name=SQL Server Utility Managed Instance;Server=$global:serverName;Database=msdb;Trusted_Connection=True;"
      
      $global:connection = New-Object System.Data.SqlClient.SqlConnection
      $global:connection.ConnectionString = $connString
      [Void]$global:connection.Open()
      Write-ScriptVerbose "Opened connection with connection string:`n $connString"
   }
   $global:connection
}

function Remove-Connection
{
   if($global:connection -ne $null)
   {
      $dataSource=$global:connection.DataSource
      Write-ScriptVerbose "Closing and disposing connection to $dataSource"
      [Void]$global:connection.Close()
      [Void]$global:connection.Dispose()
      Write-ScriptVerbose "Connection is closed and disposed"
   }
   $global:connection = $null
}

function Invoke-BeginTransaction([string] $tranName)
{
   Write-ScriptVerbose "Opening transaction"
   $sqlConnection = Get-Connection
   $global:transaction = $sqlConnection.BeginTransaction($tranName)
}

function Invoke-CommitTransaction
{
   if($global:transaction -ne $null)
   {
      Write-ScriptVerbose "Committing transaction"
      $global:transaction.Commit()
      $global:transaction.Dispose()
      $global:transaction = $null
   }
}

function Invoke-RollbackTransaction
{
   if($global:transaction -ne $null)
   {
      Write-ScriptVerbose "Rolling back transaction"
      $global:transaction.Rollback() 
      $global:transaction.Dispose()
      $global:transaction = $null
   }
}

function Invoke-SubmitSqlCommandNonQuery([string] $query)
{
   ValidateNotNullOrEmpty $query
      
   Write-ScriptVerbose "Submitting as NonQuery : $query"
   $TsqlCommand = New-Object System.Data.SqlClient.SqlCommand;
   $TsqlCommand.CommandText = $query
   $TsqlCommand.CommandType = "Text";
   $TsqlCommand.Transaction = $global:transaction
   
   $TsqlCommand.Connection = Get-Connection
   $TsqlCommand.CommandTimeout = 0
   [Void] $TsqlCommand.ExecuteNonQuery()
}

function Get-SqlDataTable([string] $query)
{
   ValidateNotNullOrEmpty $query
   
   Write-ScriptVerbose "Requesting data table for : $query"
   $sqlConnection = Get-Connection
    $dataAdapter = New-Object System.Data.SqlClient.SqlDataAdapter($query, $sqlConnection)
    $dataTable = New-Object System.Data.DataTable
    $rowsFilled = $dataAdapter.Fill($dataTable)
   Write-ScriptVerbose "Query added $rowsFilled rows to the data table"
    # return the data table.  We need to wrap the variable because PS will
   # return data rows otherwise.
   return @(,($dataTable))
} 

function Invoke-BulkCopyCommand([System.Data.DataTable] $dataTableData)
{
   ValidateNotNullOrEmpty $dataTableData
   
   $opt = [System.Data.SqlClient.SqlBulkCopyOptions] 

   # Obtain a TableLock
   # But do not (use) Default (options), KeepIdentity, CheckConstraints, KeepNulls
   #  FireTriggers,  UseInternalTransaction
   $bulkOptions = $opt::none -bxor ("TableLock" -as $opt) 

   $tabName=$dataTableData.TableName
   Write-ScriptVerbose "Bulk copying data table : $tabName"
   $sqlConnection = Get-Connection
   $bulkCopy = new-object Data.SqlClient.SqlBulkCopy $sqlConnection, $bulkOptions,  $global:transaction
   $bulkCopy.DestinationTableName = $dataTableData.TableName
   
   #Map the columns so that the computed columns are skipped in the upload
   foreach($col in $dataTableData.Columns)
   {
      [Void] $bulkCopy.ColumnMappings.Add($col.ColumnName, 
                                 $col.ColumnName)
   }
   [Void] $bulkCopy.WriteToServer($dataTableData)
   
}

###############################################################################
# Short Helper Functions 
###############################################################################

function Get-DefaultIfNull($object, $default)
{
    if($object -eq $null) 
    {
        $default
    } 
    else
    {
        $object
    }
}

function Get-StringDefaultIfNull([String] $object)
{
    Get-DefaultIfNull $object ""
}

function Get-NumericDefaultIfNull($object)
{
    Get-DefaultIfNull $object 0
}

function Get-ProcessId
{
   $result = Get-SqlDataTable "SELECT SERVERPROPERTY(''ProcessID'') AS ProcessId"  | %{ $_.Rows }
   $result.ProcessId
}

function Get-IsWmiVolumeQueryAvailable
{
   if($global:isVistaOrXPSp2OrHigher -eq $null)
   {
      $osVersion = [System.Environment]::OsVersion.Version
      $global:isVistaOrXPSp2OrHigher = ($osVersion.Major -ge 6 -or ($osVersion.Major -ge 5 -and $osVersion.Minor -ge 2))
   }
   Write-ScriptVerbose "This computer is Vista or XP Sp2 or higher value is $global:isVistaOrXPSp2OrHigher"
   $global:isVistaOrXPSp2OrHigher
}

# Trims the volume name to <drive_letter>: format. 
# Reason: Data collection using WMI on different OS returns diffrent volume formats
# E.g. Win32_LogicalDisk on WIN2K3 returns c: and Win32_Volume on WIN2K8 returns c:
function Get-FormattedVolumeName([String] $volumeName)
{
   [String] $volumeName = Get-StringDefaultIfNull $volumeName
   
   Write-ScriptVerbose "Formatting volume name $volumeName"
   if($volumeName.EndsWith("\"))
   {
      $volumeName = $volumeName.SubString(0,$volumeName.Length - 1)
   }
   
   Write-ScriptVerbose "Formatted volume name to $volumeName"
   $volumeName
}

function Get-MountPointDictionary()
{
	if($global:directoryNameToDeviceId -eq $null)
	{
		$global:directoryNameToDeviceId=@{}
		(Get-Wmiobject Win32_MountPoint) | 
		%{ $directory=$_.Directory.Replace("Win32_Directory.Name=", "").Replace("`"", "").Replace("\\", "\")
		   $deviceId=$_.Volume.Replace("Win32_Volume.DeviceID=`"", "").Replace("`"", "").Replace("\\", "\")
		   $global:directoryNameToDeviceId[$directory]=$deviceId
		}
	}
	return $global:directoryNameToDeviceId
}

# The following function returns a directory name that maps to a volume device
# based on longest match.  It is not exact because a file can have a long
# convoluted path that pass through many mount point references
# However, it will find the most common use case for mount points
function Get-MountPointName([String] $fileName)
{
    [String] $fileName = Get-StringDefaultIfNull $fileName

    $longestMatch = ""
    $dict = Get-MountPointDictionary
    foreach($directory in $dict.Keys)
    {
        if($fileName.StartsWith($directory, [System.StringComparison]::OrdinalIgnoreCase))
        {
            if($directory.Length -gt $longestMatch.Length)
            {
                $longestMatch = $directory
            }
        }
    }
    return $longestMatch
}


function Get-DeviceIdFromMountPointName([String] $mountPointDirectory)
{
    [String] $mountPointDirectory = Get-StringDefaultIfNull $mountPointDirectory

    $dict = Get-MountPointDictionary
    
    $dict[$mountPointDirectory]
} 

function Get-MegabytesFromBytes ([Uint64] $bytes)
{
   [Uint64] $bytes = Get-NumericDefaultIfNull $bytes
      
   Write-ScriptVerbose "Converting $bytes bytes to megabytes"
   $oneMB = 1048576
   [UInt64] ($bytes / $oneMB)  # No fractional MBs
}

function Get-ShouldCollectCpu
{   
   if( ($global:cpuStageDataTable -eq $null) -or ($global:cpuStageDataTable.Rows.Count -eq 0))
   {
      Write-ScriptVerbose "The cpu staging table is null or empty.  Get-ShouldCollectCpu returning true"
      # return True and exit early
      return $true
   }
   else
   {
      $dataRow = $global:cpuStageDataTable.Rows[0]
      
      # return the value of the disjunction
      $dataRow[$cpuInstanceProcessorUsageStartTicks] -eq 0 -or
         $dataRow[$cpuInstanceCollectTimeStartTicks] -eq 0 -or
         $dataRow[$cpuComputerProcessorIdleStartTicks] -eq 0 -or
         $dataRow[$cpuComputerCollectTimeStartTicks] -eq 0
   }
}

###############################################################################
# Staging Functions that construct DataTables based on the different types of 
# data collection
###############################################################################
function Add-StageCpuRow
{
   param ([Int32] $numProcessors, [String] $cpuName, [String] $cpuCaption, [UInt16] $cpuFamily, 
      [UInt16] $architecture, [UInt32] $cpuMaxClockSpeed, [UInt32] $clockSpeed, 
      [UInt32] $l2CacheSize, [UInt32] $l3CacheSize, 
      [UInt64] $instanceProcessorUsage, [Int64] $instanceCollectTime, 
      [UInt64] $computerIdleTime, [UInt64] $computerCollectTime)

   begin
   {
      # This function update the Cpu table in-place by
      # first querying the server for the previous collection
      # information
      if($global:cpuStageDataTable -eq $null)
      {
         $query = "SELECT  
                  $cpuNumProcessorsColumnName,
                  $cpuNameColumnName,
                  $cpuCaptionColumnName,
                  $cpuFamilyIdColumnName,
                  $cpuArchitectureIdColumnName,
                  $cpuMaxClockSpeedColumnName,
                  $cpuClockSpeedColumnName,
                  $cpuL2CacheSizeColumnName,
                  $cpuL3CacheSizeColumnName,
                  $cpuInstanceProcessorUsageStartTicks,
                  $cpuInstanceCollectTimeStartTicks,
                  $cpuComputerProcessorIdleStartTicks,
                  $cpuComputerCollectTimeStartTicks,
                  $cpuInstanceProcessorUsageEndTicks,
                  $cpuInstanceCollectTimeEndTicks,
                  $cpuComputerProcessorIdleEndTicks,
                  $cpuComputerCollectTimeEndTicks
               FROM $global:cpuStageTableName"
         $global:cpuStageDataTable = Get-SqlDataTable $query
                  
         # If the data table is null, then there is no
         # data on the server and the table needs to be initialized
         if($global:cpuStageDataTable -eq $null)
         {
            Write-ScriptVerbose "Database returned no rows for cpu table. Creating table definition"
            $global:cpuStageDataTable = New-Object System.Data.DataTable ($global:cpuStageTableName)
            
            ($cpuNumProcessorsColumnName, [UInt16]), 
            ($cpuNameColumnName,[string]), 
            ($cpuCaptionColumnName,[string]), 
            ($cpuFamilyIdColumnName, [UInt16]), 
            ($cpuArchitectureIdColumnName, [UInt16]), 
            ($cpuMaxClockSpeedColumnName, [UInt32]), 
            ($cpuClockSpeedColumnName, [UInt32]), 
            ($cpuL2CacheSizeColumnName, [UInt32]), 
            ($cpuL3CacheSizeColumnName, [UInt32]), 
            ($cpuInstanceProcessorUsageStartTicks, [UInt64]), 
            ($cpuInstanceCollectTimeStartTicks, [Int64]), 
            ($cpuComputerProcessorIdleStartTicks, [UInt64]), 
            ($cpuComputerCollectTimeStartTicks, [UInt64]), 
            ($cpuInstanceProcessorUsageEndTicks, [UInt64]), 
            ($cpuInstanceCollectTimeEndTicks, [Int64]),
            ($cpuComputerProcessorIdleEndTicks, [UInt64]), 
            ($cpuComputerCollectTimeEndTicks, [UInt64]) | 
            foreach { ,
               $column =  new-object Data.DataColumn ($_)
               $global:cpuStageDataTable.Columns.Add($column) 
            }
         }
         $global:cpuStageDataTable.TableName = $global:cpuStageTableName
      }
      
      
      # If there is one row in the table, it is the data that the query returned
      # update the start values to be the old end values
      if ($global:cpuStageDataTable.Rows.Count -eq 1)
      {
         Write-ScriptVerbose "Stage table contains one row. Swapping end to start values."
         $dataRow = [System.Data.DataRow] $global:cpuStageDataTable.Rows[0]
   
         # The previous end values become the start values
         $dataRow[$cpuInstanceProcessorUsageStartTicks] = $dataRow[$cpuInstanceProcessorUsageEndTicks]
         $dataRow[$cpuInstanceCollectTimeStartTicks] = $dataRow[$cpuInstanceCollectTimeEndTicks]
         $dataRow[$cpuComputerProcessorIdleStartTicks] = $dataRow[$cpuComputerProcessorIdleEndTicks]
         $dataRow[$cpuComputerCollectTimeStartTicks] = $dataRow[$cpuComputerCollectTimeEndTicks]
      } 
      else
      {
         # There were no rows in the table or too many rows
         # Either way, the data needs to be cleared and updated
         # with the new information
         $rowCount = $global:cpuStageDataTable.Rows.Count
         Write-ScriptVerbose "Number of rows in data table is $rowCount"   
         
         Write-ScriptVerbose "Clearing stage table and marking start values with 0"
         [Void] $global:cpuStageDataTable.Clear()
         $dataRow = [System.Data.DataRow] $global:cpuStageDataTable.NewRow()
         $global:cpuStageDataTable.Rows.Add($dataRow)
         
         # There are no start values
         $dataRow[$cpuInstanceProcessorUsageStartTicks] = 0
         $dataRow[$cpuInstanceCollectTimeStartTicks] = 0
         $dataRow[$cpuComputerProcessorIdleStartTicks] = 0
         $dataRow[$cpuComputerCollectTimeStartTicks] = 0
      }
   }
   
   process
   {
      # Powershell 2.0 does not default typed parameters that are $null
      # So, the function has to set the defaults for the null parameters
      [Int32] $numProcessors = Get-NumericDefaultIfNull $numProcessors
      [String] $cpuName = Get-StringDefaultIfNull $cpuName
      [String] $cpuCaption = Get-StringDefaultIfNull $cpuCaption
      [UInt16] $cpuFamily = Get-NumericDefaultIfNull $cpuFamily
      [UInt16] $architecture = Get-NumericDefaultIfNull $architecture
      [UInt32] $cpuMaxClockSpeed = Get-NumericDefaultIfNull $cpuMaxClockSpeed
      [UInt32] $clockSpeed = Get-NumericDefaultIfNull $clockSpeed
      [UInt32] $l2CacheSize = Get-NumericDefaultIfNull $l2CacheSize
      [UInt32] $l3CacheSize = Get-NumericDefaultIfNull $l3CacheSize
      [UInt64] $instanceProcessorUsage = Get-NumericDefaultIfNull $instanceProcessorUsage
      [Int64] $instanceCollectTime = Get-NumericDefaultIfNull $instanceCollectTime
      [UInt64] $computerIdleTime = Get-NumericDefaultIfNull $computerIdleTime
      [UInt64] $computerCollectTime = Get-NumericDefaultIfNull $computerCollectTime
      
   
      # instanceCollectTime comes in as an signed int, make sure it is not neg
      if($instanceCollectTime -lt 0)
      {
         $instanceCollectTime = 0
      }
      
      # numProcessors comes in as an signed int, make sure it is not neg
      if($numProcessors -lt 0)
      {
         $numProcessors = 0
      }
   
      # Add the collected information
      Write-ScriptVerbose "Adding collected information to data table"
      $dataRow[$cpuNumProcessorsColumnName] = $numProcessors
      $dataRow[$cpuNameColumnName] = $cpuName
      $dataRow[$cpuCaptionColumnName] = $cpuCaption
      $dataRow[$cpuFamilyIdColumnName] = $cpuFamily
      $dataRow[$cpuArchitectureIdColumnName] = $architecture
      $dataRow[$cpuMaxClockSpeedColumnName] = $cpuMaxClockSpeed
      $dataRow[$cpuClockSpeedColumnName] = $clockSpeed
      $dataRow[$cpuL2CacheSizeColumnName] = $l2CacheSize
      $dataRow[$cpuL3CacheSizeColumnName] = $l3CacheSize
      $dataRow[$cpuInstanceProcessorUsageEndTicks] = $instanceProcessorUsage
      $dataRow[$cpuInstanceCollectTimeEndTicks] = $instanceCollectTime
      $dataRow[$cpuComputerProcessorIdleEndTicks] = $computerIdleTime
      $dataRow[$cpuComputerCollectTimeEndTicks] = $computerCollectTime
   }
}



function Add-StageVolumeRow
{ 
   param ([String]$deviceId,
         [String] $volumeNameRaw, 
         [UInt64] $capacityBytes, 
         [UInt64] $freeSpaceBytes)
   begin
   {
      # Initialize the stage table
      if($global:volumeStageDataTable -eq $null)
      {   
         Write-ScriptVerbose "Volume data table is null, creating table definition."
         $global:volumeStageDataTable = New-Object System.Data.DataTable ($global:volumeStageTableName)
            
         ($global:volumeDeviceIdColumnName, [String]), 
         ($global:volumeNameColumnName, [String]), 
         ($global:volumeCapacityColumnName, [UInt64]), 
         ($global:volumeFreeSpaceColumnName, [UInt64])| 
         foreach { ,
            $column =  new-object Data.DataColumn ($_)
            $global:volumeStageDataTable.Columns.Add($column) 
         }
      }
   }
   process
   {
      [String] $deviceId = Get-StringDefaultIfNull $deviceId
      [String] $formattedName = Get-FormattedVolumeName $volumeNameRaw
      [UInt64] $freeSpaceMB = Get-MegabytesFromBytes $freeSpaceBytes
      [UInt64] $capacityMB = Get-MegabytesFromBytes $capacityBytes
      
      if ( ($formattedName -eq "") -or ($deviceId -eq ""))
      {
         Write-ScriptWarning "DeviceId is empty string, or volume name formatting results in empty string.  Skipping this row."
         Write-ScriptWarning "Device Id = $deviceId. Volume name raw = $volumeNameRaw."
         return # return early
      }

      Write-ScriptVerbose "Adding collected information to data table"
      $dataRow = [System.Data.DataRow] $global:volumeStageDataTable.NewRow()
      $dataRow[$global:volumeNameColumnName] = $formattedName
      $dataRow[$global:volumeFreeSpaceColumnName] = $freeSpaceMB
      $dataRow[$global:volumeCapacityColumnName] = $capacityMB
      $dataRow[$global:volumeDeviceIdColumnName] = $deviceId
      Write-ScriptVerbose "Adding row to table"
      
      [Void] $global:volumeStageDataTable.Rows.Add($dataRow)
   }
}


function Add-StageSmoRow
{
   param ([Int32] $type, [String] $objUrn, [String] $propertyName, [object] $value)
   begin
   {      
      # Initialize the stage table
      if($global:smoStageDataTable -eq $null)
      {   
         Write-ScriptVerbose "Smo data table is null, creating table definition."
         $global:smoStageDataTable = New-Object System.Data.DataTable ($global:smoStageTableName)
         
         ($global:smoTypeColumnName, [Int32]), 
         ($global:smoUrnColumnName, [String]), 
         ($global:smoPropertyNameColumnName, [String]), 
         ($global:smoPropertyValueColumnName, [Object]) | 
         foreach { ,
            $column =  new-object Data.DataColumn ($_)
            $global:smoStageDataTable.Columns.Add($column) 
         }   
      }
   }
   process
   {  
      # if the type, propertyName, or Urn is null, something is wrong, throw an exception
      ValidateNotNullOrEmpty $type          
      ValidateNotNUllOrEmpty $propertyName
      ValidateNotNUllOrEmpty $objUrn
      
      # value can be null sometimes, which is fine.  Just throw the row out.
      if ( $value -eq $null )
      {
         Write-ScriptWarning "The value for property $propertyName is null. This property will not be added."
         Write-ScriptWarning "(objUrn = $objUrn)) (type = $type)) (propertyName = $propertyName)) (value = $value))"
         return # return early
      }
      
      Write-ScriptVerbose "Adding collected information for $propertyName to data table"
      $dataRow = [System.Data.DataRow] $global:smoStageDataTable.NewRow()
      $dataRow[$global:smoTypeColumnName] = $type
      $dataRow[$global:smoUrnColumnName] = $objUrn
      $dataRow[$global:smoPropertyNameColumnName] = $propertyName
      $dataRow[$global:smoPropertyValueColumnName] = $value
      
      $global:smoStageDataTable.Rows.Add($dataRow)
      
   }
}
   

###############################################################################
# Collection functions
###############################################################################
function Collect-CpuData
{

   &{ # PS Try
      # Get the Instance-level Performance Data.  An instance is identified 
      # by its process-id
      $processId = Get-ProcessId;
      
      Write-ScriptVerbose "Get WMI percent cpu time for process id = $processId"
      # Get the total processor time from the wmi object
      # PercentProcessorTime is bad property name, it is actually counting the 
      # total number of ticks (100NS based)
      # the instance has spent on processors.
      (Get-WmiObject Win32_PerfRawData_PerfProc_Process -filter "IDProcess = ''$processId''") | 
      %{ $instanceProcessorUsage = $_.PercentProcessorTime };
      
      Write-ScriptVerbose "Get current time for collection time"
      # Find the current number of ticks
      $instanceCollectTime = [DateTime]::UtcNow.Ticks
      
      Write-ScriptVerbose "Get WMI machine cpu time and time stamp"
      # Get the Machine-level Performance Data
      (Get-WmiObject Win32_PerfRawData_PerfOS_Processor -filter "Name = ''_Total''") |
      %{ $computerIdleTime = $_.PercentProcessorTime; 
      $computerCollectTime = $_.TimeStamp_Sys100NS };
      
      Write-ScriptVerbose "Get WMI cpu details"
      # Get the processor details
      (Get-WmiObject Win32_Processor) | 
      %{$cpuName = $_.Name;
      $cpuCaption = $_.Caption;
      $cpuFamily = $_.Family; 
      $architecture = $_.Architecture; 
      $cpuMaxClockSpeed = $_.MaxClockSpeed;
      $clockSpeed = $_.CurrentClockSpeed; 
      $l2CacheSize = $_.L2CacheSize; 
      $l3CacheSize = $_.L3CacheSize };
      
      [Int32] $numProcessors = [System.Environment]::ProcessorCount
      
      Write-ScriptVerbose "Add row to cpu information"
      Add-StageCpuRow   $numProcessors $cpuName $cpuCaption $cpuFamily $architecture $cpuMaxClockSpeed $clockSpeed $l2CacheSize $l3CacheSize $instanceProcessorUsage $instanceCollectTime $computerIdleTime $computerCollectTime
      
      $global:cpuStageDataTable
   }
   # PS Catch
   trap [Exception]
   {
      Resolve-Error
      Write-ScriptError "Caught exception while collecting cpu properties.  A WMI query might have failed."
   }   
   
}

function Collect-VolumeData
{
   &{ # PS Try
      if( Get-IsWmiVolumeQueryAvailable )
      {
         # A null DriveLetter indicates that the volume is a mount point
         # Casting DriveLetter to [Boolean] results in False if it is null 
         Write-ScriptVerbose "Collecting volume information using Win32_Volume"
         (Get-Wmiobject Win32_Volume -filter "DriveType = 3") | 
         %{ Add-StageVolumeRow $_.DeviceId $_.Name $_.Capacity $_.FreeSpace }
      }
      else
      {
         # logical disk only collects disk information, not mount point information
         # hence passing in false as is_mount_point parameter
         Write-ScriptVerbose "Collecting volume information using Win32_LogicalDisk"
         (Get-Wmiobject Win32_LogicalDisk -filter "DriveType = 3") | 
         %{ Add-StageVolumeRow $_.DeviceId $_.Name $_.Size $_.FreeSpace }
      }
      
      $global:volumeStageDataTable
   }
   # PS Catch
   trap [Exception]
   {
      Resolve-Error
      Write-ScriptError "Caught exception while collecting volume properties.  A WMI query might have failed."
   }   
}

function Collect-SmoData
{
   
   &{ # PS try
      $sqlConnection = Get-Connection
      $serverConnection = New-Object Microsoft.SqlServer.Management.Common.ServerConnection $sqlConnection
      $server = New-Object Microsoft.SqlServer.Management.Smo.Server($serverConnection);
      
      # remove configurations from this table
      $objectsQuery = "SELECT object_type, sfc_query 
               FROM [msdb].[dbo].[sysutility_mi_smo_objects_to_collect_internal] AS sfc_queries";
      
      $sfcQueries = Get-SqlDataTable $objectsQuery | %{ $_.Rows }
      
      foreach ($sfcQueryRow in $sfcQueries)
      {
         [Int32] $object_type = $sfcQueryRow.object_type;
         $sfcQueryString = $sfcQueryRow.sfc_query.ToString();
   
         Write-ScriptVerbose "Retrieving list of properties to collect"
         $propertiesQuery = "SELECT property_name 
                        FROM [msdb].[dbo].[sysutility_mi_smo_properties_to_collect_internal] 
                        WHERE object_type ="+ $object_type.ToString();
         $properties = Get-SqlDataTable $propertiesQuery | %{ $_.Rows } | foreach { $_.property_name };
         
         Write-ScriptVerbose "Collecting smo information for sfc query $sfcQueryString"
         $oq = New-Object Microsoft.SqlServer.Management.Sdk.Sfc.SfcObjectQuery($server);
         $exp = New-Object Microsoft.SqlServer.Management.Sdk.Sfc.SfcQueryExpression($sfcQueryString);
         
         &{ # PS try
         
            # The following call is not itempotent.  The code does not run the same
            # in debug mode. If you are running in debug mode, any value display
            # invalidates the foreach statement.
            $en = $oq.ExecuteIterator($exp, $null, $null);   
            
            foreach($obj in $en)
            {
               $objUrn = $obj.Urn.ToString();
               Write-ScriptVerbose "Collecting smo information for urn $objUrn"
               
               # For each property get the value and insert it into the smo stage data table
               # the statment $obj.$_ retrieves the propety value from the object
               # going through the PS provider.  If the property is not found or throws an
               # exception from the SMO side, the PS provider wraps the property and returns
               # an empty value.
               $properties | 
               %{ 
                  if ($_ -eq "ProcessorUsage")
                  {
                      # for ProcessorUsage, we are in fact collecting the
                      # the data by ourselves in our own staging table.
                      # and we do not want to call SMO as this property
                      # may not exist on downlevel server.
                      # so here, we put a dummy value and later during upload
                      # we replace it with our real value.
                      # Note that we a similar situation for VolumeFreeSpace
                      # but the solution is different. For VolumeFreeSpace property
                      # it is not put in the sysutility_mi_smo_properties_to_collect_internal
                      # and we collect through other means and then do a join on the UCP
                      # side, versus for ProcessorUsage, we put the property in the list
                      # and during MI collection, we replace it with our own value.
                      # The difference is inconsistent and we should change them to behave
                      # the same in future releases.
                      Add-StageSmoRow $object_type $objUrn $_ [object]0
                  }
                  else
                  {
                      Add-StageSmoRow $object_type $objUrn $_ $obj.$_ 
                  }
                  
                  # if this property is FileName, we append volume/mount point info.
                  if($_ -eq "FileName")
                  {
                     Write-ScriptVerbose "Property is FileName, getting volume information"
                     [String] $mountPointName = Get-MountPointName $obj.FileName
                     Add-StageSmoRow $object_type $objUrn "mount_point_name" $mountPointName 
                     
                     [String] $deviceId = Get-DeviceIdFromMountPointName $mountPointName
                     Add-StageSmoRow $object_type $objUrn "volume_device_id" $deviceId
                  }
               }
               
               $psPath = Convert-UrnToPath $objUrn
               ("powershell_path", $psPath),
               ("parent_name", $obj.Parent.Name),              # If no Parent exists, Ps will return null
               ("grandparent_name", $obj.Parent.Parent.Name) | # If no Parent.Parent exists, Ps will return null
                  %{ ,
                     $propertyName = $_[0]                     
                     [String] $value = $_[1]    # Cast to string results in $null values becoming ""
                     if($value -ne "")
                     {
                        Add-StageSmoRow $object_type $objUrn $propertyName $value
                     }
                  }  
            }
         } # PS catch exception
         trap [Exception]
         {
            Resolve-Error
            Write-ScriptError "Caught exception while collecting smo properties."
         }   
      }
      $global:smoStageDataTable
   } # PS catch exception
   trap [Exception]
   {
      Resolve-Error
          Write-ScriptError "Caught exception while collecting smo properties."
   }   
}

###############################################################################
# Functions that mange the server tables by clearing and loading collected data 
###############################################################################
function Clear-AllStagedData
{
   # TRUNCATE TABLE removes all rows from a table without logging the 
   # individual row deletes.

   $cpuClearQuery = "TRUNCATE TABLE $global:cpuStageTableName; "
   $volumeClearQuery = "TRUNCATE TABLE $global:volumeStageTableName; "
   $smoClearQuery = "TRUNCATE TABLE $global:smoStageTableName; "
   
   Invoke-SubmitSqlCommandNonQuery "$cpuClearQuery $volumeClearQuery $smoClearQuery"
}

function Collect-AllStagedData
{

   Collect-CpuData | Out-Null
      
   # Should we collect cpu data again?
   # This will happen if the script is
   # run when there is no data yet in
   # the cpu staging table.
   if(Get-ShouldCollectCpu)
   {
      #Wait for some time to pass
      Write-ScriptVerbose "Waiting $sleepTimeoutSeconds seconds to collect cpu data."
      Start-Sleep -Seconds $sleepTimeoutSeconds
      #Collect the data again
      Collect-CpuData | Out-Null
   }
   
   Collect-SmoData | Out-Null
   Collect-VolumeData | Out-Null
}

function Save-AllStagedData
{
   Invoke-BulkCopyCommand $global:cpuStageDataTable
   Invoke-BulkCopyCommand $global:volumeStageDataTable
   Invoke-BulkCopyCommand $global:smoStageDataTable
}

function Invoke-StageData
{

   &{ # Try 
      
      Collect-AllStagedData
      
      Invoke-BeginTransaction
      
      Clear-AllStagedData
      Save-AllStagedData
      
      Invoke-CommitTransaction
      Remove-Connection
   }
   trap [Exception] # Catch
   {
      Write-ScriptWarning "Error occurred during execution of script."
      Write-ScriptWarning "Transaction will be rolled back."
      
      Resolve-Error
      
      Invoke-RollbackTransaction
      Remove-Connection
      
      # With ErrorActionPreference=Stop the following line will stop the script
      Write-ScriptError "Error.  Transaction was rolled back"
   }
}

if(Get-IsAgentStep)
{
   Invoke-StageData
}', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Upload to Utility Control Point]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Upload to Utility Control Point', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC [msdb].[dbo].[sp_sysutility_mi_upload]', 
		@database_name=N'msdb', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'sysutility_mi_collect_and_upload', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=15, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140918, 
		@active_end_date=99991231, 
		@active_start_time=500, 
		@active_end_time=400, 
		@schedule_uid=N'e2ca4fdd-33f4-4ba8-8c9a-da466ce1eb25'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Utility - Managed Instance]    Script Date: 11/20/2014 2:09:20 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Utility - Managed Instance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Utility - Managed Instance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'sysutility_mi_collect_performance', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Collect performance information', 
		@category_name=N'Utility - Managed Instance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Collect DAC execution statistics]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Collect DAC execution statistics', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC [msdb].[dbo].[sp_sysutility_mi_collect_dac_execution_statistics_internal]', 
		@database_name=N'msdb', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'sysutility_mi_collect_performance', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=2, 
		@freq_subday_interval=15, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140918, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'2bc2c377-f0c8-4962-9488-2ff7bf4d1b8f'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
EXEC msdb.dbo.sp_add_operator @name=N'DBA Group', 
		@enabled=1, 
		@weekday_pager_start_time=90000, 
		@weekday_pager_end_time=180000, 
		@saturday_pager_start_time=90000, 
		@saturday_pager_end_time=180000, 
		@sunday_pager_start_time=90000, 
		@sunday_pager_end_time=180000, 
		@pager_days=0, 
		@email_address=N'DL-KMHP_MSSQLDBAGroup@kmhp.com', 
		@category_name=N'[Uncategorized]'
GO
EXEC msdb.dbo.sp_add_operator @name=N'Jeff', 
		@enabled=1, 
		@weekday_pager_start_time=80000, 
		@weekday_pager_end_time=180000, 
		@saturday_pager_start_time=90000, 
		@saturday_pager_end_time=180000, 
		@sunday_pager_start_time=90000, 
		@sunday_pager_end_time=180000, 
		@pager_days=62, 
		@email_address=N'jshurak@amerihealthcaritas.com', 
		@category_name=N'[Uncategorized]'
GO
EXEC msdb.dbo.sp_add_proxy @proxy_name=N'CMS',@credential_name=N'CMS', 
		@enabled=1
GO
EXEC msdb.dbo.sp_grant_proxy_to_subsystem @proxy_name=N'CMS', @subsystem_id=3
GO
EXEC msdb.dbo.sp_add_proxy @proxy_name=N'UtilityAgentProxy_7A189120-ABCD-47D5-946B-C0E3B8A15C83',@credential_name=N'UtilityAgentProxyCredential_7A189120-ABCD-47D5-946B-C0E3B8A15C83', 
		@enabled=1
GO
EXEC msdb.dbo.sp_grant_proxy_to_subsystem @proxy_name=N'UtilityAgentProxy_7A189120-ABCD-47D5-946B-C0E3B8A15C83', @subsystem_id=3
GO
EXEC msdb.dbo.sp_grant_login_to_proxy @proxy_name=N'UtilityAgentProxy_7A189120-ABCD-47D5-946B-C0E3B8A15C83', @msdb_role=N'dc_admin'
GO
EXEC master.dbo.sp_addlinkedserver @server = N'RPT_REG_1', @srvproduct=N'Sybase', @provider=N'MSDASQL', @provstr=N'DSN=RPT_REG_1', @catalog=N'FACETS'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'RPT_REG_1',@useself=N'False',@locallogin=NULL,@rmtuser=N'mssqlproduser',@rmtpassword='########'

GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'collation compatible', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'rpc', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'rpc out', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'use remote collation', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO
EXEC master.dbo.sp_addlinkedserver @server = N'RPT_REG_2', @srvproduct=N'Sybase', @provider=N'MSDASQL', @provstr=N'DSN=RPT_REG_2', @catalog=N'FACETS'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'RPT_REG_2',@useself=N'False',@locallogin=NULL,@rmtuser=N'mssqlproduser',@rmtpassword='########'

GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'collation compatible', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'rpc', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'rpc out', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'use remote collation', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO
EXEC master.dbo.sp_addlinkedserver @server = N'RPT_REG_3', @srvproduct=N'Sybase', @provider=N'MSDASQL', @provstr=N'DSN=RPT_REG_3', @catalog=N'FACETS'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'RPT_REG_3',@useself=N'False',@locallogin=NULL,@rmtuser=N'mssqlproduser',@rmtpassword='########'

GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'collation compatible', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'rpc', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'rpc out', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'use remote collation', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO
EXEC master.dbo.sp_addlinkedserver @server = N'RPT_REG_4', @srvproduct=N'Sybase', @provider=N'MSDASQL', @provstr=N'DSN=RPT_REG_4', @catalog=N'FACETS'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'RPT_REG_4',@useself=N'False',@locallogin=NULL,@rmtuser=N'mssqlproduser',@rmtpassword='########'

GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'collation compatible', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'rpc', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'rpc out', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'use remote collation', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO
EXEC master.dbo.sp_addlinkedserver @server = N'RPT_REG_5', @srvproduct=N'Sybase', @provider=N'MSDASQL', @provstr=N'DSN=RPT_REG_5', @catalog=N'FACETS'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'RPT_REG_5',@useself=N'False',@locallogin=NULL,@rmtuser=N'mssqlproduser',@rmtpassword='########'

GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'collation compatible', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'rpc', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'rpc out', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'use remote collation', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO
EXEC master.dbo.sp_addlinkedserver @server = N'RPT_REG_6', @srvproduct=N'Sybase', @provider=N'MSDASQL', @provstr=N'DSN=RPT_REG_6', @catalog=N'FACETS'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'RPT_REG_6',@useself=N'False',@locallogin=NULL,@rmtuser=N'mssqlproduser',@rmtpassword='########'

GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'collation compatible', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'rpc', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'rpc out', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'use remote collation', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Error Number 823', 
		@message_id=823, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Error Number 824', 
		@message_id=824, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Error Number 825', 
		@message_id=825, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Log shipping Primary Server Alert.', 
		@message_id=14420, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=0, 
		@include_event_description_in=5, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Log shipping Secondary Server Alert.', 
		@message_id=14421, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=0, 
		@include_event_description_in=5, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 016', 
		@message_id=0, 
		@severity=16, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 017', 
		@message_id=0, 
		@severity=17, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 018', 
		@message_id=0, 
		@severity=18, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 019', 
		@message_id=0, 
		@severity=19, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 020', 
		@message_id=0, 
		@severity=20, 
		@enabled=0, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 021', 
		@message_id=0, 
		@severity=21, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 022', 
		@message_id=0, 
		@severity=22, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 023', 
		@message_id=0, 
		@severity=23, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 024', 
		@message_id=0, 
		@severity=24, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 025', 
		@message_id=0, 
		@severity=25, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:15 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Backup Configuration', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Backup Config]    Script Date: 11/20/2014 2:09:15 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Backup Config', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'set nocount on
go
select ''exec sp_CONFIGURE ''''show advanced options'''', 1'' + char(13) + char(10) + '' go'' + char(13) + char(10) + '' reconfigure'' 
go
select ''exec sp_configure '''''' + name + '''''', '' + cast(value_in_use as nvarchar(10))
	+ char(13) + char(10) + ''go'' 
	from sys.configurations
	where name<>''show advanced options''
go
select ''reconfigure''
', 
		@database_name=N'master', 
		@output_file_name=N'G:\Backup\Config.txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily 5am', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20111029, 
		@active_end_date=99991231, 
		@active_start_time=50000, 
		@active_end_time=235959, 
		@schedule_uid=N'cdfd706f-c436-4984-a8e7-37b695469264'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:15 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Backup Databases.Subplan_1', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Subplan_1]    Script Date: 11/20/2014 2:09:15 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Subplan_1', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/Server "$(ESCAPE_NONE(SRVR))" /SQL "Maintenance Plans\Backup Databases" /set "\Package\Subplan_1.Disable;false"', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily Backup', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140128, 
		@active_end_date=99991231, 
		@active_start_time=20000, 
		@active_end_time=235959, 
		@schedule_uid=N'6dc237ca-c47d-4f41-ab48-3e9a2f67d0bd'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:15 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Backup Logins', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Backup Logins]    Script Date: 11/20/2014 2:09:15 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Backup Logins', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec sp_help_revlogin', 
		@database_name=N'master', 
		@output_file_name=N'G:\Backup\Logins.txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily 5am', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20111029, 
		@active_end_date=99991231, 
		@active_start_time=50000, 
		@active_end_time=235959, 
		@schedule_uid=N'3983d526-4966-486e-ba0b-acfba345a339'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:15 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Backup Transaction Log.Subplan_1', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Subplan_1]    Script Date: 11/20/2014 2:09:15 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Subplan_1', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/Server "$(ESCAPE_NONE(SRVR))" /SQL "Maintenance Plans\Backup Transaction Log" /set "\Package\Subplan_1.Disable;false"', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:16 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Capture DB Statistics', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Collect Server Information]    Script Date: 11/20/2014 2:09:16 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Collect Server Information', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'Use Data_Collection
go
drop table SQL_Server_Info_Old
go
sp_rename ''SQL_Server_Info'',''SQL_Server_Info_Old''
go
create table #Drive (DriveLetter varchar(25))
insert into #Drive (DriveLetter) select distinct LEFT(physical_name,2) FROM sys.master_files as MF inner join sys.databases as DB on MF.database_id = DB.database_id
declare @tmp varchar(250)
SET @tmp = ''''
select @tmp = @tmp + DriveLetter + '', '' from #Drive
--select @tmp
create table #Drive2 (DriveLetter varchar(25))
insert into #Drive2 (DriveLetter) SELECT Distinct left(physical_device_name,2) FROM msdb.dbo.backupmediafamily
declare @tmp2 varchar(250)
SET @tmp2 = ''''
select @tmp2 = @tmp2 + DriveLetter + '', '' from #Drive2
--select @tmp2
SELECT 
''1 - Server'' as [Type],
SERVERPROPERTY(''ServerName'') as Instance,
SERVERPROPERTY(''ComputerNamePhysicalNetBIOS'') as [Host/DB Name],
SERVERPROPERTY(''Edition'') as [Edition/Compatibility Level], /*shows 32 bit or 64 bit*/
SERVERPROPERTY(''ProductLevel'') as [Product/Recover], /* RTM or SP1 etc*/
Case SERVERPROPERTY(''IsClustered'') when 1 then ''CLUSTERED'' else ''STANDALONE'' end as [Type/Max Size],
SERVERPROPERTY(''ComputerNamePhysicalNetBIOS'') as [Servers/Size],
(select cast(cpu_count as nvarchar(10))+'' core / ''+cast(cpu_count/hyperthread_ratio as nvarchar(10))+'' procs'' as MB from sys.dm_os_sys_info) as [CPU/Growth],
(select physical_memory_kb/1024 from sys.dm_os_sys_info) as MB,
(select SUBSTRING(@tmp, 0, LEN(@tmp)))+'', Backup ''+(select SUBSTRING(@tmp2, 0, LEN(@tmp2))) as Drives,
@@VERSION as [Version Info]
Into SQL_Server_Info
Drop table #Drive
Drop table #Drive2
--go
--select * from SQL_Server_Info
----union all 
----select * from SQL_Server_Info_Old
--go
----Drop Table SQL_Server_Changes
--Insert Into SQL_Server_Changes
--select getdate() as [Date], 
--cast(New.Instance as varchar(100)) as Instance, 
--cast(New.[CPU/Growth] as varchar(100)) as CPU, 
--cast(Old.[CPU/Growth] as varchar(100)) as [Old_CPU], 
--cast(New.MB as varchar(100)) as MB, 
--cast(Old.MB as varchar(100)) as Old_MB,
--cast(New.[Product/Recover] as varchar(100)) as Product, 
--cast(Old.[Product/Recover] as varchar(100)) as [Old_Product],
--cast(New.Drives as varchar(100)) as Drives, 
--cast(Old.Drives as varchar(100)) as Old_Drives
----Into SQL_Server_Changes
--from SQL_Server_Info as New inner join SQL_Server_Info_Old as Old on New.Instance = Old.Instance
--where (Old.[CPU/Growth] <> New.[CPU/Growth] 
--or Old.Drives <> New.Drives 
--or Old.[Product/Recover] <> New.[Product/Recover]
--or Old.MB <> New.MB) and New.Instance <> ''tempdb''
--go
----select * from SQL_Server_Changes', 
		@database_name=N'DATA_COLLECTION', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Collect DB Information]    Script Date: 11/20/2014 2:09:16 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Collect DB Information', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'Use Data_Collection
go
drop table SQL_DB_Info_Old
go
sp_rename ''SQL_DB_Info'',''SQL_DB_Info_Old''
go
SELECT 
''2 - Database'' as [Type],
SERVERPROPERTY(''ServerName'') as Instance,
db_name(MF.database_id) as Name,
compatibility_level,
recovery_model_desc,
cast((max_size)/128 as varchar(50)) as [Max_Size],
cast((size)/128 as varchar(50)) as [Size],
cast((growth)/128 as varchar(50)) as [Growth],
Case when physical_name like ''%.mdf'' or physical_name like ''%.ndf'' then ''DATA'' else ''LOG'' end As [File_Type],
LEFT(physical_name,2) as Drive, 
[FILE_ID],
Case when DB.is_read_only = 1 then ''Read Only'' else ''Read\Write'' end as DB_Status
--,physical_name
--,*
into SQL_DB_Info
FROM sys.master_files as MF inner join sys.databases as DB on MF.database_id = DB.database_id
go
select * from SQL_DB_Info
--union all 
--select * from SQL_DB_Info_Old
go
--Insert Into SQL_DB_Changes
select getdate() as [Date], 
cast(New.Instance as varchar(100)) as Instance,
cast(New.Name as varchar(100)) as Name, 
cast(New.Max_Size as varchar(100)) as Max_Size, 
cast(Old.Max_Size as varchar(100)) as Old_Max_Size, 
cast(New.Size as varchar(100)) as Size, 
cast(Old.Size as varchar(100)) as Old_Size,
New.[File_Type],
New.[File_ID]
--, *
--Into SQL_DB_Changes
from SQL_DB_Info as New full outer join SQL_DB_Info_Old as Old on New.Name = Old.Name and Old.[File_Type] = New.[File_Type] and New.[File_ID] = Old.[File_ID]
where (Old.Max_Size <> New.Max_Size or Old.Size <> New.Size) and 
New.Name <> ''tempdb''
and New.Name <> ''master''
and New.Name <> ''model''
and New.Name <> ''tempdb''
and New.Name <> ''msdb''
--and New.[File_Type] <> ''LOG''
go
--Insert Into SQL_DB_Changes
select getdate() as [Date], 
cast(New.Instance as varchar(100)) as Instance,
cast(New.Name as varchar(100)) as Name, 
cast(New.Max_Size as varchar(100)) as Max_Size, 
cast(0 as varchar(100)) as Old_Max_Size, 
cast(New.Size as varchar(100)) as Size, 
cast(0 as varchar(100)) as Old_Size,
New.[File_Type],
New.[File_ID]
from SQL_DB_Info as New full outer join SQL_DB_Info_Old as Old 
on New.Name = Old.Name and Old.[Type] = New.[Type] and New.[File_ID] = Old.[File_ID]
where New.Name <> ''tempdb''
and New.Name <> ''master''
and New.Name <> ''model''
and New.Name <> ''tempdb''
and New.Name <> ''msdb''
--and New.[File_Type] <> ''LOG''
and New.Name not in (select Name from SQL_DB_Changes)
go
--select * from SQL_DB_Changes
--delete from SQL_DB_Changes where [DATE] > ''2012-11-26 17:29:13.000''
--select * from SQL_DB_Changes order by name, date', 
		@database_name=N'DATA_COLLECTION', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Capture DB Statistics', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20121113, 
		@active_end_date=99991231, 
		@active_start_time=30000, 
		@active_end_time=235959, 
		@schedule_uid=N'50da2b81-ce8f-4c5b-9b6f-00724fa5533d'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:16 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Check Blocked Processes', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Check Blocked Processes]    Script Date: 11/20/2014 2:09:16 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Check Blocked Processes', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'USE DATA_COLLECTION 
go 

declare @data_count int 
declare @date_captured datetime
declare @duration_minutes int = 5
declare @default_days int = 30
DECLARE @email_body VarChar(2000)
DECLARE @profile_name varchar(2000) = N''MS SQL Mail''
DECLARE @recipients varchar(2000) = ''DL-KMHP_MSSQLDBAGroup@kmhp.com''
DECLARE @subject varchar(2000)
DECLARE @retention datetime

-- capture current date and time
set @date_captured = GETDATE()

-- insert data into table
INSERT INTO BLOCKED_PROCESSES
	( session_id,
      host_name,
      login_name,
      start_time,
      totalReads,
      totalWrites,
      totalCPU,
      writes_in_tempdb,
      sql_text,
      blocking_session_id,
      blocking_text,
      date_captured)
SELECT  x.session_id,
        x.host_name,
        x.login_name,
        x.start_time,
        x.totalReads,
        x.totalWrites,
        x.totalCPU,
        x.writes_in_tempdb,
    (
            -- Query gets XML text for the sql query for the session_id
            SELECT      text AS [text()]
            FROM  sys.dm_exec_sql_text(x.sql_handle)
            FOR XML PATH(''''), TYPE

    )AS sql_text,
     COALESCE(x.blocking_session_id, 0) AS blocking_session_id,
    (
        SELECT p.text
        FROM
        (
            -- Query gets the corresponding sql_handle info to find the XML text in the next query
            SELECT MIN(sql_handle) AS sql_handle
            FROM sys.dm_exec_requests r2
            WHERE r2.session_id = x.blocking_session_id
        ) AS r_blocking
        CROSS APPLY
        (
            -- Query will pull back the XML text for a blocking session if there is any from the sql_haldle
            SELECT text AS [text()]
            FROM sys.dm_exec_sql_text(r_blocking.sql_handle)
            FOR XML PATH(''''), TYPE
        ) p (text)
    ) AS blocking_text,
    @date_captured as date_captured
FROM
(
-- Query returns active session_id and metadata about the session for resource, blocking, and sql_handle
    SELECT  r.session_id,
            s.host_name,
            s.login_name,
            r.start_time,
            r.sql_handle,
            r.blocking_session_id,
            SUM(r.reads) AS totalReads,
            SUM(r.writes) AS totalWrites,
            SUM(r.cpu_time) AS totalCPU,
            SUM(tsu.user_objects_alloc_page_count + tsu.internal_objects_alloc_page_count) AS writes_in_tempdb
    FROM    sys.dm_exec_requests r
    JOIN    sys.dm_exec_sessions s ON s.session_id = r.session_id
    JOIN    sys.dm_db_task_space_usage tsu ON s.session_id = tsu.session_id and r.request_id = tsu.request_id
    WHERE   r.status IN (''running'', ''runnable'', ''suspended'')
      and r.blocking_session_id <> 0
    GROUP BY    r.session_id,
                s.host_name,
                s.login_name,
                r.start_time,
                r.sql_handle,
                r.blocking_session_id
) x

-- delete data where the duration
-- is less than 5 minutes or have
-- logged for 30 days or more

delete from BLOCKED_PROCESSES
where duration_minutes < @duration_minutes or 
	  DATEDIFF(D,start_time,duration_minutes) >= @default_days


set @retention = (GETDATE() - 30)
delete from DATA_COLLECTION..BLOCKED_PROCESSES where date_captured < @retention

select @data_count = COUNT(*)
from BLOCKED_PROCESSES
where date_captured=@date_captured

if @data_count > 0 
	begin
		set @subject = N''Blocked processes were found on '' + convert(nvarchar(20),@date_captured,100)

		set @email_body = N''Number of blocked processes found:  '' + CAST(@data_count as nvarchar(10)) + CHAR(13) + N''Duration time:  >=  '' + cast(@duration_minutes as nvarchar(5)) + 
					'' minute(s)'' + char(13) + char(13) + ''***Run the sp_CURRENT_BLOCKED_PROCESSES stored procedure to view the most recent blocked processes.''
				
		EXEC msdb.dbo.sp_send_dbmail
			@profile_name = @profile_name,
			@recipients = @recipients,
			@subject = @subject,
			@body = @email_body	
	end', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Every 10 mins', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=10, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20111029, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'6bcde8e0-e018-4487-8063-372ca14c4153'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:16 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Check DB Integrity.Subplan_1', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Subplan_1]    Script Date: 11/20/2014 2:09:16 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Subplan_1', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/Server "$(ESCAPE_NONE(SRVR))" /SQL "Maintenance Plans\Check DB Integrity" /set "\Package\Subplan_1.Disable;false"', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Check DB Integrity.Subplan_1', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20140128, 
		@active_end_date=99991231, 
		@active_start_time=180000, 
		@active_end_time=235959, 
		@schedule_uid=N'418ba5c4-f87a-4608-a5ce-33e8c6a5e89a'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:16 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Check DB Space', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Check DB Space]    Script Date: 11/20/2014 2:09:16 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Check DB Space', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'/*  Script to check the database space on all databases on the server except system databases.
  There is no input parameters
  Author - Derrick Williams
  Date - 6/9/2011
*/

--Checks to ensure that the temp table is not there, if so it deletes it.
IF ((SELECT OBJECT_ID(''tempdb..#DB_SPACE_CHECK'')) IS NOT NULL)
BEGIN
     DROP TABLE #DB_SPACE_CHECK
END

--Checks to ensure that the temp table is not there, if so it deletes it.
IF ((SELECT OBJECT_ID(''tempdb..#DB_SPACE_CHECK2'')) IS NOT NULL)
BEGIN
     DROP TABLE #DB_SPACE_CHECK2
END

IF ((SELECT OBJECT_ID(''tempdb..#TEST_SYSMAIL_PROFILES'')) IS NOT NULL)
	BEGIN
		DROP TABLE #TEST_SYSMAIL_PROFILES;
	END

--Builds the server names - database names - and free space and inserts into the temp table
select 
	@@servername as ServerName,
	DB_NAME(database_id) AS DatabaseName, 
	CAST([Name] AS varchar(20)) AS NameofFile,
	CAST(physical_name AS varchar(100)) AS PhysicalFile,
	type_desc AS FileType,
	((size * 8)/1024) AS FileSize,
	MaxFileSize = 
	CASE WHEN max_size = -1 OR max_size = 268435456 THEN ''UNLIMITED''
		WHEN max_size = 0 THEN ''NO_GROWTH'' 
		WHEN max_size <> -1 OR max_size <> 0 THEN CAST(((max_size * 8) / 1024) AS varchar(15))
		ELSE ''Unknown''
	END,
	SpaceRemainingMB = 
	CASE WHEN max_size = -1 OR max_size = 268435456 THEN ''UNLIMITED''
		WHEN max_size <> -1 OR max_size = 268435456 THEN CAST((((max_size - size) * 8) / 1024) AS varchar(10))
		ELSE ''Unknown''
	END,
	Growth = 
		CASE WHEN growth = 0 THEN ''FIXED_SIZE''
		WHEN growth > 0 THEN ((growth * 8)/1024)
		ELSE ''Unknown''
	END,
	GrowthType = 
		CASE WHEN is_percent_growth = 1 THEN ''PERCENTAGE''
		WHEN is_percent_growth = 0 THEN ''MBs''
		ELSE ''Unknown''
	END
into #DB_SPACE_CHECK FROM master.sys.master_files
WHERE state = 0 AND 
	  type_desc IN (''LOG'', ''ROWS'')
ORDER BY database_id, 
		 file_id

-- create temp table to store email profiles
CREATE TABLE #TEST_SYSMAIL_PROFILES
	(principal_id int,
	 principal_name varchar(200),
	 profile_id int,
	 profile_name varchar(200),
	 is_default bit)

-- insert email profiles into temp table
insert into #TEST_SYSMAIL_PROFILES
EXECUTE msdb.dbo.sysmail_help_principalprofile_sp;

-- Variable Declaration
DECLARE @unlimited_count int
DECLARE @server_name VarChar(2000)
DECLARE @database_name VarChar(2000)
DECLARE @space_remaining VarChar(2000)
DECLARE @file_type VarChar(2000)
DECLARE @email_body VarChar(2000)
DECLARE @profile_name varchar(2000) 
DECLARE @recipients varchar(2000) 
DECLARE @subject varchar(2000)

-- retrieve email profile
SELECT TOP 1 @profile_name = profile_name
FROM #TEST_SYSMAIL_PROFILES

-- count number of "UNLIMITED" databases
select @unlimited_count = COUNT(*) 
from #DB_SPACE_CHECK
where (MaxFileSize = ''UNLIMITED'' OR SpaceRemainingMB = ''UNLIMITED'') AND 
	  DatabaseName NOT IN (''master'',''model'',''msdb'',''ReportServer'',''ReportServerTempDB'') AND
	  DatabaseName NOT LIKE ''wslogdb70%''

-- set default variables for email
SET @recipients = ''DL-KMHP_MSSQLDBAGroup@kmhp.com''

IF @unlimited_count = 0 -- indicates there are no databases listed as ''UNLIMITED'' therefore process normally
	BEGIN		

		-- calculate the percent used from #DB_SPACE_CHECK temp table
		-- and store into #DB_SPACE_CHECK2 temp table
		select * , 
			   CAST(((CAST(MaxFileSize as decimal(18,4))-CAST(SpaceRemainingMB as decimal(18,4)))/CAST(MaxFileSize as decimal(18,4))) as decimal(18,4)) as PercentUsed
		into #DB_SPACE_CHECK2 
		from #DB_SPACE_CHECK
		where DatabaseName NOT IN (''master'',''model'',''msdb'',''ReportServer'',''ReportServerTempDB'') AND
			  DatabaseName NOT LIKE ''wslogdb70%''

		-- build cursor for #DB_SPACE_CHECK2 temp table
		DECLARE limited_db_cursor CURSOR FOR
			SELECT ServerName,
				   DatabaseName,
				   SpaceRemainingMB,
				   FileType 
			FROM #DB_SPACE_CHECK2 
			where DatabaseName not in (''master'',''model'',''msdb'',''ReportServer'',''ReportServerTempDB'') AND
				  ((FileType = N''ROWS'' AND PercentUsed >= 0.9700) OR 
				  (FileType = N''LOG'' AND PercentUsed >= 0.9000))
		
		OPEN limited_db_cursor
		FETCH NEXT FROM limited_db_cursor
		INTO @server_name, @database_name, @space_remaining, @file_type

		-- Check @@FETCH_STATUS to see if there are any more rows to fetch.
		WHILE @@FETCH_STATUS = 0
		BEGIN
			-- set the subject line to include the server name
			SET @subject = @server_name + '' Space Alert'' 

			-- define the body of the email
            select @email_body = ''Server Name:  '' + @server_name + CHAR(10) +
							     ''Database Name:  '' + @database_name + CHAR(10) +
							     ''Current MB Free:  '' + @space_remaining + CHAR(10) +
							     ''File Type:  '' + @file_type

			-- only send email if the file type is ROWS or LOG
            if (@file_type = ''ROWS'' OR @file_type = ''LOG'')          
			    EXEC msdb.dbo.sp_send_dbmail
                @profile_name = @profile_name,
                @recipients = @recipients,
                @subject = @subject,
                @body = @email_body
		    else
				print ''no criteria match''

            FETCH NEXT FROM limited_db_cursor
            INTO @server_name, @database_name, @space_remaining, @file_type
		END
		
		--close and deallocate the cursor
		close limited_db_cursor
		deallocate limited_db_cursor
	END

ELSE -- indicates some databases are listed as ''UNLIMITED'' so therefore alert DBAs to fix the issue
	BEGIN

		-- build cursor for #DB_SPACE_CHECK temp table
		DECLARE unlimited_db_cursor CURSOR FOR
			SELECT ServerName,
				   DatabaseName,
				   SpaceRemainingMB,
				   FileType 
			FROM #DB_SPACE_CHECK 
			where (MaxFileSize = ''UNLIMITED'' OR SpaceRemainingMB = ''UNLIMITED'') AND 
				  DatabaseName NOT IN (''master'',''model'',''msdb'',''ReportServer'',''ReportServerTempDB'') AND
				  DatabaseName NOT LIKE ''wslogdb70%''
		
		OPEN unlimited_db_cursor
		FETCH NEXT FROM unlimited_db_cursor
		INTO @server_name, @database_name, @space_remaining, @file_type

		-- Check @@FETCH_STATUS to see if there are any more rows to fetch.
		WHILE @@FETCH_STATUS = 0
		BEGIN
			
			-- set the subject line
			SET @subject = @database_name + '' on '' + @server_name + '' is listed as Unlimited''

			-- define the body of the email
            select @email_body = ''Server Name:  '' + @server_name + CHAR(10) +
							     ''Database Name:  '' + @database_name + CHAR(10) +
							     ''Current MB Free:  '' + @space_remaining + CHAR(10) +
							     ''File Type:  '' + @file_type

            if (@file_type = ''ROWS'' OR @file_type = ''LOG'')          
			    EXEC msdb.dbo.sp_send_dbmail
                @profile_name = @profile_name,
                @recipients = @recipients,
                @subject = @subject,
                @body = @email_body
		    else
				print ''no criteria match''

            FETCH NEXT FROM unlimited_db_cursor
            INTO @server_name, @database_name, @space_remaining, @file_type
		END
		
		--close and deallocate the cursor
		close unlimited_db_cursor
		deallocate unlimited_db_cursor
	END
go
', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Every 15 Minutes', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=15, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140212, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'6e72d0bd-71eb-4b19-bf9b-c99b8b1099f7'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:16 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Check Disk Space', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Check Disk Space]    Script Date: 11/20/2014 2:09:16 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Check Disk Space', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'use master
go

-- set configuration for OLE automation
-- (will be used with the file system object)
EXEC sp_configure ''Ole Automation Procedures'', 1
GO 

-- commit reconfiguration
RECONFIGURE
GO

IF OBJECT_ID(''tempdb..#TEST_SYSMAIL_PROFILES'') IS NOT NULL
	BEGIN
		DROP TABLE #TEST_SYSMAIL_PROFILES;
	END

-- create temp table to store email profiles
CREATE TABLE #TEST_SYSMAIL_PROFILES
	(principal_id int,
	 principal_name varchar(200),
	 profile_id int,
	 profile_name varchar(200),
	 is_default bit)
	 
-- insert email profiles into temp table
insert into #TEST_SYSMAIL_PROFILES
EXECUTE msdb.dbo.sysmail_help_principalprofile_sp;	
	
-- removes temp table if it exists
IF OBJECT_ID(''tempdb..#drives'') IS NOT NULL 
	BEGIN
		DROP TABLE #drives
	END
	
/*
   Displays the free space,free space percentage 
   plus total drive size for a server
*/
SET NOCOUNT ON

DECLARE @hr int
DECLARE @fso int
DECLARE @drive char(1)
DECLARE @odrive int
DECLARE @TotalSize varchar(20)
DECLARE @MB bigint ; SET @MB = 1048576

DECLARE @profile_name varchar(2000) 

-- retrieve email profile
SELECT TOP 1 @profile_name = profile_name
FROM #TEST_SYSMAIL_PROFILES

-- create temp table
CREATE TABLE #drives (drive char(1) PRIMARY KEY,
                      FreeSpace int NULL,
                      TotalSize int NULL)

-- insert drive information into temp table
INSERT #drives(drive,FreeSpace) 
EXEC master.dbo.xp_fixeddrives

-- initialize file system object
EXEC @hr=sp_OACreate ''Scripting.FileSystemObject'',@fso OUT
IF @hr <> 0 EXEC sp_OAGetErrorInfo @fso

-- declare cursor to retrieve drives from
-- the temp table
DECLARE dcur CURSOR LOCAL FAST_FORWARD
FOR SELECT drive from #drives
ORDER by drive

OPEN dcur

FETCH NEXT FROM dcur INTO @drive

-- process data from temp table
WHILE @@FETCH_STATUS=0
BEGIN
		-- use the GetDrive method from the file system object to
		-- set the @odrive variable to the drive in the cursor
        EXEC @hr = sp_OAMethod @fso,''GetDrive'', @odrive OUT, @drive
        IF @hr <> 0 EXEC sp_OAGetErrorInfo @fso
        
        -- retrieve total size of drive
        EXEC @hr = sp_OAGetProperty @odrive,''TotalSize'', @TotalSize OUT
        IF @hr <> 0 EXEC sp_OAGetErrorInfo @odrive
		
		-- update the temp table with the
		-- total size of the drive
        UPDATE #drives
        SET TotalSize=@TotalSize/@MB
        WHERE drive=@drive
        
        FETCH NEXT FROM dcur INTO @drive
END

CLOSE dcur
DEALLOCATE dcur

-- close the file system object
EXEC @hr=sp_OADestroy @fso
IF @hr <> 0 EXEC sp_OAGetErrorInfo @fso

DECLARE @drive_location varchar(50)
DECLARE @total_disk_size int
DECLARE @space_used int
DECLARE @space_available int
DECLARE @percent_used varchar(50)
DECLARE @percent_available varchar(50)
DECLARE @email_body varchar(max)
DECLARE @recipients varchar(2000) 
DECLARE @subject varchar(2000)
DECLARE @fields varchar(2000)

SET @recipients = ''DL-KMHP_MSSQLDBAGroup@kmhp.com'' -- distribution list
SET @subject = ''SERVER DRIVE SPACE ALERT  FOR '' + @@SERVERNAME -- email subject line

-- declare cursor to retrieve data
DECLARE DRIVE_SPACE_CURSOR CURSOR FOR 
	SELECT drive AS DRIVE_LOCATION,
		   TotalSize as TOTAL_DISK_SIZE_MB,
		   TotalSize-FreeSpace AS SPACE_USED_MB,
		   FreeSpace as SPACE_AVAILABLE_MB,
		   CAST(CAST(CAST((CAST(TotalSize as decimal(18,4))-CAST(FreeSpace as decimal(18,4)))/TotalSize as decimal(18,4))*100 as decimal(18,2)) as varchar(10)) + ''%'' AS PERCENT_USED,
		   CAST(CAST(CAST((CAST(FreeSpace as decimal(18,4)))/TotalSize as decimal(18,4))*100 as decimal(18,2)) as varchar(10)) + ''%'' AS PERCENT_AVAILABLE
	FROM #drives
	WHERE CAST(CAST(FreeSpace as decimal(18,4))/CAST(TotalSize as decimal(18,4)) as decimal(18,4)) <= 0.0300
	ORDER BY drive
	
SET @email_body = NULL -- set email body to null initially

OPEN DRIVE_SPACE_CURSOR

FETCH NEXT FROM DRIVE_SPACE_CURSOR INTO @drive_location,
										@total_disk_size,
										@space_used,
										@space_available,
										@percent_used,
										@percent_available

-- process records from the cursor
WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @email_body IS NULL 
			BEGIN -- make initial email body
				SET @email_body = ''Drive Letter:  '' + @drive_location + CHAR(13) +
								  ''Total Disk Size (MB):  '' + CAST(@total_disk_size as varchar(100)) + CHAR(13) + 
								  ''Space Used (MB):  '' + CAST(@space_used as varchar(100)) + CHAR(13) + 
								  ''Space Available (MB):  '' + CAST(@space_available as varchar(100)) + CHAR(13) + 
								  ''Percent Used:  '' + @percent_used + CHAR(13) + 
								  ''Percent Available:  '' + @percent_available + CHAR(13) + CHAR(13)
			END
		ELSE
			BEGIN -- append email body to the previous one
				SET @email_body = @email_body + ''Drive Letter:  '' + @drive_location + CHAR(13) +
								  ''Total Disk Size (MB):  '' + CAST(@total_disk_size as varchar(100)) + CHAR(13) + 
								  ''Space Used (MB):  '' + CAST(@space_used as varchar(100)) + CHAR(13) + 
								  ''Space Available (MB):  '' + CAST(@space_available as varchar(100)) + CHAR(13) + 
								  ''Percent Used:  '' + @percent_used + CHAR(13) + 
								  ''Percent Available:  '' + @percent_available + CHAR(13) + CHAR(13)			
			END
						  
		FETCH NEXT FROM DRIVE_SPACE_CURSOR INTO @drive_location,
												@total_disk_size,
												@space_used,
												@space_available,
												@percent_used,
												@percent_available
	END


CLOSE DRIVE_SPACE_CURSOR
DEALLOCATE DRIVE_SPACE_CURSOR

-- send email if the body is not null
IF @email_body IS NOT NULL
	BEGIN
		EXEC msdb.dbo.sp_send_dbmail
			@profile_name = @profile_name,
			@recipients = @recipients,
			@subject = @subject,
			@body = @email_body
	END
go


', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily 30mins', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=24, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20111029, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'e0b685bc-d045-47b1-94c9-dd3ab2625179'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:16 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Check Server Status', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Check Server Status]    Script Date: 11/20/2014 2:09:16 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Check Server Status', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'USE master 
go 
--IF OBJECT_ID(''serverstartup'') IS NOT NULL 
--	BEGIN
--		DROP PROC serverstartup;
--	END

--GO
	
--CREATE PROC serverstartup
--AS

SET NOCOUNT ON

-- remove the ##sqlservice temp table if it exists
IF EXISTS(SELECT 1 FROM tempdb..sysobjects where name =''##sqlservice'')
	DROP TABLE ##sqlservice

-- create a new ##sqlservice temp table
CREATE TABLE ##sqlservice (details VARCHAR(100))

-- remove the ##agentservice temp table if it exists
IF EXISTS(SELECT 1 FROM tempdb..sysobjects where name =''##agentservice'')
	DROP TABLE ##agentservice

-- create a new ##agentservice temp table
CREATE TABLE ##agentservice (details VARCHAR(100))

-- remove the #TEST_SYSMAIL_PROFILES temp table if it exists
IF OBJECT_ID(''tempdb..#TEST_SYSMAIL_PROFILES'') IS NOT NULL
	BEGIN
		DROP TABLE #TEST_SYSMAIL_PROFILES;
	END
	
-- create temp table to store email profiles
CREATE TABLE #TEST_SYSMAIL_PROFILES
	(principal_id int,
	 principal_name varchar(200),
	 profile_id int,
	 profile_name varchar(200),
	 is_default bit)
	
DECLARE @sname VARCHAR(100), @starttime VARCHAR(30)
DECLARE @authmode VARCHAR(25), @subject VARCHAR(250)
DECLARE @insname VARCHAR(50),@agentname VARCHAR(50)
DECLARE @sqlstatus VARCHAR(100), @agentstatus VARCHAR(100)
DECLARE @dbstatus VARCHAR(100), @dbdetail VARCHAR(2000)
DECLARE @sctsql VARCHAR(200), @HTML VARCHAR(8000)
DECLARE @recipients varchar(200)

DECLARE @profile_name varchar(2000) 

	 
-- insert email profiles into temp table
insert into #TEST_SYSMAIL_PROFILES
EXECUTE msdb.dbo.sysmail_help_principalprofile_sp;

-- retrieve email profile
SELECT TOP 1 @profile_name = profile_name
FROM #TEST_SYSMAIL_PROFILES

SET @recipients = ''DL-KMHP_MSSQLDBAGroup@kmhp.com'' -- add distribution list(s) here

-- retrieve the server name, authentication mode
-- and start time
SELECT @sname = @@SERVERNAME
SELECT @authmode=case SERVERPROPERTY(''IsIntegratedSecurityOnly'') when 1 then ''Windows'' else ''Mixed'' end 
SELECT @starttime=CONVERT(VARCHAR(30),create_date,109) from sys.databases where database_id=2

-- retrieve the service names (MS SQL Server and MS SQL Server Agent)
IF (serverproperty(''InstanceName'')) IS NOT NULL
	BEGIN
		SET @insname=''mssql$''+CONVERT(VARCHAR(40),serverproperty(''InstanceName''))
		SET @agentname=''sqlagent$''+CONVERT(VARCHAR(40),serverproperty(''InstanceName''))
	END
ELSE
	BEGIN
		SET @insname=''mssqlserver''
		SET @agentname=''sqlserveragent''
	END

-- retrieve the status of the MS SQL Server instance	
SELECT @sctsql=''EXEC master.dbo.xp_cmdshell ''''sc query ''+@insname+'' | FIND "STATE"''''''
INSERT ##sqlservice
EXEC (@sctsql)

-- retrieve the status of the MS SQL Server Agent instance
SELECT @sctsql=''EXEC master.dbo.xp_cmdshell ''''sc query ''+@agentname+'' | FIND "STATE"''''''
INSERT ##agentservice
EXEC (@sctsql)

-- set the status for running or not running (MS SQL Server)
IF EXISTS(SELECT 1 FROM ##sqlservice WHERE details LIKE ''%RUNNING%'')
	SET @sqlstatus = ''Running''
ELSE 
	SET @sqlstatus = ''<font color="red">Not Running</font>''

-- set the status for running or not running (MS SQL Server Agent)	
IF EXISTS(SELECT 1 FROM ##agentservice WHERE details LIKE ''%RUNNING%'')
	SET @agentstatus = ''Running''
ELSE
	SET @agentstatus = ''<font color="red">Not Running</font>''

-- detemine if the databases are online or offline	
IF EXISTS (SELECT 1 FROM sys.databases WHERE state_desc<>''ONLINE'')
	BEGIN
		SET @dbstatus= ''<font color="red">Some of the database(s) are offline</font>''
		SELECT @dbdetail = ''<table border="1"><tr><th>Database Name</th><th>Database Status</th></tr><tr>''
		SELECT @dbdetail = @dbdetail + ''<td  align="Center">'' + name + ''</td><td  align="Center">''+state_desc+''</td></tr></table>'' FROM sys.databases WHERE state_desc<>''ONLINE''
	END
ELSE
	BEGIN
		SET @dbdetail = ''''
		SET @dbstatus=''All databases are online''
	END

-- set the subject for the email	
SET @subject=@sname+'' : SQL Server Service is Offline. Please Check''

-- set the email body in HTML format
SET @HTML=''<h3>''+@sname+''</h3><br>''+''<table border="1"><tr><th>SQL Server Startup time</th><th>SQL Server Service</th><th>SQL Agent Service</th> <th>Database(s) Status</th><th>Authentication Mode</th></tr><tr><td align="Center">''+
@starttime+''</td><td align="Center">''+@sqlstatus+''</td><td align="Center">''+@agentstatus+''</td><td align="Center">''+@dbstatus+''</td><td align="Center">''+@authmode+''</td></tr></table><br><br>''+@dbdetail

-- if either statuses are not running send the an email
IF @sqlstatus <> ''Running'' OR @agentstatus <> ''Running''
	BEGIN
		EXEC msdb.dbo.sp_send_dbmail  
			@profile_name = @profile_name,
			@recipients =@recipients,
			@subject=@subject,
			@body =@HTML,
			@body_format =''HTML''
	END 
GO

--Enabling startup parameter for that procedure
--EXEC sp_procoption ''serverstartup'',''startup'',True
--GO
', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Every 10 mins', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=10, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20111031, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'3c858cb0-cc20-4951-8967-bed39568b8e5'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:16 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.60.Min', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [execute powershell]    Script Date: 11/20/2014 2:09:16 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'execute powershell', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe G:\CMS\jobs\30_Min.ps1', 
		@flags=0, 
		@proxy_name=N'CMS'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TrackJobHistory]    Script Date: 11/20/2014 2:09:16 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TrackJobHistory', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec TrackHistory 1', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Alert New Databases]    Script Date: 11/20/2014 2:09:16 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Alert New Databases', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec Alert_Databases', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'every 60 min', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=8, 
		@freq_subday_interval=2, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140321, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'12cface4-75a5-4643-8bbe-72d11d5b2fb6'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:17 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.Alerts.Backups', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Execute Backup Alert]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Execute Backup Alert', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'Alert_Backups ''PRODUCTION''', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Bi Hourly During business hours', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=8, 
		@freq_subday_interval=2, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140415, 
		@active_end_date=99991231, 
		@active_start_time=71500, 
		@active_end_time=191500, 
		@schedule_uid=N'b240c237-5dde-42fa-9428-e1c3f85cad81'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:17 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.Alerts.DatabaseFileSpace', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Execute DatabaseFile Alerts]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Execute DatabaseFile Alerts', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec Alert_DatabaseFiles ''hourly'',''production''', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Hourly', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=8, 
		@freq_subday_interval=1, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140320, 
		@active_end_date=99991231, 
		@active_start_time=1500, 
		@active_end_time=235959, 
		@schedule_uid=N'd50b12b7-4e20-47f7-809b-3d9898dac816'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Data Collector]    Script Date: 11/20/2014 2:09:17 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Data Collector' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Data Collector'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.CounterCollector', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'Data Collector', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Run Resource Collection]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Run Resource Collection', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe G:\CMS\jobs\PerfCounters.ps1', 
		@flags=0, 
		@proxy_name=N'CMS'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Every 5 Minutes', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=5, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140714, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'e33a698c-017f-4648-bf0c-8bf82d3b7c18'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:17 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.Daily.Collection', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [execute powershell]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'execute powershell', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe G:\CMS\jobs\Daily.ps1', 
		@flags=0, 
		@proxy_name=N'CMS'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Run Daily Reports]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Run Daily Reports', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec Alert_AgentJobs ''DEVELOPMENT''
go
exec Alert_Backups ''DEVELOPMENT''
go
exec Alert_DatabaseFiles ''Daily'',''DEVELOPMENT''
go
exec Alert_Databases
GO
exec Alert_AgentJobs ''PRODUCTION''
go
exec Alert_Backups ''PRODUCTION''
go
exec Alert_DatabaseFiles ''Daily'',''PRODUCTION''
go
', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'daily', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140327, 
		@active_end_date=99991231, 
		@active_start_time=71500, 
		@active_end_time=235959, 
		@schedule_uid=N'587fd2d8-a08e-4cef-bacb-8ab5de08e87a'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:17 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.Purge', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Purges CollectionLog and history tables based on corresponding values in config table.', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'KMHP\jshurak', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Execute SP]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Execute SP', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec CMS.dbo.Purge_CMS', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Monthly Purge', 
		@enabled=1, 
		@freq_type=16, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20140522, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'8bd115e2-febc-4db2-8ed9-df5d0f3269f4'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Data Collector]    Script Date: 11/20/2014 2:09:17 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Data Collector' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Data Collector'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.ResourceMonitor', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'Data Collector', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Run Resource Collection]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Run Resource Collection', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe G:\CMS\jobs\Resources.ps1', 
		@flags=0, 
		@proxy_name=N'CMS'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Checking for Active Blocking]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Checking for Active Blocking', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC Alert_Blocking', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Alert DriveSpace]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Alert DriveSpace', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec Alert_DriveSpace ''PRODUCTION''', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'10 Minutes', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=10, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140310, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'74fe8fa1-b286-4977-bd87-bae53097cba8'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:17 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.ServerInstanceMonitoring', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Run Powershell]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Run Powershell', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe G:\CMS\jobs\ServerInstanceMonitoring.ps1', 
		@flags=0, 
		@proxy_name=N'CMS'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Run Alert procs]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Run Alert procs', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec Alert_OfflineInstances ''PRODUCTION''
GO
exec Alert_OfflineServers ''PRODUCTION''
GO
exec Alert_OfflineServices ''PRODUCTION''
GO', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'5 Minutes', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=5, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140602, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'0a4a04a1-e839-490e-a97b-f395c2059a6c'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:17 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.TrackHistory', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Record Yesterday's stats]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Record Yesterday''s stats', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec TrackHistory', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Track Baselines]    Script Date: 11/20/2014 2:09:17 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Track Baselines', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec TrackBaseline', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Nightly', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140313, 
		@active_end_date=99991231, 
		@active_start_time=100, 
		@active_end_time=235959, 
		@schedule_uid=N'fa3d8775-253f-46ce-a8ef-bc3a151452e6'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:18 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CommandLog Cleanup', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [CommandLog Cleanup]    Script Date: 11/20/2014 2:09:18 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'CommandLog Cleanup', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "DELETE FROM [dbo].[CommandLog] WHERE StartTime < DATEADD(dd,-30,GETDATE())" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\CommandLogCleanup_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:18 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DatabaseBackup - SYSTEM_DATABASES - FULL', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DatabaseBackup - SYSTEM_DATABASES - FULL]    Script Date: 11/20/2014 2:09:18 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DatabaseBackup - SYSTEM_DATABASES - FULL', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "EXECUTE [dbo].[DatabaseBackup] @Databases = ''SYSTEM_DATABASES'', @Directory = N''C:\Backup'', @BackupType = ''FULL'', @Verify = ''Y'', @CleanupTime = NULL, @CheckSum = ''Y'', @LogToTable = ''Y''" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\DatabaseBackup_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:18 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DatabaseBackup - USER_DATABASES - DIFF', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DatabaseBackup - USER_DATABASES - DIFF]    Script Date: 11/20/2014 2:09:18 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DatabaseBackup - USER_DATABASES - DIFF', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "EXECUTE [dbo].[DatabaseBackup] @Databases = ''USER_DATABASES'', @Directory = N''C:\Backup'', @BackupType = ''DIFF'', @Verify = ''Y'', @CleanupTime = NULL, @CheckSum = ''Y'', @LogToTable = ''Y''" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\DatabaseBackup_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:18 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DatabaseBackup - USER_DATABASES - FULL', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DatabaseBackup - USER_DATABASES - FULL]    Script Date: 11/20/2014 2:09:18 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DatabaseBackup - USER_DATABASES - FULL', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "EXECUTE [dbo].[DatabaseBackup] @Databases = ''USER_DATABASES'', @Directory = N''C:\Backup'', @BackupType = ''FULL'', @Verify = ''Y'', @CleanupTime = NULL, @CheckSum = ''Y'', @LogToTable = ''Y''" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\DatabaseBackup_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:18 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DatabaseBackup - USER_DATABASES - LOG', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DatabaseBackup - USER_DATABASES - LOG]    Script Date: 11/20/2014 2:09:18 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DatabaseBackup - USER_DATABASES - LOG', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "EXECUTE [dbo].[DatabaseBackup] @Databases = ''USER_DATABASES'', @Directory = N''C:\Backup'', @BackupType = ''LOG'', @Verify = ''Y'', @CleanupTime = NULL, @CheckSum = ''Y'', @LogToTable = ''Y''" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\DatabaseBackup_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:18 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DatabaseIntegrityCheck - SYSTEM_DATABASES', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DatabaseIntegrityCheck - SYSTEM_DATABASES]    Script Date: 11/20/2014 2:09:18 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DatabaseIntegrityCheck - SYSTEM_DATABASES', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "EXECUTE [dbo].[DatabaseIntegrityCheck] @Databases = ''SYSTEM_DATABASES'', @LogToTable = ''Y''" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\DatabaseIntegrityCheck_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:18 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DatabaseIntegrityCheck - USER_DATABASES', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DatabaseIntegrityCheck - USER_DATABASES]    Script Date: 11/20/2014 2:09:18 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DatabaseIntegrityCheck - USER_DATABASES', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "EXECUTE [dbo].[DatabaseIntegrityCheck] @Databases = ''USER_DATABASES'', @LogToTable = ''Y''" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\DatabaseIntegrityCheck_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:18 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'History Cleanup.Subplan_1', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Subplan_1]    Script Date: 11/20/2014 2:09:18 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Subplan_1', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/Server "$(ESCAPE_NONE(SRVR))" /SQL "Maintenance Plans\History Cleanup" /set "\Package\Subplan_1.Disable;false"', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'History Cleanup.Subplan_1', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20140128, 
		@active_end_date=99991231, 
		@active_start_time=230000, 
		@active_end_time=235959, 
		@schedule_uid=N'06e1fc89-9e74-4cfd-9969-c7746df1eaeb'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:18 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'IndexOptimize - USER_DATABASES', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [IndexOptimize - USER_DATABASES]    Script Date: 11/20/2014 2:09:18 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'IndexOptimize - USER_DATABASES', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "EXECUTE [dbo].[IndexOptimize] @Databases = ''USER_DATABASES'', @LogToTable = ''Y''" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\IndexOptimize_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:18 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Output File Cleanup', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Output File Cleanup]    Script Date: 11/20/2014 2:09:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Output File Cleanup', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'cmd /q /c "For /F "tokens=1 delims=" %v In (''ForFiles /P "G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG" /m *_*_*_*.txt /d -30 2^>^&1'') do if EXIST "G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG"\%v echo del "G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG"\%v& del "G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG"\%v"', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\OutputFileCleanup_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [ProcessAppVReportingData]    Script Date: 11/20/2014 2:09:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'ProcessAppVReportingData' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'ProcessAppVReportingData'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'ProcessAppVReportingDataJob', 
		@enabled=1, 
		@notify_level_eventlog=3, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Process AppV Reporting Data. --- AmHealth contact: Michael Sorino & Michael Gallager -- disabled 10/7/14', 
		@category_name=N'ProcessAppVReportingData', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Process AppV Reporting Data]    Script Date: 11/20/2014 2:09:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Process AppV Reporting Data', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'Exec dbo.spProcessClientReport', 
		@database_name=N'AppVReportingQA', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Process AppV Reporting Data Schedule', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20120823, 
		@active_end_date=99991231, 
		@active_start_time=100, 
		@active_end_time=235959, 
		@schedule_uid=N'dc8d32ff-974b-41dc-a6a4-93c7cb5a26dd'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Rebuild Fragmented Indexes (variable)', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeFrag Tables]    Script Date: 11/20/2014 2:09:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeFrag Tables', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXECUTE dbo.IndexOptimize
@Databases = ''ALL_DATABASES'',
@FragmentationLow = NULL,
@FragmentationMedium = ''INDEX_REORGANIZE,INDEX_REBUILD_ONLINE,INDEX_REBUILD_OFFLINE'',
@FragmentationHigh = ''INDEX_REBUILD_ONLINE,INDEX_REBUILD_OFFLINE'',
@FragmentationLevel1 = 5,
@FragmentationLevel2 = 30,
@UpdateStatistics = ''ALL'',
@OnlyModifiedStatistics = ''Y'',
@SortInTempdb = ''Y'',
@PartitionLevel = ''Y'',
@LogToTable = ''Y''
', 
		@database_name=N'DATA_COLLECTION', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Index2', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=64, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20120928, 
		@active_end_date=99991231, 
		@active_start_time=20000, 
		@active_end_time=235959, 
		@schedule_uid=N'ecd7f060-1f9f-44df-9020-f7937de03330'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Recycle Agent Error Log', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Agent Error Log Step]    Script Date: 11/20/2014 2:09:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Agent Error Log Step', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec sp_cycle_agent_errorlog -- run this job every week on Sunday Night
go', 
		@database_name=N'msdb', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Sunday at Midnight', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20111102, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'3148faa3-eef8-4145-a5b8-3f69f599f2a1'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Recycle Error Log', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Cycle Error Log]    Script Date: 11/20/2014 2:09:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Cycle Error Log', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC sp_cycle_errorlog
GO', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily Midnight', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20111029, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'094d4278-406a-4eda-a74c-73ebabff7261'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Server Status', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Server Status]    Script Date: 11/20/2014 2:09:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Server Status', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @server_start_time DATETIME, 
@row INT; 

SELECT @server_start_time = login_time 
FROM master.sys.sysprocesses 
WHERE spid = 1 ; 

select @row = (select MAX(row_num) from server_restart_time)
set @row = (@row + 1)
insert into server_restart_time SELECT @server_start_time, @row


if @server_start_time = (select service_restart from server_restart_time where row_num = (@row-1))
delete from server_restart_time where row_num = @row

select * from server_restart_time', 
		@database_name=N'DATA_COLLECTION', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20131205, 
		@active_end_date=99991231, 
		@active_start_time=230000, 
		@active_end_time=235959, 
		@schedule_uid=N'5713ed3c-4398-448c-9c84-616770ad5761'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'sp_delete_backuphistory', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [sp_delete_backuphistory]    Script Date: 11/20/2014 2:09:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'sp_delete_backuphistory', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d msdb -Q "DECLARE @CleanupDate datetime SET @CleanupDate = DATEADD(dd,-30,GETDATE()) EXECUTE dbo.sp_delete_backuphistory @oldest_date = @CleanupDate" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\sp_delete_backuphistory_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:09:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'sp_purge_jobhistory', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [sp_purge_jobhistory]    Script Date: 11/20/2014 2:09:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'sp_purge_jobhistory', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d msdb -Q "DECLARE @CleanupDate datetime SET @CleanupDate = DATEADD(dd,-30,GETDATE()) EXECUTE dbo.sp_purge_jobhistory @oldest_date = @CleanupDate" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\sp_purge_jobhistory_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'syspolicy_purge_history', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Verify that automation is enabled.]    Script Date: 11/20/2014 2:09:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Verify that automation is enabled.', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=1, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'IF (msdb.dbo.fn_syspolicy_is_automation_enabled() != 1)
        BEGIN
            RAISERROR(34022, 16, 1)
        END', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Purge history.]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Purge history.', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC msdb.dbo.sp_syspolicy_purge_history', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Erase Phantom System Health Records.]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Erase Phantom System Health Records.', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'PowerShell', 
		@command=N'if (''$(ESCAPE_SQUOTE(INST))'' -eq ''MSSQLSERVER'') {$a = ''\DEFAULT''} ELSE {$a = ''''};
(Get-Item SQLSERVER:\SQLPolicy\$(ESCAPE_NONE(SRVR))$a).EraseSystemHealthPhantomRecords()', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'syspolicy_purge_history_schedule', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20080101, 
		@active_end_date=99991231, 
		@active_start_time=20000, 
		@active_end_time=235959, 
		@schedule_uid=N'9f503e7a-f6cf-4b4e-969d-fb9bac2e7598'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:20 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'sysutility_get_cache_tables_data_into_aggregate_tables_daily', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'At every 12:01 AM stroke, the data of the cache tables get aggregated and put into corresponding aggregate by day tables.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Aggregate current days data from the cache tables into the server aggregation table]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Aggregate current days data from the cache tables into the server aggregation table', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @now DATETIME; SELECT @now = GETUTCDATE(); EXEC [sysutility_ucp_core].sp_copy_cache_table_data_into_aggregate_tables @aggregation_type=2, @endTime=@now', 
		@database_name=N'sysutility_mdw', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Purge cache table history data based on retention period]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Purge cache table history data based on retention period', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC [sysutility_ucp_core].[sp_purge_cache_tables];', 
		@database_name=N'sysutility_mdw', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Purge resource health policy evaluation history based on trailing window]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Purge resource health policy evaluation history based on trailing window', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC msdb.dbo.sp_sysutility_ucp_delete_policy_history', 
		@database_name=N'msdb', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'OccursOnceADayAt12:01AM', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20080218, 
		@active_end_date=99991231, 
		@active_start_time=100, 
		@active_end_time=235959, 
		@schedule_uid=N'acb4d2d5-d2ee-4d33-b82e-a296a41fc225'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:20 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'sysutility_get_cache_tables_data_into_aggregate_tables_hourly', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'At every hour''s stroke, the data of the cache tables get aggregated and put into corresponding aggregate by hour tables.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Aggregate current hours data from the cache tables into the server aggregation table]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Aggregate current hours data from the cache tables into the server aggregation table', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @now DATETIMEOFFSET(7); SELECT @now = SYSDATETIMEOFFSET(); EXEC [sysutility_ucp_core].sp_copy_cache_table_data_into_aggregate_tables @aggregation_type=1, @endTime=@now', 
		@database_name=N'sysutility_mdw', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'OccursEveryOneHour', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=8, 
		@freq_subday_interval=1, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140918, 
		@active_end_date=99991231, 
		@active_start_time=100, 
		@active_end_time=235959, 
		@schedule_uid=N'51a7404f-7bd0-4210-87b7-da1eb2ff3f6e'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:09:20 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'sysutility_get_views_data_into_cache_tables', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Gets all the views data into corresponding cache tables after every 15 minutes', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Insert latest data from live tables into cache tables]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Insert latest data from live tables into cache tables', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC [sysutility_ucp_staging].sp_copy_live_table_data_into_cache_tables', 
		@database_name=N'sysutility_mdw', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Execute resource health policy evaluation job]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Execute resource health policy evaluation job', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'PowerShell', 
		@command=N'$serverName = ''$(ESCAPE_SQUOTE(SRVR))'';
                                   $path = Convert-UrnToPath "PolicyStore[@Name=`''$serverName`'']";
                                   dir $path\Policies -FORCE | where { $_.IsSystemObject -eq $true -and $_.Name -like ''Utility*'' } | Invoke-PolicyEvaluation -TargetServerName $serverName;', 
		@database_name=N'msdb', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Compute resource health states]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Compute resource health states', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC msdb.dbo.sp_sysutility_ucp_calculate_health', 
		@database_name=N'msdb', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'OccursEvery15Minutes', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=15, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140918, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'7c3e972b-6e4b-4c61-9061-715d8b9ba531'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Utility - Managed Instance]    Script Date: 11/20/2014 2:09:20 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Utility - Managed Instance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Utility - Managed Instance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'sysutility_mi_collect_and_upload', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Collect configuration and performance information', 
		@category_name=N'Utility - Managed Instance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Record batch start time]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Record batch start time', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'
               USE tempdb
               
               IF OBJECT_ID (''[tempdb].[dbo].[sysutility_batch_time_internal]'') IS NOT NULL
               BEGIN
                  DROP TABLE [tempdb].[dbo].[sysutility_batch_time_internal];
               END;
               
               CREATE TABLE [tempdb].[dbo].[sysutility_batch_time_internal] (
                  latest_batch_time datetimeoffset(7) PRIMARY KEY NOT NULL
               );
                  
               -- The DC job needs to access the timestamp in this table, and it may not run under a login that 
               -- is mapped to a user in tempdb, so grant SELECT permissions to public.  The table contains no 
               -- sensitive data (only a single datetimeoffset value), so granting read permission to public 
               -- does create a security problem. 
               GRANT SELECT ON [tempdb].[dbo].[sysutility_batch_time_internal] TO PUBLIC;

               -- Save the start time for the current execution of the managed instance data collection job
               INSERT INTO [tempdb].[dbo].[sysutility_batch_time_internal] (latest_batch_time) VALUES (SYSDATETIMEOFFSET());', 
		@database_name=N'tempdb', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Stage Data Collected from PowerShell Script]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Stage Data Collected from PowerShell Script', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'PowerShell', 
		@command=N'[Void] [System.Reflection.Assembly]::LoadWithPartialName("System.Data")
[Void] [System.Reflection.Assembly]::LoadWithPartialName("System.Diagnostics")
[Void] [System.Reflection.Assembly]::LoadWithPartialName("System.Collections")

###############################################################################
# Powershell settings
###############################################################################

# Generate an error if attempt to access a nonexisting variable
Set-PsDebug -Strict

# Global settings for what to do on a error, warning, or verbose call
# Change these settings to change how this script writes output in the agent logs
# Settings also affects how SQL Agent reports success or failure in the script
# Options are:
#      Continue - Continue processing and notify the user 
#             - Agent reaction: step will report success, and
#                           log will include message
#      Inquire - Stop processing and ask the user how it should proceed 
#             - Agent reaction: step fails with "cannot invoke this function"
#                           the Agent PS provider does not implement this
#      SilentlyContinue - Continue processing without notifying the user
#                    - Agent reaction:  will not fail step 
#                                 and will not log any message
#      Stop - Stop processing when an action occurs
#          - Agent reaction: step will fail with message in log
$VerbosePreference = "SilentlyContinue"
$WarningPreference = "Continue"
$ErrorActionPreference = "Stop"

###############################################################################
# Global Variables
###############################################################################

# The following line uses SQL Agent tokens to set the server name
# ESCAPE_SQUOTE(SRVR) with a $ sign in front is a special token to SQL Agent
# When the job is run, SQL Agent will expand the string to the server name
# Use single quotes so that PS considers the string a literal and will not
# try to expand the $ reference and the script will not fail in a test environment
$serverName = ''$(ESCAPE_SQUOTE(SRVR))''

# Currently the best way to tell if the script is running in Agent
# is to check if the console is not the ConsoleHost.  The Powershell
# subsystem for Agent has no console and thus writing to the host directly
# does not show up in the Agent logs.
$isNotConsole = ($host.Name -ne "ConsoleHost")

$connection = $null
$transaction = $null
$isVistaOrXPSp2OrHigher = $null
$sleepTimeoutSeconds = 5
$directoryNameToDeviceId=$null

$cpuStageTableName = "[msdb].[dbo].[sysutility_mi_cpu_stage_internal]"
$cpuStageDataTable = $null
$cpuNumProcessorsColumnName = "num_processors"
$cpuNameColumnName = "cpu_name"
$cpuCaptionColumnName = "cpu_caption"
$cpuFamilyIdColumnName = "cpu_family_id"  
$cpuArchitectureIdColumnName = "cpu_architecture_id"
$cpuMaxClockSpeedColumnName = "cpu_max_clock_speed"
$cpuClockSpeedColumnName = "cpu_clock_speed"
$cpuL2CacheSizeColumnName = "l2_cache_size"
$cpuL3CacheSizeColumnName = "l3_cache_size"
# Start of collection column names
$cpuInstanceProcessorUsageStartTicks = "instance_processor_usage_start_ticks"
$cpuInstanceCollectTimeStartTicks = "instance_collect_time_start_ticks"
$cpuComputerProcessorIdleStartTicks = "computer_processor_idle_start_ticks"
$cpuComputerCollectTimeStartTicks = "computer_collect_time_start_ticks"
# End of collection column names
$cpuInstanceProcessorUsageEndTicks = "instance_processor_usage_end_ticks"
$cpuInstanceCollectTimeEndTicks = "instance_collect_time_end_ticks"
$cpuComputerProcessorIdleEndTicks = "computer_processor_idle_end_ticks"
$cpuComputerCollectTimeEndTicks = "computer_collect_time_end_ticks"


$volumeStageTableName = "[msdb].[dbo].[sysutility_mi_volumes_stage_internal]"
$volumeStageDataTable = $null
$volumeDeviceIdColumnName = "volume_device_id"
$volumeNameColumnName = "volume_name"
$volumeCapacityColumnName = "capacity_mb"
$volumeFreeSpaceColumnName = "free_space_mb"

$smoStageTableName = "[msdb].[dbo].[sysutility_mi_smo_stage_internal]"
$smoStageDataTable = $null
$smoTypeColumnName = "object_type"
$smoUrnColumnName = "urn"
$smoPropertyNameColumnName = "property_name"
$smoPropertyValueColumnName = "property_value"

###############################################################################
# Functions that help with handling output to SQL Agent
#
# Sql Agent PS provider does not write output to the log from
# the warnings, errors, and verbose Write cmdlets.  The following
# functions wrap these cmdlets for execution as an agent job step.
###############################################################################

# This function is a helper function throws an exception if the passed in object 
# is null or empty.  The intent is to mimic the PowerShell version 2.0 parameter 
# validation function with the same name. The paramter validation is available 
# in 2.0 or higher, but this script can run in 1.0 or 2.0 runtime environment.
function ValidateNotNullOrEmpty($object)
{
    if(($object -eq $null) -or ($object -eq ""))
    {
        throw "The argument is null or empty."
    }
}

# This function helps control control flow for the agent step context
# When running within agent, there are different semantics for writing
# errors, warnings, and messages.  In addition, when running inside an
# agent step, the script will automatically collect and stage data.
# However, if the script is loaded in a PS environment outside of 
# agent, the script will not automatically start to collect and stage data
#
# Returns True if the script is run inside an agent step
#         False if the script is run outside an agent step 
function Get-IsAgentStep
{
   $global:isNotConsole
}

function Write-AgentLog([String] $prefix, [String] $printString, [String] $preference)
{
   if((Get-IsAgentStep) -and ($preference -ne "SilentlyContinue"))
   {
      [Console]::Error.WriteLine($prefix + $printString)
   }
}

function Get-PrintString ($object)
{
   ValidateNotNullOrEmpty $object
   
   $date = Get-Date -DisplayHint Time
   $printString = $date.ToString() + " : " +  $object.ToString()
   $printString
}

function Write-ScriptVerbose ($object)
{
   $printString = Get-PrintString $object
   
   Write-AgentLog "VERBOSE : " $printString $VerbosePreference 
   Write-Verbose $printString
}


function Write-ScriptWarning ($object)
{
   $printString = Get-PrintString $object
   
   Write-AgentLog "WARNING : " $printString $WarningPreference 
   Write-Warning $printString
}

function Write-ScriptError ($object)
{
   $printString = Get-PrintString $object
   
   Write-AgentLog "ERROR : " $printString $ErrorActionPreference 
   Write-Error $printString   
}

function Resolve-Error ($ErrorRecord=$Error[0])
{
   $errorString = $ErrorRecord | Format-List * -Force  | Out-String
   Write-ScriptWarning $errorString
   $errorString = $ErrorRecord.InvocationInfo | Format-List * | Out-String
   Write-ScriptWarning $errorString
   $Exception = $ErrorRecord.Exception
   
   # Print the entire stack of exceptions
   for ($i = 0; $Exception; $i++, ($Exception = $Exception.InnerException))
   {   Write-ScriptWarning ("$i" * 80)
       $errorString = $Exception | Format-List * -Force  | Out-String
      Write-ScriptWarning $errorString
   }
}


###############################################################################
# Connection Functions help to send queries to and manage the connection 
# to the server .
###############################################################################
function Get-Connection
{
   if($global:serverName.Contains(''ESCAPE_SQUOTE(SRVR)''))
   {
      throw "The global variable serverName has not been set."
   }
   if($global:connection -eq $null)
   {
      Write-ScriptVerbose "Opening connection to $global:serverName"
      $connString="Application Name=SQL Server Utility Managed Instance;Server=$global:serverName;Database=msdb;Trusted_Connection=True;"
      
      $global:connection = New-Object System.Data.SqlClient.SqlConnection
      $global:connection.ConnectionString = $connString
      [Void]$global:connection.Open()
      Write-ScriptVerbose "Opened connection with connection string:`n $connString"
   }
   $global:connection
}

function Remove-Connection
{
   if($global:connection -ne $null)
   {
      $dataSource=$global:connection.DataSource
      Write-ScriptVerbose "Closing and disposing connection to $dataSource"
      [Void]$global:connection.Close()
      [Void]$global:connection.Dispose()
      Write-ScriptVerbose "Connection is closed and disposed"
   }
   $global:connection = $null
}

function Invoke-BeginTransaction([string] $tranName)
{
   Write-ScriptVerbose "Opening transaction"
   $sqlConnection = Get-Connection
   $global:transaction = $sqlConnection.BeginTransaction($tranName)
}

function Invoke-CommitTransaction
{
   if($global:transaction -ne $null)
   {
      Write-ScriptVerbose "Committing transaction"
      $global:transaction.Commit()
      $global:transaction.Dispose()
      $global:transaction = $null
   }
}

function Invoke-RollbackTransaction
{
   if($global:transaction -ne $null)
   {
      Write-ScriptVerbose "Rolling back transaction"
      $global:transaction.Rollback() 
      $global:transaction.Dispose()
      $global:transaction = $null
   }
}

function Invoke-SubmitSqlCommandNonQuery([string] $query)
{
   ValidateNotNullOrEmpty $query
      
   Write-ScriptVerbose "Submitting as NonQuery : $query"
   $TsqlCommand = New-Object System.Data.SqlClient.SqlCommand;
   $TsqlCommand.CommandText = $query
   $TsqlCommand.CommandType = "Text";
   $TsqlCommand.Transaction = $global:transaction
   
   $TsqlCommand.Connection = Get-Connection
   $TsqlCommand.CommandTimeout = 0
   [Void] $TsqlCommand.ExecuteNonQuery()
}

function Get-SqlDataTable([string] $query)
{
   ValidateNotNullOrEmpty $query
   
   Write-ScriptVerbose "Requesting data table for : $query"
   $sqlConnection = Get-Connection
    $dataAdapter = New-Object System.Data.SqlClient.SqlDataAdapter($query, $sqlConnection)
    $dataTable = New-Object System.Data.DataTable
    $rowsFilled = $dataAdapter.Fill($dataTable)
   Write-ScriptVerbose "Query added $rowsFilled rows to the data table"
    # return the data table.  We need to wrap the variable because PS will
   # return data rows otherwise.
   return @(,($dataTable))
} 

function Invoke-BulkCopyCommand([System.Data.DataTable] $dataTableData)
{
   ValidateNotNullOrEmpty $dataTableData
   
   $opt = [System.Data.SqlClient.SqlBulkCopyOptions] 

   # Obtain a TableLock
   # But do not (use) Default (options), KeepIdentity, CheckConstraints, KeepNulls
   #  FireTriggers,  UseInternalTransaction
   $bulkOptions = $opt::none -bxor ("TableLock" -as $opt) 

   $tabName=$dataTableData.TableName
   Write-ScriptVerbose "Bulk copying data table : $tabName"
   $sqlConnection = Get-Connection
   $bulkCopy = new-object Data.SqlClient.SqlBulkCopy $sqlConnection, $bulkOptions,  $global:transaction
   $bulkCopy.DestinationTableName = $dataTableData.TableName
   
   #Map the columns so that the computed columns are skipped in the upload
   foreach($col in $dataTableData.Columns)
   {
      [Void] $bulkCopy.ColumnMappings.Add($col.ColumnName, 
                                 $col.ColumnName)
   }
   [Void] $bulkCopy.WriteToServer($dataTableData)
   
}

###############################################################################
# Short Helper Functions 
###############################################################################

function Get-DefaultIfNull($object, $default)
{
    if($object -eq $null) 
    {
        $default
    } 
    else
    {
        $object
    }
}

function Get-StringDefaultIfNull([String] $object)
{
    Get-DefaultIfNull $object ""
}

function Get-NumericDefaultIfNull($object)
{
    Get-DefaultIfNull $object 0
}

function Get-ProcessId
{
   $result = Get-SqlDataTable "SELECT SERVERPROPERTY(''ProcessID'') AS ProcessId"  | %{ $_.Rows }
   $result.ProcessId
}

function Get-IsWmiVolumeQueryAvailable
{
   if($global:isVistaOrXPSp2OrHigher -eq $null)
   {
      $osVersion = [System.Environment]::OsVersion.Version
      $global:isVistaOrXPSp2OrHigher = ($osVersion.Major -ge 6 -or ($osVersion.Major -ge 5 -and $osVersion.Minor -ge 2))
   }
   Write-ScriptVerbose "This computer is Vista or XP Sp2 or higher value is $global:isVistaOrXPSp2OrHigher"
   $global:isVistaOrXPSp2OrHigher
}

# Trims the volume name to <drive_letter>: format. 
# Reason: Data collection using WMI on different OS returns diffrent volume formats
# E.g. Win32_LogicalDisk on WIN2K3 returns c: and Win32_Volume on WIN2K8 returns c:
function Get-FormattedVolumeName([String] $volumeName)
{
   [String] $volumeName = Get-StringDefaultIfNull $volumeName
   
   Write-ScriptVerbose "Formatting volume name $volumeName"
   if($volumeName.EndsWith("\"))
   {
      $volumeName = $volumeName.SubString(0,$volumeName.Length - 1)
   }
   
   Write-ScriptVerbose "Formatted volume name to $volumeName"
   $volumeName
}

function Get-MountPointDictionary()
{
	if($global:directoryNameToDeviceId -eq $null)
	{
		$global:directoryNameToDeviceId=@{}
		(Get-Wmiobject Win32_MountPoint) | 
		%{ $directory=$_.Directory.Replace("Win32_Directory.Name=", "").Replace("`"", "").Replace("\\", "\")
		   $deviceId=$_.Volume.Replace("Win32_Volume.DeviceID=`"", "").Replace("`"", "").Replace("\\", "\")
		   $global:directoryNameToDeviceId[$directory]=$deviceId
		}
	}
	return $global:directoryNameToDeviceId
}

# The following function returns a directory name that maps to a volume device
# based on longest match.  It is not exact because a file can have a long
# convoluted path that pass through many mount point references
# However, it will find the most common use case for mount points
function Get-MountPointName([String] $fileName)
{
    [String] $fileName = Get-StringDefaultIfNull $fileName

    $longestMatch = ""
    $dict = Get-MountPointDictionary
    foreach($directory in $dict.Keys)
    {
        if($fileName.StartsWith($directory, [System.StringComparison]::OrdinalIgnoreCase))
        {
            if($directory.Length -gt $longestMatch.Length)
            {
                $longestMatch = $directory
            }
        }
    }
    return $longestMatch
}


function Get-DeviceIdFromMountPointName([String] $mountPointDirectory)
{
    [String] $mountPointDirectory = Get-StringDefaultIfNull $mountPointDirectory

    $dict = Get-MountPointDictionary
    
    $dict[$mountPointDirectory]
} 

function Get-MegabytesFromBytes ([Uint64] $bytes)
{
   [Uint64] $bytes = Get-NumericDefaultIfNull $bytes
      
   Write-ScriptVerbose "Converting $bytes bytes to megabytes"
   $oneMB = 1048576
   [UInt64] ($bytes / $oneMB)  # No fractional MBs
}

function Get-ShouldCollectCpu
{   
   if( ($global:cpuStageDataTable -eq $null) -or ($global:cpuStageDataTable.Rows.Count -eq 0))
   {
      Write-ScriptVerbose "The cpu staging table is null or empty.  Get-ShouldCollectCpu returning true"
      # return True and exit early
      return $true
   }
   else
   {
      $dataRow = $global:cpuStageDataTable.Rows[0]
      
      # return the value of the disjunction
      $dataRow[$cpuInstanceProcessorUsageStartTicks] -eq 0 -or
         $dataRow[$cpuInstanceCollectTimeStartTicks] -eq 0 -or
         $dataRow[$cpuComputerProcessorIdleStartTicks] -eq 0 -or
         $dataRow[$cpuComputerCollectTimeStartTicks] -eq 0
   }
}

###############################################################################
# Staging Functions that construct DataTables based on the different types of 
# data collection
###############################################################################
function Add-StageCpuRow
{
   param ([Int32] $numProcessors, [String] $cpuName, [String] $cpuCaption, [UInt16] $cpuFamily, 
      [UInt16] $architecture, [UInt32] $cpuMaxClockSpeed, [UInt32] $clockSpeed, 
      [UInt32] $l2CacheSize, [UInt32] $l3CacheSize, 
      [UInt64] $instanceProcessorUsage, [Int64] $instanceCollectTime, 
      [UInt64] $computerIdleTime, [UInt64] $computerCollectTime)

   begin
   {
      # This function update the Cpu table in-place by
      # first querying the server for the previous collection
      # information
      if($global:cpuStageDataTable -eq $null)
      {
         $query = "SELECT  
                  $cpuNumProcessorsColumnName,
                  $cpuNameColumnName,
                  $cpuCaptionColumnName,
                  $cpuFamilyIdColumnName,
                  $cpuArchitectureIdColumnName,
                  $cpuMaxClockSpeedColumnName,
                  $cpuClockSpeedColumnName,
                  $cpuL2CacheSizeColumnName,
                  $cpuL3CacheSizeColumnName,
                  $cpuInstanceProcessorUsageStartTicks,
                  $cpuInstanceCollectTimeStartTicks,
                  $cpuComputerProcessorIdleStartTicks,
                  $cpuComputerCollectTimeStartTicks,
                  $cpuInstanceProcessorUsageEndTicks,
                  $cpuInstanceCollectTimeEndTicks,
                  $cpuComputerProcessorIdleEndTicks,
                  $cpuComputerCollectTimeEndTicks
               FROM $global:cpuStageTableName"
         $global:cpuStageDataTable = Get-SqlDataTable $query
                  
         # If the data table is null, then there is no
         # data on the server and the table needs to be initialized
         if($global:cpuStageDataTable -eq $null)
         {
            Write-ScriptVerbose "Database returned no rows for cpu table. Creating table definition"
            $global:cpuStageDataTable = New-Object System.Data.DataTable ($global:cpuStageTableName)
            
            ($cpuNumProcessorsColumnName, [UInt16]), 
            ($cpuNameColumnName,[string]), 
            ($cpuCaptionColumnName,[string]), 
            ($cpuFamilyIdColumnName, [UInt16]), 
            ($cpuArchitectureIdColumnName, [UInt16]), 
            ($cpuMaxClockSpeedColumnName, [UInt32]), 
            ($cpuClockSpeedColumnName, [UInt32]), 
            ($cpuL2CacheSizeColumnName, [UInt32]), 
            ($cpuL3CacheSizeColumnName, [UInt32]), 
            ($cpuInstanceProcessorUsageStartTicks, [UInt64]), 
            ($cpuInstanceCollectTimeStartTicks, [Int64]), 
            ($cpuComputerProcessorIdleStartTicks, [UInt64]), 
            ($cpuComputerCollectTimeStartTicks, [UInt64]), 
            ($cpuInstanceProcessorUsageEndTicks, [UInt64]), 
            ($cpuInstanceCollectTimeEndTicks, [Int64]),
            ($cpuComputerProcessorIdleEndTicks, [UInt64]), 
            ($cpuComputerCollectTimeEndTicks, [UInt64]) | 
            foreach { ,
               $column =  new-object Data.DataColumn ($_)
               $global:cpuStageDataTable.Columns.Add($column) 
            }
         }
         $global:cpuStageDataTable.TableName = $global:cpuStageTableName
      }
      
      
      # If there is one row in the table, it is the data that the query returned
      # update the start values to be the old end values
      if ($global:cpuStageDataTable.Rows.Count -eq 1)
      {
         Write-ScriptVerbose "Stage table contains one row. Swapping end to start values."
         $dataRow = [System.Data.DataRow] $global:cpuStageDataTable.Rows[0]
   
         # The previous end values become the start values
         $dataRow[$cpuInstanceProcessorUsageStartTicks] = $dataRow[$cpuInstanceProcessorUsageEndTicks]
         $dataRow[$cpuInstanceCollectTimeStartTicks] = $dataRow[$cpuInstanceCollectTimeEndTicks]
         $dataRow[$cpuComputerProcessorIdleStartTicks] = $dataRow[$cpuComputerProcessorIdleEndTicks]
         $dataRow[$cpuComputerCollectTimeStartTicks] = $dataRow[$cpuComputerCollectTimeEndTicks]
      } 
      else
      {
         # There were no rows in the table or too many rows
         # Either way, the data needs to be cleared and updated
         # with the new information
         $rowCount = $global:cpuStageDataTable.Rows.Count
         Write-ScriptVerbose "Number of rows in data table is $rowCount"   
         
         Write-ScriptVerbose "Clearing stage table and marking start values with 0"
         [Void] $global:cpuStageDataTable.Clear()
         $dataRow = [System.Data.DataRow] $global:cpuStageDataTable.NewRow()
         $global:cpuStageDataTable.Rows.Add($dataRow)
         
         # There are no start values
         $dataRow[$cpuInstanceProcessorUsageStartTicks] = 0
         $dataRow[$cpuInstanceCollectTimeStartTicks] = 0
         $dataRow[$cpuComputerProcessorIdleStartTicks] = 0
         $dataRow[$cpuComputerCollectTimeStartTicks] = 0
      }
   }
   
   process
   {
      # Powershell 2.0 does not default typed parameters that are $null
      # So, the function has to set the defaults for the null parameters
      [Int32] $numProcessors = Get-NumericDefaultIfNull $numProcessors
      [String] $cpuName = Get-StringDefaultIfNull $cpuName
      [String] $cpuCaption = Get-StringDefaultIfNull $cpuCaption
      [UInt16] $cpuFamily = Get-NumericDefaultIfNull $cpuFamily
      [UInt16] $architecture = Get-NumericDefaultIfNull $architecture
      [UInt32] $cpuMaxClockSpeed = Get-NumericDefaultIfNull $cpuMaxClockSpeed
      [UInt32] $clockSpeed = Get-NumericDefaultIfNull $clockSpeed
      [UInt32] $l2CacheSize = Get-NumericDefaultIfNull $l2CacheSize
      [UInt32] $l3CacheSize = Get-NumericDefaultIfNull $l3CacheSize
      [UInt64] $instanceProcessorUsage = Get-NumericDefaultIfNull $instanceProcessorUsage
      [Int64] $instanceCollectTime = Get-NumericDefaultIfNull $instanceCollectTime
      [UInt64] $computerIdleTime = Get-NumericDefaultIfNull $computerIdleTime
      [UInt64] $computerCollectTime = Get-NumericDefaultIfNull $computerCollectTime
      
   
      # instanceCollectTime comes in as an signed int, make sure it is not neg
      if($instanceCollectTime -lt 0)
      {
         $instanceCollectTime = 0
      }
      
      # numProcessors comes in as an signed int, make sure it is not neg
      if($numProcessors -lt 0)
      {
         $numProcessors = 0
      }
   
      # Add the collected information
      Write-ScriptVerbose "Adding collected information to data table"
      $dataRow[$cpuNumProcessorsColumnName] = $numProcessors
      $dataRow[$cpuNameColumnName] = $cpuName
      $dataRow[$cpuCaptionColumnName] = $cpuCaption
      $dataRow[$cpuFamilyIdColumnName] = $cpuFamily
      $dataRow[$cpuArchitectureIdColumnName] = $architecture
      $dataRow[$cpuMaxClockSpeedColumnName] = $cpuMaxClockSpeed
      $dataRow[$cpuClockSpeedColumnName] = $clockSpeed
      $dataRow[$cpuL2CacheSizeColumnName] = $l2CacheSize
      $dataRow[$cpuL3CacheSizeColumnName] = $l3CacheSize
      $dataRow[$cpuInstanceProcessorUsageEndTicks] = $instanceProcessorUsage
      $dataRow[$cpuInstanceCollectTimeEndTicks] = $instanceCollectTime
      $dataRow[$cpuComputerProcessorIdleEndTicks] = $computerIdleTime
      $dataRow[$cpuComputerCollectTimeEndTicks] = $computerCollectTime
   }
}



function Add-StageVolumeRow
{ 
   param ([String]$deviceId,
         [String] $volumeNameRaw, 
         [UInt64] $capacityBytes, 
         [UInt64] $freeSpaceBytes)
   begin
   {
      # Initialize the stage table
      if($global:volumeStageDataTable -eq $null)
      {   
         Write-ScriptVerbose "Volume data table is null, creating table definition."
         $global:volumeStageDataTable = New-Object System.Data.DataTable ($global:volumeStageTableName)
            
         ($global:volumeDeviceIdColumnName, [String]), 
         ($global:volumeNameColumnName, [String]), 
         ($global:volumeCapacityColumnName, [UInt64]), 
         ($global:volumeFreeSpaceColumnName, [UInt64])| 
         foreach { ,
            $column =  new-object Data.DataColumn ($_)
            $global:volumeStageDataTable.Columns.Add($column) 
         }
      }
   }
   process
   {
      [String] $deviceId = Get-StringDefaultIfNull $deviceId
      [String] $formattedName = Get-FormattedVolumeName $volumeNameRaw
      [UInt64] $freeSpaceMB = Get-MegabytesFromBytes $freeSpaceBytes
      [UInt64] $capacityMB = Get-MegabytesFromBytes $capacityBytes
      
      if ( ($formattedName -eq "") -or ($deviceId -eq ""))
      {
         Write-ScriptWarning "DeviceId is empty string, or volume name formatting results in empty string.  Skipping this row."
         Write-ScriptWarning "Device Id = $deviceId. Volume name raw = $volumeNameRaw."
         return # return early
      }

      Write-ScriptVerbose "Adding collected information to data table"
      $dataRow = [System.Data.DataRow] $global:volumeStageDataTable.NewRow()
      $dataRow[$global:volumeNameColumnName] = $formattedName
      $dataRow[$global:volumeFreeSpaceColumnName] = $freeSpaceMB
      $dataRow[$global:volumeCapacityColumnName] = $capacityMB
      $dataRow[$global:volumeDeviceIdColumnName] = $deviceId
      Write-ScriptVerbose "Adding row to table"
      
      [Void] $global:volumeStageDataTable.Rows.Add($dataRow)
   }
}


function Add-StageSmoRow
{
   param ([Int32] $type, [String] $objUrn, [String] $propertyName, [object] $value)
   begin
   {      
      # Initialize the stage table
      if($global:smoStageDataTable -eq $null)
      {   
         Write-ScriptVerbose "Smo data table is null, creating table definition."
         $global:smoStageDataTable = New-Object System.Data.DataTable ($global:smoStageTableName)
         
         ($global:smoTypeColumnName, [Int32]), 
         ($global:smoUrnColumnName, [String]), 
         ($global:smoPropertyNameColumnName, [String]), 
         ($global:smoPropertyValueColumnName, [Object]) | 
         foreach { ,
            $column =  new-object Data.DataColumn ($_)
            $global:smoStageDataTable.Columns.Add($column) 
         }   
      }
   }
   process
   {  
      # if the type, propertyName, or Urn is null, something is wrong, throw an exception
      ValidateNotNullOrEmpty $type          
      ValidateNotNUllOrEmpty $propertyName
      ValidateNotNUllOrEmpty $objUrn
      
      # value can be null sometimes, which is fine.  Just throw the row out.
      if ( $value -eq $null )
      {
         Write-ScriptWarning "The value for property $propertyName is null. This property will not be added."
         Write-ScriptWarning "(objUrn = $objUrn)) (type = $type)) (propertyName = $propertyName)) (value = $value))"
         return # return early
      }
      
      Write-ScriptVerbose "Adding collected information for $propertyName to data table"
      $dataRow = [System.Data.DataRow] $global:smoStageDataTable.NewRow()
      $dataRow[$global:smoTypeColumnName] = $type
      $dataRow[$global:smoUrnColumnName] = $objUrn
      $dataRow[$global:smoPropertyNameColumnName] = $propertyName
      $dataRow[$global:smoPropertyValueColumnName] = $value
      
      $global:smoStageDataTable.Rows.Add($dataRow)
      
   }
}
   

###############################################################################
# Collection functions
###############################################################################
function Collect-CpuData
{

   &{ # PS Try
      # Get the Instance-level Performance Data.  An instance is identified 
      # by its process-id
      $processId = Get-ProcessId;
      
      Write-ScriptVerbose "Get WMI percent cpu time for process id = $processId"
      # Get the total processor time from the wmi object
      # PercentProcessorTime is bad property name, it is actually counting the 
      # total number of ticks (100NS based)
      # the instance has spent on processors.
      (Get-WmiObject Win32_PerfRawData_PerfProc_Process -filter "IDProcess = ''$processId''") | 
      %{ $instanceProcessorUsage = $_.PercentProcessorTime };
      
      Write-ScriptVerbose "Get current time for collection time"
      # Find the current number of ticks
      $instanceCollectTime = [DateTime]::UtcNow.Ticks
      
      Write-ScriptVerbose "Get WMI machine cpu time and time stamp"
      # Get the Machine-level Performance Data
      (Get-WmiObject Win32_PerfRawData_PerfOS_Processor -filter "Name = ''_Total''") |
      %{ $computerIdleTime = $_.PercentProcessorTime; 
      $computerCollectTime = $_.TimeStamp_Sys100NS };
      
      Write-ScriptVerbose "Get WMI cpu details"
      # Get the processor details
      (Get-WmiObject Win32_Processor) | 
      %{$cpuName = $_.Name;
      $cpuCaption = $_.Caption;
      $cpuFamily = $_.Family; 
      $architecture = $_.Architecture; 
      $cpuMaxClockSpeed = $_.MaxClockSpeed;
      $clockSpeed = $_.CurrentClockSpeed; 
      $l2CacheSize = $_.L2CacheSize; 
      $l3CacheSize = $_.L3CacheSize };
      
      [Int32] $numProcessors = [System.Environment]::ProcessorCount
      
      Write-ScriptVerbose "Add row to cpu information"
      Add-StageCpuRow   $numProcessors $cpuName $cpuCaption $cpuFamily $architecture $cpuMaxClockSpeed $clockSpeed $l2CacheSize $l3CacheSize $instanceProcessorUsage $instanceCollectTime $computerIdleTime $computerCollectTime
      
      $global:cpuStageDataTable
   }
   # PS Catch
   trap [Exception]
   {
      Resolve-Error
      Write-ScriptError "Caught exception while collecting cpu properties.  A WMI query might have failed."
   }   
   
}

function Collect-VolumeData
{
   &{ # PS Try
      if( Get-IsWmiVolumeQueryAvailable )
      {
         # A null DriveLetter indicates that the volume is a mount point
         # Casting DriveLetter to [Boolean] results in False if it is null 
         Write-ScriptVerbose "Collecting volume information using Win32_Volume"
         (Get-Wmiobject Win32_Volume -filter "DriveType = 3") | 
         %{ Add-StageVolumeRow $_.DeviceId $_.Name $_.Capacity $_.FreeSpace }
      }
      else
      {
         # logical disk only collects disk information, not mount point information
         # hence passing in false as is_mount_point parameter
         Write-ScriptVerbose "Collecting volume information using Win32_LogicalDisk"
         (Get-Wmiobject Win32_LogicalDisk -filter "DriveType = 3") | 
         %{ Add-StageVolumeRow $_.DeviceId $_.Name $_.Size $_.FreeSpace }
      }
      
      $global:volumeStageDataTable
   }
   # PS Catch
   trap [Exception]
   {
      Resolve-Error
      Write-ScriptError "Caught exception while collecting volume properties.  A WMI query might have failed."
   }   
}

function Collect-SmoData
{
   
   &{ # PS try
      $sqlConnection = Get-Connection
      $serverConnection = New-Object Microsoft.SqlServer.Management.Common.ServerConnection $sqlConnection
      $server = New-Object Microsoft.SqlServer.Management.Smo.Server($serverConnection);
      
      # remove configurations from this table
      $objectsQuery = "SELECT object_type, sfc_query 
               FROM [msdb].[dbo].[sysutility_mi_smo_objects_to_collect_internal] AS sfc_queries";
      
      $sfcQueries = Get-SqlDataTable $objectsQuery | %{ $_.Rows }
      
      foreach ($sfcQueryRow in $sfcQueries)
      {
         [Int32] $object_type = $sfcQueryRow.object_type;
         $sfcQueryString = $sfcQueryRow.sfc_query.ToString();
   
         Write-ScriptVerbose "Retrieving list of properties to collect"
         $propertiesQuery = "SELECT property_name 
                        FROM [msdb].[dbo].[sysutility_mi_smo_properties_to_collect_internal] 
                        WHERE object_type ="+ $object_type.ToString();
         $properties = Get-SqlDataTable $propertiesQuery | %{ $_.Rows } | foreach { $_.property_name };
         
         Write-ScriptVerbose "Collecting smo information for sfc query $sfcQueryString"
         $oq = New-Object Microsoft.SqlServer.Management.Sdk.Sfc.SfcObjectQuery($server);
         $exp = New-Object Microsoft.SqlServer.Management.Sdk.Sfc.SfcQueryExpression($sfcQueryString);
         
         &{ # PS try
         
            # The following call is not itempotent.  The code does not run the same
            # in debug mode. If you are running in debug mode, any value display
            # invalidates the foreach statement.
            $en = $oq.ExecuteIterator($exp, $null, $null);   
            
            foreach($obj in $en)
            {
               $objUrn = $obj.Urn.ToString();
               Write-ScriptVerbose "Collecting smo information for urn $objUrn"
               
               # For each property get the value and insert it into the smo stage data table
               # the statment $obj.$_ retrieves the propety value from the object
               # going through the PS provider.  If the property is not found or throws an
               # exception from the SMO side, the PS provider wraps the property and returns
               # an empty value.
               $properties | 
               %{ 
                  if ($_ -eq "ProcessorUsage")
                  {
                      # for ProcessorUsage, we are in fact collecting the
                      # the data by ourselves in our own staging table.
                      # and we do not want to call SMO as this property
                      # may not exist on downlevel server.
                      # so here, we put a dummy value and later during upload
                      # we replace it with our real value.
                      # Note that we a similar situation for VolumeFreeSpace
                      # but the solution is different. For VolumeFreeSpace property
                      # it is not put in the sysutility_mi_smo_properties_to_collect_internal
                      # and we collect through other means and then do a join on the UCP
                      # side, versus for ProcessorUsage, we put the property in the list
                      # and during MI collection, we replace it with our own value.
                      # The difference is inconsistent and we should change them to behave
                      # the same in future releases.
                      Add-StageSmoRow $object_type $objUrn $_ [object]0
                  }
                  else
                  {
                      Add-StageSmoRow $object_type $objUrn $_ $obj.$_ 
                  }
                  
                  # if this property is FileName, we append volume/mount point info.
                  if($_ -eq "FileName")
                  {
                     Write-ScriptVerbose "Property is FileName, getting volume information"
                     [String] $mountPointName = Get-MountPointName $obj.FileName
                     Add-StageSmoRow $object_type $objUrn "mount_point_name" $mountPointName 
                     
                     [String] $deviceId = Get-DeviceIdFromMountPointName $mountPointName
                     Add-StageSmoRow $object_type $objUrn "volume_device_id" $deviceId
                  }
               }
               
               $psPath = Convert-UrnToPath $objUrn
               ("powershell_path", $psPath),
               ("parent_name", $obj.Parent.Name),              # If no Parent exists, Ps will return null
               ("grandparent_name", $obj.Parent.Parent.Name) | # If no Parent.Parent exists, Ps will return null
                  %{ ,
                     $propertyName = $_[0]                     
                     [String] $value = $_[1]    # Cast to string results in $null values becoming ""
                     if($value -ne "")
                     {
                        Add-StageSmoRow $object_type $objUrn $propertyName $value
                     }
                  }  
            }
         } # PS catch exception
         trap [Exception]
         {
            Resolve-Error
            Write-ScriptError "Caught exception while collecting smo properties."
         }   
      }
      $global:smoStageDataTable
   } # PS catch exception
   trap [Exception]
   {
      Resolve-Error
          Write-ScriptError "Caught exception while collecting smo properties."
   }   
}

###############################################################################
# Functions that mange the server tables by clearing and loading collected data 
###############################################################################
function Clear-AllStagedData
{
   # TRUNCATE TABLE removes all rows from a table without logging the 
   # individual row deletes.

   $cpuClearQuery = "TRUNCATE TABLE $global:cpuStageTableName; "
   $volumeClearQuery = "TRUNCATE TABLE $global:volumeStageTableName; "
   $smoClearQuery = "TRUNCATE TABLE $global:smoStageTableName; "
   
   Invoke-SubmitSqlCommandNonQuery "$cpuClearQuery $volumeClearQuery $smoClearQuery"
}

function Collect-AllStagedData
{

   Collect-CpuData | Out-Null
      
   # Should we collect cpu data again?
   # This will happen if the script is
   # run when there is no data yet in
   # the cpu staging table.
   if(Get-ShouldCollectCpu)
   {
      #Wait for some time to pass
      Write-ScriptVerbose "Waiting $sleepTimeoutSeconds seconds to collect cpu data."
      Start-Sleep -Seconds $sleepTimeoutSeconds
      #Collect the data again
      Collect-CpuData | Out-Null
   }
   
   Collect-SmoData | Out-Null
   Collect-VolumeData | Out-Null
}

function Save-AllStagedData
{
   Invoke-BulkCopyCommand $global:cpuStageDataTable
   Invoke-BulkCopyCommand $global:volumeStageDataTable
   Invoke-BulkCopyCommand $global:smoStageDataTable
}

function Invoke-StageData
{

   &{ # Try 
      
      Collect-AllStagedData
      
      Invoke-BeginTransaction
      
      Clear-AllStagedData
      Save-AllStagedData
      
      Invoke-CommitTransaction
      Remove-Connection
   }
   trap [Exception] # Catch
   {
      Write-ScriptWarning "Error occurred during execution of script."
      Write-ScriptWarning "Transaction will be rolled back."
      
      Resolve-Error
      
      Invoke-RollbackTransaction
      Remove-Connection
      
      # With ErrorActionPreference=Stop the following line will stop the script
      Write-ScriptError "Error.  Transaction was rolled back"
   }
}

if(Get-IsAgentStep)
{
   Invoke-StageData
}', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Upload to Utility Control Point]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Upload to Utility Control Point', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC [msdb].[dbo].[sp_sysutility_mi_upload]', 
		@database_name=N'msdb', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'sysutility_mi_collect_and_upload', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=15, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140918, 
		@active_end_date=99991231, 
		@active_start_time=500, 
		@active_end_time=400, 
		@schedule_uid=N'e2ca4fdd-33f4-4ba8-8c9a-da466ce1eb25'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Utility - Managed Instance]    Script Date: 11/20/2014 2:09:20 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Utility - Managed Instance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Utility - Managed Instance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'sysutility_mi_collect_performance', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Collect performance information', 
		@category_name=N'Utility - Managed Instance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Collect DAC execution statistics]    Script Date: 11/20/2014 2:09:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Collect DAC execution statistics', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC [msdb].[dbo].[sp_sysutility_mi_collect_dac_execution_statistics_internal]', 
		@database_name=N'msdb', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'sysutility_mi_collect_performance', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=2, 
		@freq_subday_interval=15, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140918, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'2bc2c377-f0c8-4962-9488-2ff7bf4d1b8f'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
EXEC msdb.dbo.sp_add_operator @name=N'DBA Group', 
		@enabled=1, 
		@weekday_pager_start_time=90000, 
		@weekday_pager_end_time=180000, 
		@saturday_pager_start_time=90000, 
		@saturday_pager_end_time=180000, 
		@sunday_pager_start_time=90000, 
		@sunday_pager_end_time=180000, 
		@pager_days=0, 
		@email_address=N'DL-KMHP_MSSQLDBAGroup@kmhp.com', 
		@category_name=N'[Uncategorized]'
GO
EXEC msdb.dbo.sp_add_operator @name=N'Jeff', 
		@enabled=1, 
		@weekday_pager_start_time=80000, 
		@weekday_pager_end_time=180000, 
		@saturday_pager_start_time=90000, 
		@saturday_pager_end_time=180000, 
		@sunday_pager_start_time=90000, 
		@sunday_pager_end_time=180000, 
		@pager_days=62, 
		@email_address=N'jshurak@amerihealthcaritas.com', 
		@category_name=N'[Uncategorized]'
GO
EXEC msdb.dbo.sp_add_proxy @proxy_name=N'CMS',@credential_name=N'CMS', 
		@enabled=1
GO
EXEC msdb.dbo.sp_grant_proxy_to_subsystem @proxy_name=N'CMS', @subsystem_id=3
GO
EXEC msdb.dbo.sp_add_proxy @proxy_name=N'UtilityAgentProxy_7A189120-ABCD-47D5-946B-C0E3B8A15C83',@credential_name=N'UtilityAgentProxyCredential_7A189120-ABCD-47D5-946B-C0E3B8A15C83', 
		@enabled=1
GO
EXEC msdb.dbo.sp_grant_proxy_to_subsystem @proxy_name=N'UtilityAgentProxy_7A189120-ABCD-47D5-946B-C0E3B8A15C83', @subsystem_id=3
GO
EXEC msdb.dbo.sp_grant_login_to_proxy @proxy_name=N'UtilityAgentProxy_7A189120-ABCD-47D5-946B-C0E3B8A15C83', @msdb_role=N'dc_admin'
GO
EXEC master.dbo.sp_addlinkedserver @server = N'RPT_REG_1', @srvproduct=N'Sybase', @provider=N'MSDASQL', @provstr=N'DSN=RPT_REG_1', @catalog=N'FACETS'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'RPT_REG_1',@useself=N'False',@locallogin=NULL,@rmtuser=N'mssqlproduser',@rmtpassword='########'

GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'collation compatible', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'rpc', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'rpc out', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'use remote collation', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO
EXEC master.dbo.sp_addlinkedserver @server = N'RPT_REG_2', @srvproduct=N'Sybase', @provider=N'MSDASQL', @provstr=N'DSN=RPT_REG_2', @catalog=N'FACETS'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'RPT_REG_2',@useself=N'False',@locallogin=NULL,@rmtuser=N'mssqlproduser',@rmtpassword='########'

GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'collation compatible', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'rpc', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'rpc out', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'use remote collation', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO
EXEC master.dbo.sp_addlinkedserver @server = N'RPT_REG_3', @srvproduct=N'Sybase', @provider=N'MSDASQL', @provstr=N'DSN=RPT_REG_3', @catalog=N'FACETS'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'RPT_REG_3',@useself=N'False',@locallogin=NULL,@rmtuser=N'mssqlproduser',@rmtpassword='########'

GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'collation compatible', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'rpc', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'rpc out', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'use remote collation', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO
EXEC master.dbo.sp_addlinkedserver @server = N'RPT_REG_4', @srvproduct=N'Sybase', @provider=N'MSDASQL', @provstr=N'DSN=RPT_REG_4', @catalog=N'FACETS'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'RPT_REG_4',@useself=N'False',@locallogin=NULL,@rmtuser=N'mssqlproduser',@rmtpassword='########'

GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'collation compatible', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'rpc', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'rpc out', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'use remote collation', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO
EXEC master.dbo.sp_addlinkedserver @server = N'RPT_REG_5', @srvproduct=N'Sybase', @provider=N'MSDASQL', @provstr=N'DSN=RPT_REG_5', @catalog=N'FACETS'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'RPT_REG_5',@useself=N'False',@locallogin=NULL,@rmtuser=N'mssqlproduser',@rmtpassword='########'

GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'collation compatible', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'rpc', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'rpc out', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'use remote collation', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO
EXEC master.dbo.sp_addlinkedserver @server = N'RPT_REG_6', @srvproduct=N'Sybase', @provider=N'MSDASQL', @provstr=N'DSN=RPT_REG_6', @catalog=N'FACETS'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'RPT_REG_6',@useself=N'False',@locallogin=NULL,@rmtuser=N'mssqlproduser',@rmtpassword='########'

GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'collation compatible', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'rpc', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'rpc out', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'use remote collation', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Error Number 823', 
		@message_id=823, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Error Number 824', 
		@message_id=824, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Error Number 825', 
		@message_id=825, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Log shipping Primary Server Alert.', 
		@message_id=14420, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=0, 
		@include_event_description_in=5, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Log shipping Secondary Server Alert.', 
		@message_id=14421, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=0, 
		@include_event_description_in=5, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 016', 
		@message_id=0, 
		@severity=16, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 017', 
		@message_id=0, 
		@severity=17, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 018', 
		@message_id=0, 
		@severity=18, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 019', 
		@message_id=0, 
		@severity=19, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 020', 
		@message_id=0, 
		@severity=20, 
		@enabled=0, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 021', 
		@message_id=0, 
		@severity=21, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 022', 
		@message_id=0, 
		@severity=22, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 023', 
		@message_id=0, 
		@severity=23, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 024', 
		@message_id=0, 
		@severity=24, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'Severity 025', 
		@message_id=0, 
		@severity=25, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:30:18 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Backup Configuration', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Backup Config]    Script Date: 11/20/2014 2:30:18 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Backup Config', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'set nocount on
go
select ''exec sp_CONFIGURE ''''show advanced options'''', 1'' + char(13) + char(10) + '' go'' + char(13) + char(10) + '' reconfigure'' 
go
select ''exec sp_configure '''''' + name + '''''', '' + cast(value_in_use as nvarchar(10))
	+ char(13) + char(10) + ''go'' 
	from sys.configurations
	where name<>''show advanced options''
go
select ''reconfigure''
', 
		@database_name=N'master', 
		@output_file_name=N'G:\Backup\Config.txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily 5am', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20111029, 
		@active_end_date=99991231, 
		@active_start_time=50000, 
		@active_end_time=235959, 
		@schedule_uid=N'cdfd706f-c436-4984-a8e7-37b695469264'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:30:18 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Backup Databases.Subplan_1', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Subplan_1]    Script Date: 11/20/2014 2:30:18 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Subplan_1', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/Server "$(ESCAPE_NONE(SRVR))" /SQL "Maintenance Plans\Backup Databases" /set "\Package\Subplan_1.Disable;false"', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily Backup', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140128, 
		@active_end_date=99991231, 
		@active_start_time=20000, 
		@active_end_time=235959, 
		@schedule_uid=N'6dc237ca-c47d-4f41-ab48-3e9a2f67d0bd'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:30:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Backup Logins', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Backup Logins]    Script Date: 11/20/2014 2:30:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Backup Logins', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec sp_help_revlogin', 
		@database_name=N'master', 
		@output_file_name=N'G:\Backup\Logins.txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily 5am', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20111029, 
		@active_end_date=99991231, 
		@active_start_time=50000, 
		@active_end_time=235959, 
		@schedule_uid=N'3983d526-4966-486e-ba0b-acfba345a339'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:30:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Backup Transaction Log.Subplan_1', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Subplan_1]    Script Date: 11/20/2014 2:30:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Subplan_1', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/Server "$(ESCAPE_NONE(SRVR))" /SQL "Maintenance Plans\Backup Transaction Log" /set "\Package\Subplan_1.Disable;false"', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:30:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Capture DB Statistics', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Collect Server Information]    Script Date: 11/20/2014 2:30:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Collect Server Information', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'Use Data_Collection
go
drop table SQL_Server_Info_Old
go
sp_rename ''SQL_Server_Info'',''SQL_Server_Info_Old''
go
create table #Drive (DriveLetter varchar(25))
insert into #Drive (DriveLetter) select distinct LEFT(physical_name,2) FROM sys.master_files as MF inner join sys.databases as DB on MF.database_id = DB.database_id
declare @tmp varchar(250)
SET @tmp = ''''
select @tmp = @tmp + DriveLetter + '', '' from #Drive
--select @tmp
create table #Drive2 (DriveLetter varchar(25))
insert into #Drive2 (DriveLetter) SELECT Distinct left(physical_device_name,2) FROM msdb.dbo.backupmediafamily
declare @tmp2 varchar(250)
SET @tmp2 = ''''
select @tmp2 = @tmp2 + DriveLetter + '', '' from #Drive2
--select @tmp2
SELECT 
''1 - Server'' as [Type],
SERVERPROPERTY(''ServerName'') as Instance,
SERVERPROPERTY(''ComputerNamePhysicalNetBIOS'') as [Host/DB Name],
SERVERPROPERTY(''Edition'') as [Edition/Compatibility Level], /*shows 32 bit or 64 bit*/
SERVERPROPERTY(''ProductLevel'') as [Product/Recover], /* RTM or SP1 etc*/
Case SERVERPROPERTY(''IsClustered'') when 1 then ''CLUSTERED'' else ''STANDALONE'' end as [Type/Max Size],
SERVERPROPERTY(''ComputerNamePhysicalNetBIOS'') as [Servers/Size],
(select cast(cpu_count as nvarchar(10))+'' core / ''+cast(cpu_count/hyperthread_ratio as nvarchar(10))+'' procs'' as MB from sys.dm_os_sys_info) as [CPU/Growth],
(select physical_memory_kb/1024 from sys.dm_os_sys_info) as MB,
(select SUBSTRING(@tmp, 0, LEN(@tmp)))+'', Backup ''+(select SUBSTRING(@tmp2, 0, LEN(@tmp2))) as Drives,
@@VERSION as [Version Info]
Into SQL_Server_Info
Drop table #Drive
Drop table #Drive2
--go
--select * from SQL_Server_Info
----union all 
----select * from SQL_Server_Info_Old
--go
----Drop Table SQL_Server_Changes
--Insert Into SQL_Server_Changes
--select getdate() as [Date], 
--cast(New.Instance as varchar(100)) as Instance, 
--cast(New.[CPU/Growth] as varchar(100)) as CPU, 
--cast(Old.[CPU/Growth] as varchar(100)) as [Old_CPU], 
--cast(New.MB as varchar(100)) as MB, 
--cast(Old.MB as varchar(100)) as Old_MB,
--cast(New.[Product/Recover] as varchar(100)) as Product, 
--cast(Old.[Product/Recover] as varchar(100)) as [Old_Product],
--cast(New.Drives as varchar(100)) as Drives, 
--cast(Old.Drives as varchar(100)) as Old_Drives
----Into SQL_Server_Changes
--from SQL_Server_Info as New inner join SQL_Server_Info_Old as Old on New.Instance = Old.Instance
--where (Old.[CPU/Growth] <> New.[CPU/Growth] 
--or Old.Drives <> New.Drives 
--or Old.[Product/Recover] <> New.[Product/Recover]
--or Old.MB <> New.MB) and New.Instance <> ''tempdb''
--go
----select * from SQL_Server_Changes', 
		@database_name=N'DATA_COLLECTION', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Collect DB Information]    Script Date: 11/20/2014 2:30:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Collect DB Information', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'Use Data_Collection
go
drop table SQL_DB_Info_Old
go
sp_rename ''SQL_DB_Info'',''SQL_DB_Info_Old''
go
SELECT 
''2 - Database'' as [Type],
SERVERPROPERTY(''ServerName'') as Instance,
db_name(MF.database_id) as Name,
compatibility_level,
recovery_model_desc,
cast((max_size)/128 as varchar(50)) as [Max_Size],
cast((size)/128 as varchar(50)) as [Size],
cast((growth)/128 as varchar(50)) as [Growth],
Case when physical_name like ''%.mdf'' or physical_name like ''%.ndf'' then ''DATA'' else ''LOG'' end As [File_Type],
LEFT(physical_name,2) as Drive, 
[FILE_ID],
Case when DB.is_read_only = 1 then ''Read Only'' else ''Read\Write'' end as DB_Status
--,physical_name
--,*
into SQL_DB_Info
FROM sys.master_files as MF inner join sys.databases as DB on MF.database_id = DB.database_id
go
select * from SQL_DB_Info
--union all 
--select * from SQL_DB_Info_Old
go
--Insert Into SQL_DB_Changes
select getdate() as [Date], 
cast(New.Instance as varchar(100)) as Instance,
cast(New.Name as varchar(100)) as Name, 
cast(New.Max_Size as varchar(100)) as Max_Size, 
cast(Old.Max_Size as varchar(100)) as Old_Max_Size, 
cast(New.Size as varchar(100)) as Size, 
cast(Old.Size as varchar(100)) as Old_Size,
New.[File_Type],
New.[File_ID]
--, *
--Into SQL_DB_Changes
from SQL_DB_Info as New full outer join SQL_DB_Info_Old as Old on New.Name = Old.Name and Old.[File_Type] = New.[File_Type] and New.[File_ID] = Old.[File_ID]
where (Old.Max_Size <> New.Max_Size or Old.Size <> New.Size) and 
New.Name <> ''tempdb''
and New.Name <> ''master''
and New.Name <> ''model''
and New.Name <> ''tempdb''
and New.Name <> ''msdb''
--and New.[File_Type] <> ''LOG''
go
--Insert Into SQL_DB_Changes
select getdate() as [Date], 
cast(New.Instance as varchar(100)) as Instance,
cast(New.Name as varchar(100)) as Name, 
cast(New.Max_Size as varchar(100)) as Max_Size, 
cast(0 as varchar(100)) as Old_Max_Size, 
cast(New.Size as varchar(100)) as Size, 
cast(0 as varchar(100)) as Old_Size,
New.[File_Type],
New.[File_ID]
from SQL_DB_Info as New full outer join SQL_DB_Info_Old as Old 
on New.Name = Old.Name and Old.[Type] = New.[Type] and New.[File_ID] = Old.[File_ID]
where New.Name <> ''tempdb''
and New.Name <> ''master''
and New.Name <> ''model''
and New.Name <> ''tempdb''
and New.Name <> ''msdb''
--and New.[File_Type] <> ''LOG''
and New.Name not in (select Name from SQL_DB_Changes)
go
--select * from SQL_DB_Changes
--delete from SQL_DB_Changes where [DATE] > ''2012-11-26 17:29:13.000''
--select * from SQL_DB_Changes order by name, date', 
		@database_name=N'DATA_COLLECTION', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Capture DB Statistics', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20121113, 
		@active_end_date=99991231, 
		@active_start_time=30000, 
		@active_end_time=235959, 
		@schedule_uid=N'50da2b81-ce8f-4c5b-9b6f-00724fa5533d'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:30:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Check Blocked Processes', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Check Blocked Processes]    Script Date: 11/20/2014 2:30:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Check Blocked Processes', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'USE DATA_COLLECTION 
go 

declare @data_count int 
declare @date_captured datetime
declare @duration_minutes int = 5
declare @default_days int = 30
DECLARE @email_body VarChar(2000)
DECLARE @profile_name varchar(2000) = N''MS SQL Mail''
DECLARE @recipients varchar(2000) = ''DL-KMHP_MSSQLDBAGroup@kmhp.com''
DECLARE @subject varchar(2000)
DECLARE @retention datetime

-- capture current date and time
set @date_captured = GETDATE()

-- insert data into table
INSERT INTO BLOCKED_PROCESSES
	( session_id,
      host_name,
      login_name,
      start_time,
      totalReads,
      totalWrites,
      totalCPU,
      writes_in_tempdb,
      sql_text,
      blocking_session_id,
      blocking_text,
      date_captured)
SELECT  x.session_id,
        x.host_name,
        x.login_name,
        x.start_time,
        x.totalReads,
        x.totalWrites,
        x.totalCPU,
        x.writes_in_tempdb,
    (
            -- Query gets XML text for the sql query for the session_id
            SELECT      text AS [text()]
            FROM  sys.dm_exec_sql_text(x.sql_handle)
            FOR XML PATH(''''), TYPE

    )AS sql_text,
     COALESCE(x.blocking_session_id, 0) AS blocking_session_id,
    (
        SELECT p.text
        FROM
        (
            -- Query gets the corresponding sql_handle info to find the XML text in the next query
            SELECT MIN(sql_handle) AS sql_handle
            FROM sys.dm_exec_requests r2
            WHERE r2.session_id = x.blocking_session_id
        ) AS r_blocking
        CROSS APPLY
        (
            -- Query will pull back the XML text for a blocking session if there is any from the sql_haldle
            SELECT text AS [text()]
            FROM sys.dm_exec_sql_text(r_blocking.sql_handle)
            FOR XML PATH(''''), TYPE
        ) p (text)
    ) AS blocking_text,
    @date_captured as date_captured
FROM
(
-- Query returns active session_id and metadata about the session for resource, blocking, and sql_handle
    SELECT  r.session_id,
            s.host_name,
            s.login_name,
            r.start_time,
            r.sql_handle,
            r.blocking_session_id,
            SUM(r.reads) AS totalReads,
            SUM(r.writes) AS totalWrites,
            SUM(r.cpu_time) AS totalCPU,
            SUM(tsu.user_objects_alloc_page_count + tsu.internal_objects_alloc_page_count) AS writes_in_tempdb
    FROM    sys.dm_exec_requests r
    JOIN    sys.dm_exec_sessions s ON s.session_id = r.session_id
    JOIN    sys.dm_db_task_space_usage tsu ON s.session_id = tsu.session_id and r.request_id = tsu.request_id
    WHERE   r.status IN (''running'', ''runnable'', ''suspended'')
      and r.blocking_session_id <> 0
    GROUP BY    r.session_id,
                s.host_name,
                s.login_name,
                r.start_time,
                r.sql_handle,
                r.blocking_session_id
) x

-- delete data where the duration
-- is less than 5 minutes or have
-- logged for 30 days or more

delete from BLOCKED_PROCESSES
where duration_minutes < @duration_minutes or 
	  DATEDIFF(D,start_time,duration_minutes) >= @default_days


set @retention = (GETDATE() - 30)
delete from DATA_COLLECTION..BLOCKED_PROCESSES where date_captured < @retention

select @data_count = COUNT(*)
from BLOCKED_PROCESSES
where date_captured=@date_captured

if @data_count > 0 
	begin
		set @subject = N''Blocked processes were found on '' + convert(nvarchar(20),@date_captured,100)

		set @email_body = N''Number of blocked processes found:  '' + CAST(@data_count as nvarchar(10)) + CHAR(13) + N''Duration time:  >=  '' + cast(@duration_minutes as nvarchar(5)) + 
					'' minute(s)'' + char(13) + char(13) + ''***Run the sp_CURRENT_BLOCKED_PROCESSES stored procedure to view the most recent blocked processes.''
				
		EXEC msdb.dbo.sp_send_dbmail
			@profile_name = @profile_name,
			@recipients = @recipients,
			@subject = @subject,
			@body = @email_body	
	end', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Every 10 mins', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=10, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20111029, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'6bcde8e0-e018-4487-8063-372ca14c4153'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:30:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Check DB Integrity.Subplan_1', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Subplan_1]    Script Date: 11/20/2014 2:30:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Subplan_1', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/Server "$(ESCAPE_NONE(SRVR))" /SQL "Maintenance Plans\Check DB Integrity" /set "\Package\Subplan_1.Disable;false"', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Check DB Integrity.Subplan_1', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20140128, 
		@active_end_date=99991231, 
		@active_start_time=180000, 
		@active_end_time=235959, 
		@schedule_uid=N'418ba5c4-f87a-4608-a5ce-33e8c6a5e89a'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:30:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Check DB Space', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Check DB Space]    Script Date: 11/20/2014 2:30:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Check DB Space', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'/*  Script to check the database space on all databases on the server except system databases.
  There is no input parameters
  Author - Derrick Williams
  Date - 6/9/2011
*/

--Checks to ensure that the temp table is not there, if so it deletes it.
IF ((SELECT OBJECT_ID(''tempdb..#DB_SPACE_CHECK'')) IS NOT NULL)
BEGIN
     DROP TABLE #DB_SPACE_CHECK
END

--Checks to ensure that the temp table is not there, if so it deletes it.
IF ((SELECT OBJECT_ID(''tempdb..#DB_SPACE_CHECK2'')) IS NOT NULL)
BEGIN
     DROP TABLE #DB_SPACE_CHECK2
END

IF ((SELECT OBJECT_ID(''tempdb..#TEST_SYSMAIL_PROFILES'')) IS NOT NULL)
	BEGIN
		DROP TABLE #TEST_SYSMAIL_PROFILES;
	END

--Builds the server names - database names - and free space and inserts into the temp table
select 
	@@servername as ServerName,
	DB_NAME(database_id) AS DatabaseName, 
	CAST([Name] AS varchar(20)) AS NameofFile,
	CAST(physical_name AS varchar(100)) AS PhysicalFile,
	type_desc AS FileType,
	((size * 8)/1024) AS FileSize,
	MaxFileSize = 
	CASE WHEN max_size = -1 OR max_size = 268435456 THEN ''UNLIMITED''
		WHEN max_size = 0 THEN ''NO_GROWTH'' 
		WHEN max_size <> -1 OR max_size <> 0 THEN CAST(((max_size * 8) / 1024) AS varchar(15))
		ELSE ''Unknown''
	END,
	SpaceRemainingMB = 
	CASE WHEN max_size = -1 OR max_size = 268435456 THEN ''UNLIMITED''
		WHEN max_size <> -1 OR max_size = 268435456 THEN CAST((((max_size - size) * 8) / 1024) AS varchar(10))
		ELSE ''Unknown''
	END,
	Growth = 
		CASE WHEN growth = 0 THEN ''FIXED_SIZE''
		WHEN growth > 0 THEN ((growth * 8)/1024)
		ELSE ''Unknown''
	END,
	GrowthType = 
		CASE WHEN is_percent_growth = 1 THEN ''PERCENTAGE''
		WHEN is_percent_growth = 0 THEN ''MBs''
		ELSE ''Unknown''
	END
into #DB_SPACE_CHECK FROM master.sys.master_files
WHERE state = 0 AND 
	  type_desc IN (''LOG'', ''ROWS'')
ORDER BY database_id, 
		 file_id

-- create temp table to store email profiles
CREATE TABLE #TEST_SYSMAIL_PROFILES
	(principal_id int,
	 principal_name varchar(200),
	 profile_id int,
	 profile_name varchar(200),
	 is_default bit)

-- insert email profiles into temp table
insert into #TEST_SYSMAIL_PROFILES
EXECUTE msdb.dbo.sysmail_help_principalprofile_sp;

-- Variable Declaration
DECLARE @unlimited_count int
DECLARE @server_name VarChar(2000)
DECLARE @database_name VarChar(2000)
DECLARE @space_remaining VarChar(2000)
DECLARE @file_type VarChar(2000)
DECLARE @email_body VarChar(2000)
DECLARE @profile_name varchar(2000) 
DECLARE @recipients varchar(2000) 
DECLARE @subject varchar(2000)

-- retrieve email profile
SELECT TOP 1 @profile_name = profile_name
FROM #TEST_SYSMAIL_PROFILES

-- count number of "UNLIMITED" databases
select @unlimited_count = COUNT(*) 
from #DB_SPACE_CHECK
where (MaxFileSize = ''UNLIMITED'' OR SpaceRemainingMB = ''UNLIMITED'') AND 
	  DatabaseName NOT IN (''master'',''model'',''msdb'',''ReportServer'',''ReportServerTempDB'') AND
	  DatabaseName NOT LIKE ''wslogdb70%''

-- set default variables for email
SET @recipients = ''DL-KMHP_MSSQLDBAGroup@kmhp.com''

IF @unlimited_count = 0 -- indicates there are no databases listed as ''UNLIMITED'' therefore process normally
	BEGIN		

		-- calculate the percent used from #DB_SPACE_CHECK temp table
		-- and store into #DB_SPACE_CHECK2 temp table
		select * , 
			   CAST(((CAST(MaxFileSize as decimal(18,4))-CAST(SpaceRemainingMB as decimal(18,4)))/CAST(MaxFileSize as decimal(18,4))) as decimal(18,4)) as PercentUsed
		into #DB_SPACE_CHECK2 
		from #DB_SPACE_CHECK
		where DatabaseName NOT IN (''master'',''model'',''msdb'',''ReportServer'',''ReportServerTempDB'') AND
			  DatabaseName NOT LIKE ''wslogdb70%''

		-- build cursor for #DB_SPACE_CHECK2 temp table
		DECLARE limited_db_cursor CURSOR FOR
			SELECT ServerName,
				   DatabaseName,
				   SpaceRemainingMB,
				   FileType 
			FROM #DB_SPACE_CHECK2 
			where DatabaseName not in (''master'',''model'',''msdb'',''ReportServer'',''ReportServerTempDB'') AND
				  ((FileType = N''ROWS'' AND PercentUsed >= 0.9700) OR 
				  (FileType = N''LOG'' AND PercentUsed >= 0.9000))
		
		OPEN limited_db_cursor
		FETCH NEXT FROM limited_db_cursor
		INTO @server_name, @database_name, @space_remaining, @file_type

		-- Check @@FETCH_STATUS to see if there are any more rows to fetch.
		WHILE @@FETCH_STATUS = 0
		BEGIN
			-- set the subject line to include the server name
			SET @subject = @server_name + '' Space Alert'' 

			-- define the body of the email
            select @email_body = ''Server Name:  '' + @server_name + CHAR(10) +
							     ''Database Name:  '' + @database_name + CHAR(10) +
							     ''Current MB Free:  '' + @space_remaining + CHAR(10) +
							     ''File Type:  '' + @file_type

			-- only send email if the file type is ROWS or LOG
            if (@file_type = ''ROWS'' OR @file_type = ''LOG'')          
			    EXEC msdb.dbo.sp_send_dbmail
                @profile_name = @profile_name,
                @recipients = @recipients,
                @subject = @subject,
                @body = @email_body
		    else
				print ''no criteria match''

            FETCH NEXT FROM limited_db_cursor
            INTO @server_name, @database_name, @space_remaining, @file_type
		END
		
		--close and deallocate the cursor
		close limited_db_cursor
		deallocate limited_db_cursor
	END

ELSE -- indicates some databases are listed as ''UNLIMITED'' so therefore alert DBAs to fix the issue
	BEGIN

		-- build cursor for #DB_SPACE_CHECK temp table
		DECLARE unlimited_db_cursor CURSOR FOR
			SELECT ServerName,
				   DatabaseName,
				   SpaceRemainingMB,
				   FileType 
			FROM #DB_SPACE_CHECK 
			where (MaxFileSize = ''UNLIMITED'' OR SpaceRemainingMB = ''UNLIMITED'') AND 
				  DatabaseName NOT IN (''master'',''model'',''msdb'',''ReportServer'',''ReportServerTempDB'') AND
				  DatabaseName NOT LIKE ''wslogdb70%''
		
		OPEN unlimited_db_cursor
		FETCH NEXT FROM unlimited_db_cursor
		INTO @server_name, @database_name, @space_remaining, @file_type

		-- Check @@FETCH_STATUS to see if there are any more rows to fetch.
		WHILE @@FETCH_STATUS = 0
		BEGIN
			
			-- set the subject line
			SET @subject = @database_name + '' on '' + @server_name + '' is listed as Unlimited''

			-- define the body of the email
            select @email_body = ''Server Name:  '' + @server_name + CHAR(10) +
							     ''Database Name:  '' + @database_name + CHAR(10) +
							     ''Current MB Free:  '' + @space_remaining + CHAR(10) +
							     ''File Type:  '' + @file_type

            if (@file_type = ''ROWS'' OR @file_type = ''LOG'')          
			    EXEC msdb.dbo.sp_send_dbmail
                @profile_name = @profile_name,
                @recipients = @recipients,
                @subject = @subject,
                @body = @email_body
		    else
				print ''no criteria match''

            FETCH NEXT FROM unlimited_db_cursor
            INTO @server_name, @database_name, @space_remaining, @file_type
		END
		
		--close and deallocate the cursor
		close unlimited_db_cursor
		deallocate unlimited_db_cursor
	END
go
', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Every 15 Minutes', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=15, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140212, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'6e72d0bd-71eb-4b19-bf9b-c99b8b1099f7'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:30:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Check Disk Space', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Check Disk Space]    Script Date: 11/20/2014 2:30:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Check Disk Space', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'use master
go

-- set configuration for OLE automation
-- (will be used with the file system object)
EXEC sp_configure ''Ole Automation Procedures'', 1
GO 

-- commit reconfiguration
RECONFIGURE
GO

IF OBJECT_ID(''tempdb..#TEST_SYSMAIL_PROFILES'') IS NOT NULL
	BEGIN
		DROP TABLE #TEST_SYSMAIL_PROFILES;
	END

-- create temp table to store email profiles
CREATE TABLE #TEST_SYSMAIL_PROFILES
	(principal_id int,
	 principal_name varchar(200),
	 profile_id int,
	 profile_name varchar(200),
	 is_default bit)
	 
-- insert email profiles into temp table
insert into #TEST_SYSMAIL_PROFILES
EXECUTE msdb.dbo.sysmail_help_principalprofile_sp;	
	
-- removes temp table if it exists
IF OBJECT_ID(''tempdb..#drives'') IS NOT NULL 
	BEGIN
		DROP TABLE #drives
	END
	
/*
   Displays the free space,free space percentage 
   plus total drive size for a server
*/
SET NOCOUNT ON

DECLARE @hr int
DECLARE @fso int
DECLARE @drive char(1)
DECLARE @odrive int
DECLARE @TotalSize varchar(20)
DECLARE @MB bigint ; SET @MB = 1048576

DECLARE @profile_name varchar(2000) 

-- retrieve email profile
SELECT TOP 1 @profile_name = profile_name
FROM #TEST_SYSMAIL_PROFILES

-- create temp table
CREATE TABLE #drives (drive char(1) PRIMARY KEY,
                      FreeSpace int NULL,
                      TotalSize int NULL)

-- insert drive information into temp table
INSERT #drives(drive,FreeSpace) 
EXEC master.dbo.xp_fixeddrives

-- initialize file system object
EXEC @hr=sp_OACreate ''Scripting.FileSystemObject'',@fso OUT
IF @hr <> 0 EXEC sp_OAGetErrorInfo @fso

-- declare cursor to retrieve drives from
-- the temp table
DECLARE dcur CURSOR LOCAL FAST_FORWARD
FOR SELECT drive from #drives
ORDER by drive

OPEN dcur

FETCH NEXT FROM dcur INTO @drive

-- process data from temp table
WHILE @@FETCH_STATUS=0
BEGIN
		-- use the GetDrive method from the file system object to
		-- set the @odrive variable to the drive in the cursor
        EXEC @hr = sp_OAMethod @fso,''GetDrive'', @odrive OUT, @drive
        IF @hr <> 0 EXEC sp_OAGetErrorInfo @fso
        
        -- retrieve total size of drive
        EXEC @hr = sp_OAGetProperty @odrive,''TotalSize'', @TotalSize OUT
        IF @hr <> 0 EXEC sp_OAGetErrorInfo @odrive
		
		-- update the temp table with the
		-- total size of the drive
        UPDATE #drives
        SET TotalSize=@TotalSize/@MB
        WHERE drive=@drive
        
        FETCH NEXT FROM dcur INTO @drive
END

CLOSE dcur
DEALLOCATE dcur

-- close the file system object
EXEC @hr=sp_OADestroy @fso
IF @hr <> 0 EXEC sp_OAGetErrorInfo @fso

DECLARE @drive_location varchar(50)
DECLARE @total_disk_size int
DECLARE @space_used int
DECLARE @space_available int
DECLARE @percent_used varchar(50)
DECLARE @percent_available varchar(50)
DECLARE @email_body varchar(max)
DECLARE @recipients varchar(2000) 
DECLARE @subject varchar(2000)
DECLARE @fields varchar(2000)

SET @recipients = ''DL-KMHP_MSSQLDBAGroup@kmhp.com'' -- distribution list
SET @subject = ''SERVER DRIVE SPACE ALERT  FOR '' + @@SERVERNAME -- email subject line

-- declare cursor to retrieve data
DECLARE DRIVE_SPACE_CURSOR CURSOR FOR 
	SELECT drive AS DRIVE_LOCATION,
		   TotalSize as TOTAL_DISK_SIZE_MB,
		   TotalSize-FreeSpace AS SPACE_USED_MB,
		   FreeSpace as SPACE_AVAILABLE_MB,
		   CAST(CAST(CAST((CAST(TotalSize as decimal(18,4))-CAST(FreeSpace as decimal(18,4)))/TotalSize as decimal(18,4))*100 as decimal(18,2)) as varchar(10)) + ''%'' AS PERCENT_USED,
		   CAST(CAST(CAST((CAST(FreeSpace as decimal(18,4)))/TotalSize as decimal(18,4))*100 as decimal(18,2)) as varchar(10)) + ''%'' AS PERCENT_AVAILABLE
	FROM #drives
	WHERE CAST(CAST(FreeSpace as decimal(18,4))/CAST(TotalSize as decimal(18,4)) as decimal(18,4)) <= 0.0300
	ORDER BY drive
	
SET @email_body = NULL -- set email body to null initially

OPEN DRIVE_SPACE_CURSOR

FETCH NEXT FROM DRIVE_SPACE_CURSOR INTO @drive_location,
										@total_disk_size,
										@space_used,
										@space_available,
										@percent_used,
										@percent_available

-- process records from the cursor
WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @email_body IS NULL 
			BEGIN -- make initial email body
				SET @email_body = ''Drive Letter:  '' + @drive_location + CHAR(13) +
								  ''Total Disk Size (MB):  '' + CAST(@total_disk_size as varchar(100)) + CHAR(13) + 
								  ''Space Used (MB):  '' + CAST(@space_used as varchar(100)) + CHAR(13) + 
								  ''Space Available (MB):  '' + CAST(@space_available as varchar(100)) + CHAR(13) + 
								  ''Percent Used:  '' + @percent_used + CHAR(13) + 
								  ''Percent Available:  '' + @percent_available + CHAR(13) + CHAR(13)
			END
		ELSE
			BEGIN -- append email body to the previous one
				SET @email_body = @email_body + ''Drive Letter:  '' + @drive_location + CHAR(13) +
								  ''Total Disk Size (MB):  '' + CAST(@total_disk_size as varchar(100)) + CHAR(13) + 
								  ''Space Used (MB):  '' + CAST(@space_used as varchar(100)) + CHAR(13) + 
								  ''Space Available (MB):  '' + CAST(@space_available as varchar(100)) + CHAR(13) + 
								  ''Percent Used:  '' + @percent_used + CHAR(13) + 
								  ''Percent Available:  '' + @percent_available + CHAR(13) + CHAR(13)			
			END
						  
		FETCH NEXT FROM DRIVE_SPACE_CURSOR INTO @drive_location,
												@total_disk_size,
												@space_used,
												@space_available,
												@percent_used,
												@percent_available
	END


CLOSE DRIVE_SPACE_CURSOR
DEALLOCATE DRIVE_SPACE_CURSOR

-- send email if the body is not null
IF @email_body IS NOT NULL
	BEGIN
		EXEC msdb.dbo.sp_send_dbmail
			@profile_name = @profile_name,
			@recipients = @recipients,
			@subject = @subject,
			@body = @email_body
	END
go


', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily 30mins', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=24, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20111029, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'e0b685bc-d045-47b1-94c9-dd3ab2625179'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:30:19 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Check Server Status', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Check Server Status]    Script Date: 11/20/2014 2:30:19 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Check Server Status', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'USE master 
go 
--IF OBJECT_ID(''serverstartup'') IS NOT NULL 
--	BEGIN
--		DROP PROC serverstartup;
--	END

--GO
	
--CREATE PROC serverstartup
--AS

SET NOCOUNT ON

-- remove the ##sqlservice temp table if it exists
IF EXISTS(SELECT 1 FROM tempdb..sysobjects where name =''##sqlservice'')
	DROP TABLE ##sqlservice

-- create a new ##sqlservice temp table
CREATE TABLE ##sqlservice (details VARCHAR(100))

-- remove the ##agentservice temp table if it exists
IF EXISTS(SELECT 1 FROM tempdb..sysobjects where name =''##agentservice'')
	DROP TABLE ##agentservice

-- create a new ##agentservice temp table
CREATE TABLE ##agentservice (details VARCHAR(100))

-- remove the #TEST_SYSMAIL_PROFILES temp table if it exists
IF OBJECT_ID(''tempdb..#TEST_SYSMAIL_PROFILES'') IS NOT NULL
	BEGIN
		DROP TABLE #TEST_SYSMAIL_PROFILES;
	END
	
-- create temp table to store email profiles
CREATE TABLE #TEST_SYSMAIL_PROFILES
	(principal_id int,
	 principal_name varchar(200),
	 profile_id int,
	 profile_name varchar(200),
	 is_default bit)
	
DECLARE @sname VARCHAR(100), @starttime VARCHAR(30)
DECLARE @authmode VARCHAR(25), @subject VARCHAR(250)
DECLARE @insname VARCHAR(50),@agentname VARCHAR(50)
DECLARE @sqlstatus VARCHAR(100), @agentstatus VARCHAR(100)
DECLARE @dbstatus VARCHAR(100), @dbdetail VARCHAR(2000)
DECLARE @sctsql VARCHAR(200), @HTML VARCHAR(8000)
DECLARE @recipients varchar(200)

DECLARE @profile_name varchar(2000) 

	 
-- insert email profiles into temp table
insert into #TEST_SYSMAIL_PROFILES
EXECUTE msdb.dbo.sysmail_help_principalprofile_sp;

-- retrieve email profile
SELECT TOP 1 @profile_name = profile_name
FROM #TEST_SYSMAIL_PROFILES

SET @recipients = ''DL-KMHP_MSSQLDBAGroup@kmhp.com'' -- add distribution list(s) here

-- retrieve the server name, authentication mode
-- and start time
SELECT @sname = @@SERVERNAME
SELECT @authmode=case SERVERPROPERTY(''IsIntegratedSecurityOnly'') when 1 then ''Windows'' else ''Mixed'' end 
SELECT @starttime=CONVERT(VARCHAR(30),create_date,109) from sys.databases where database_id=2

-- retrieve the service names (MS SQL Server and MS SQL Server Agent)
IF (serverproperty(''InstanceName'')) IS NOT NULL
	BEGIN
		SET @insname=''mssql$''+CONVERT(VARCHAR(40),serverproperty(''InstanceName''))
		SET @agentname=''sqlagent$''+CONVERT(VARCHAR(40),serverproperty(''InstanceName''))
	END
ELSE
	BEGIN
		SET @insname=''mssqlserver''
		SET @agentname=''sqlserveragent''
	END

-- retrieve the status of the MS SQL Server instance	
SELECT @sctsql=''EXEC master.dbo.xp_cmdshell ''''sc query ''+@insname+'' | FIND "STATE"''''''
INSERT ##sqlservice
EXEC (@sctsql)

-- retrieve the status of the MS SQL Server Agent instance
SELECT @sctsql=''EXEC master.dbo.xp_cmdshell ''''sc query ''+@agentname+'' | FIND "STATE"''''''
INSERT ##agentservice
EXEC (@sctsql)

-- set the status for running or not running (MS SQL Server)
IF EXISTS(SELECT 1 FROM ##sqlservice WHERE details LIKE ''%RUNNING%'')
	SET @sqlstatus = ''Running''
ELSE 
	SET @sqlstatus = ''<font color="red">Not Running</font>''

-- set the status for running or not running (MS SQL Server Agent)	
IF EXISTS(SELECT 1 FROM ##agentservice WHERE details LIKE ''%RUNNING%'')
	SET @agentstatus = ''Running''
ELSE
	SET @agentstatus = ''<font color="red">Not Running</font>''

-- detemine if the databases are online or offline	
IF EXISTS (SELECT 1 FROM sys.databases WHERE state_desc<>''ONLINE'')
	BEGIN
		SET @dbstatus= ''<font color="red">Some of the database(s) are offline</font>''
		SELECT @dbdetail = ''<table border="1"><tr><th>Database Name</th><th>Database Status</th></tr><tr>''
		SELECT @dbdetail = @dbdetail + ''<td  align="Center">'' + name + ''</td><td  align="Center">''+state_desc+''</td></tr></table>'' FROM sys.databases WHERE state_desc<>''ONLINE''
	END
ELSE
	BEGIN
		SET @dbdetail = ''''
		SET @dbstatus=''All databases are online''
	END

-- set the subject for the email	
SET @subject=@sname+'' : SQL Server Service is Offline. Please Check''

-- set the email body in HTML format
SET @HTML=''<h3>''+@sname+''</h3><br>''+''<table border="1"><tr><th>SQL Server Startup time</th><th>SQL Server Service</th><th>SQL Agent Service</th> <th>Database(s) Status</th><th>Authentication Mode</th></tr><tr><td align="Center">''+
@starttime+''</td><td align="Center">''+@sqlstatus+''</td><td align="Center">''+@agentstatus+''</td><td align="Center">''+@dbstatus+''</td><td align="Center">''+@authmode+''</td></tr></table><br><br>''+@dbdetail

-- if either statuses are not running send the an email
IF @sqlstatus <> ''Running'' OR @agentstatus <> ''Running''
	BEGIN
		EXEC msdb.dbo.sp_send_dbmail  
			@profile_name = @profile_name,
			@recipients =@recipients,
			@subject=@subject,
			@body =@HTML,
			@body_format =''HTML''
	END 
GO

--Enabling startup parameter for that procedure
--EXEC sp_procoption ''serverstartup'',''startup'',True
--GO
', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Every 10 mins', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=10, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20111031, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'3c858cb0-cc20-4951-8967-bed39568b8e5'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:30:20 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.60.Min', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [execute powershell]    Script Date: 11/20/2014 2:30:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'execute powershell', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe G:\CMS\jobs\30_Min.ps1', 
		@flags=0, 
		@proxy_name=N'CMS'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TrackJobHistory]    Script Date: 11/20/2014 2:30:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TrackJobHistory', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec TrackHistory 1', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Alert New Databases]    Script Date: 11/20/2014 2:30:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Alert New Databases', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec Alert_Databases', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'every 60 min', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=8, 
		@freq_subday_interval=2, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140321, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'12cface4-75a5-4643-8bbe-72d11d5b2fb6'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:30:20 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.Alerts.Backups', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Execute Backup Alert]    Script Date: 11/20/2014 2:30:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Execute Backup Alert', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'Alert_Backups ''PRODUCTION''', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Bi Hourly During business hours', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=8, 
		@freq_subday_interval=2, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140415, 
		@active_end_date=99991231, 
		@active_start_time=71500, 
		@active_end_time=191500, 
		@schedule_uid=N'b240c237-5dde-42fa-9428-e1c3f85cad81'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:30:20 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.Alerts.DatabaseFileSpace', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Execute DatabaseFile Alerts]    Script Date: 11/20/2014 2:30:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Execute DatabaseFile Alerts', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec Alert_DatabaseFiles ''hourly'',''production''', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Hourly', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=8, 
		@freq_subday_interval=1, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140320, 
		@active_end_date=99991231, 
		@active_start_time=1500, 
		@active_end_time=235959, 
		@schedule_uid=N'd50b12b7-4e20-47f7-809b-3d9898dac816'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Data Collector]    Script Date: 11/20/2014 2:30:20 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Data Collector' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Data Collector'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.CounterCollector', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'Data Collector', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Run Resource Collection]    Script Date: 11/20/2014 2:30:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Run Resource Collection', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe G:\CMS\jobs\PerfCounters.ps1', 
		@flags=0, 
		@proxy_name=N'CMS'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Every 5 Minutes', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=5, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140714, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'e33a698c-017f-4648-bf0c-8bf82d3b7c18'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:30:20 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.Daily.Collection', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [execute powershell]    Script Date: 11/20/2014 2:30:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'execute powershell', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe G:\CMS\jobs\Daily.ps1', 
		@flags=0, 
		@proxy_name=N'CMS'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Run Daily Reports]    Script Date: 11/20/2014 2:30:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Run Daily Reports', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec Alert_AgentJobs ''DEVELOPMENT''
go
exec Alert_Backups ''DEVELOPMENT''
go
exec Alert_DatabaseFiles ''Daily'',''DEVELOPMENT''
go
exec Alert_Databases
GO
exec Alert_AgentJobs ''PRODUCTION''
go
exec Alert_Backups ''PRODUCTION''
go
exec Alert_DatabaseFiles ''Daily'',''PRODUCTION''
go
', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'daily', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140327, 
		@active_end_date=99991231, 
		@active_start_time=71500, 
		@active_end_time=235959, 
		@schedule_uid=N'587fd2d8-a08e-4cef-bacb-8ab5de08e87a'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:30:20 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.Purge', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Purges CollectionLog and history tables based on corresponding values in config table.', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'KMHP\jshurak', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Execute SP]    Script Date: 11/20/2014 2:30:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Execute SP', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec CMS.dbo.Purge_CMS', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Monthly Purge', 
		@enabled=1, 
		@freq_type=16, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20140522, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'8bd115e2-febc-4db2-8ed9-df5d0f3269f4'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Data Collector]    Script Date: 11/20/2014 2:30:20 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Data Collector' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Data Collector'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.ResourceMonitor', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'Data Collector', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Run Resource Collection]    Script Date: 11/20/2014 2:30:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Run Resource Collection', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe G:\CMS\jobs\Resources.ps1', 
		@flags=0, 
		@proxy_name=N'CMS'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Checking for Active Blocking]    Script Date: 11/20/2014 2:30:20 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Checking for Active Blocking', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC Alert_Blocking', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Alert DriveSpace]    Script Date: 11/20/2014 2:30:21 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Alert DriveSpace', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec Alert_DriveSpace ''PRODUCTION''', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'10 Minutes', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=10, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140310, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'74fe8fa1-b286-4977-bd87-bae53097cba8'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:30:21 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.ServerInstanceMonitoring', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Run Powershell]    Script Date: 11/20/2014 2:30:21 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Run Powershell', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'C:\WINDOWS\system32\WindowsPowerShell\v1.0\powershell.exe G:\CMS\jobs\ServerInstanceMonitoring.ps1', 
		@flags=0, 
		@proxy_name=N'CMS'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Run Alert procs]    Script Date: 11/20/2014 2:30:21 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Run Alert procs', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec Alert_OfflineInstances ''PRODUCTION''
GO
exec Alert_OfflineServers ''PRODUCTION''
GO
exec Alert_OfflineServices ''PRODUCTION''
GO', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'5 Minutes', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=5, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140602, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'0a4a04a1-e839-490e-a97b-f395c2059a6c'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:30:21 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CMS.TrackHistory', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Record Yesterday's stats]    Script Date: 11/20/2014 2:30:21 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Record Yesterday''s stats', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec TrackHistory', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Track Baselines]    Script Date: 11/20/2014 2:30:21 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Track Baselines', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec TrackBaseline', 
		@database_name=N'CMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Nightly', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140313, 
		@active_end_date=99991231, 
		@active_start_time=100, 
		@active_end_time=235959, 
		@schedule_uid=N'fa3d8775-253f-46ce-a8ef-bc3a151452e6'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:30:21 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CommandLog Cleanup', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [CommandLog Cleanup]    Script Date: 11/20/2014 2:30:21 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'CommandLog Cleanup', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "DELETE FROM [dbo].[CommandLog] WHERE StartTime < DATEADD(dd,-30,GETDATE())" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\CommandLogCleanup_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:30:21 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DatabaseBackup - SYSTEM_DATABASES - FULL', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DatabaseBackup - SYSTEM_DATABASES - FULL]    Script Date: 11/20/2014 2:30:21 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DatabaseBackup - SYSTEM_DATABASES - FULL', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "EXECUTE [dbo].[DatabaseBackup] @Databases = ''SYSTEM_DATABASES'', @Directory = N''C:\Backup'', @BackupType = ''FULL'', @Verify = ''Y'', @CleanupTime = NULL, @CheckSum = ''Y'', @LogToTable = ''Y''" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\DatabaseBackup_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:30:21 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DatabaseBackup - USER_DATABASES - DIFF', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DatabaseBackup - USER_DATABASES - DIFF]    Script Date: 11/20/2014 2:30:21 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DatabaseBackup - USER_DATABASES - DIFF', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "EXECUTE [dbo].[DatabaseBackup] @Databases = ''USER_DATABASES'', @Directory = N''C:\Backup'', @BackupType = ''DIFF'', @Verify = ''Y'', @CleanupTime = NULL, @CheckSum = ''Y'', @LogToTable = ''Y''" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\DatabaseBackup_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:30:21 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DatabaseBackup - USER_DATABASES - FULL', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DatabaseBackup - USER_DATABASES - FULL]    Script Date: 11/20/2014 2:30:21 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DatabaseBackup - USER_DATABASES - FULL', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "EXECUTE [dbo].[DatabaseBackup] @Databases = ''USER_DATABASES'', @Directory = N''C:\Backup'', @BackupType = ''FULL'', @Verify = ''Y'', @CleanupTime = NULL, @CheckSum = ''Y'', @LogToTable = ''Y''" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\DatabaseBackup_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:30:21 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DatabaseBackup - USER_DATABASES - LOG', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DatabaseBackup - USER_DATABASES - LOG]    Script Date: 11/20/2014 2:30:21 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DatabaseBackup - USER_DATABASES - LOG', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "EXECUTE [dbo].[DatabaseBackup] @Databases = ''USER_DATABASES'', @Directory = N''C:\Backup'', @BackupType = ''LOG'', @Verify = ''Y'', @CleanupTime = NULL, @CheckSum = ''Y'', @LogToTable = ''Y''" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\DatabaseBackup_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:30:21 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DatabaseIntegrityCheck - SYSTEM_DATABASES', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DatabaseIntegrityCheck - SYSTEM_DATABASES]    Script Date: 11/20/2014 2:30:21 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DatabaseIntegrityCheck - SYSTEM_DATABASES', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "EXECUTE [dbo].[DatabaseIntegrityCheck] @Databases = ''SYSTEM_DATABASES'', @LogToTable = ''Y''" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\DatabaseIntegrityCheck_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:30:22 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'DatabaseIntegrityCheck - USER_DATABASES', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DatabaseIntegrityCheck - USER_DATABASES]    Script Date: 11/20/2014 2:30:22 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DatabaseIntegrityCheck - USER_DATABASES', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "EXECUTE [dbo].[DatabaseIntegrityCheck] @Databases = ''USER_DATABASES'', @LogToTable = ''Y''" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\DatabaseIntegrityCheck_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:30:22 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'History Cleanup.Subplan_1', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Subplan_1]    Script Date: 11/20/2014 2:30:22 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Subplan_1', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'SSIS', 
		@command=N'/Server "$(ESCAPE_NONE(SRVR))" /SQL "Maintenance Plans\History Cleanup" /set "\Package\Subplan_1.Disable;false"', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'History Cleanup.Subplan_1', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20140128, 
		@active_end_date=99991231, 
		@active_start_time=230000, 
		@active_end_time=235959, 
		@schedule_uid=N'06e1fc89-9e74-4cfd-9969-c7746df1eaeb'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:30:22 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'IndexOptimize - USER_DATABASES', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [IndexOptimize - USER_DATABASES]    Script Date: 11/20/2014 2:30:22 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'IndexOptimize - USER_DATABASES', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d DATA_COLLECTION -Q "EXECUTE [dbo].[IndexOptimize] @Databases = ''USER_DATABASES'', @LogToTable = ''Y''" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\IndexOptimize_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:30:22 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Output File Cleanup', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Output File Cleanup]    Script Date: 11/20/2014 2:30:22 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Output File Cleanup', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'cmd /q /c "For /F "tokens=1 delims=" %v In (''ForFiles /P "G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG" /m *_*_*_*.txt /d -30 2^>^&1'') do if EXIST "G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG"\%v echo del "G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG"\%v& del "G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG"\%v"', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\OutputFileCleanup_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [ProcessAppVReportingData]    Script Date: 11/20/2014 2:30:22 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'ProcessAppVReportingData' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'ProcessAppVReportingData'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'ProcessAppVReportingDataJob', 
		@enabled=1, 
		@notify_level_eventlog=3, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Process AppV Reporting Data. --- AmHealth contact: Michael Sorino & Michael Gallager -- disabled 10/7/14', 
		@category_name=N'ProcessAppVReportingData', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Process AppV Reporting Data]    Script Date: 11/20/2014 2:30:22 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Process AppV Reporting Data', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'Exec dbo.spProcessClientReport', 
		@database_name=N'AppVReportingQA', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Process AppV Reporting Data Schedule', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20120823, 
		@active_end_date=99991231, 
		@active_start_time=100, 
		@active_end_time=235959, 
		@schedule_uid=N'dc8d32ff-974b-41dc-a6a4-93c7cb5a26dd'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:30:22 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Rebuild Fragmented Indexes (variable)', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeFrag Tables]    Script Date: 11/20/2014 2:30:22 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeFrag Tables', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXECUTE dbo.IndexOptimize
@Databases = ''ALL_DATABASES'',
@FragmentationLow = NULL,
@FragmentationMedium = ''INDEX_REORGANIZE,INDEX_REBUILD_ONLINE,INDEX_REBUILD_OFFLINE'',
@FragmentationHigh = ''INDEX_REBUILD_ONLINE,INDEX_REBUILD_OFFLINE'',
@FragmentationLevel1 = 5,
@FragmentationLevel2 = 30,
@UpdateStatistics = ''ALL'',
@OnlyModifiedStatistics = ''Y'',
@SortInTempdb = ''Y'',
@PartitionLevel = ''Y'',
@LogToTable = ''Y''
', 
		@database_name=N'DATA_COLLECTION', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Index2', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=64, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20120928, 
		@active_end_date=99991231, 
		@active_start_time=20000, 
		@active_end_time=235959, 
		@schedule_uid=N'ecd7f060-1f9f-44df-9020-f7937de03330'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:30:22 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Recycle Agent Error Log', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Agent Error Log Step]    Script Date: 11/20/2014 2:30:22 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Agent Error Log Step', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec sp_cycle_agent_errorlog -- run this job every week on Sunday Night
go', 
		@database_name=N'msdb', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Sunday at Midnight', 
		@enabled=1, 
		@freq_type=8, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20111102, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'3148faa3-eef8-4145-a5b8-3f69f599f2a1'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:30:22 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Recycle Error Log', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Cycle Error Log]    Script Date: 11/20/2014 2:30:23 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Cycle Error Log', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC sp_cycle_errorlog
GO', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily Midnight', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20111029, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'094d4278-406a-4eda-a74c-73ebabff7261'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:30:23 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Server Status', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Server Status]    Script Date: 11/20/2014 2:30:23 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Server Status', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @server_start_time DATETIME, 
@row INT; 

SELECT @server_start_time = login_time 
FROM master.sys.sysprocesses 
WHERE spid = 1 ; 

select @row = (select MAX(row_num) from server_restart_time)
set @row = (@row + 1)
insert into server_restart_time SELECT @server_start_time, @row


if @server_start_time = (select service_restart from server_restart_time where row_num = (@row-1))
delete from server_restart_time where row_num = @row

select * from server_restart_time', 
		@database_name=N'DATA_COLLECTION', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Daily', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20131205, 
		@active_end_date=99991231, 
		@active_start_time=230000, 
		@active_end_time=235959, 
		@schedule_uid=N'5713ed3c-4398-448c-9c84-616770ad5761'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:30:23 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'sp_delete_backuphistory', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [sp_delete_backuphistory]    Script Date: 11/20/2014 2:30:23 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'sp_delete_backuphistory', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d msdb -Q "DECLARE @CleanupDate datetime SET @CleanupDate = DATEADD(dd,-30,GETDATE()) EXECUTE dbo.sp_delete_backuphistory @oldest_date = @CleanupDate" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\sp_delete_backuphistory_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 11/20/2014 2:30:23 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'sp_purge_jobhistory', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Source: http://ola.hallengren.com', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [sp_purge_jobhistory]    Script Date: 11/20/2014 2:30:23 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'sp_purge_jobhistory', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'CmdExec', 
		@command=N'sqlcmd -E -S $(ESCAPE_SQUOTE(SRVR)) -d msdb -Q "DECLARE @CleanupDate datetime SET @CleanupDate = DATEADD(dd,-30,GETDATE()) EXECUTE dbo.sp_purge_jobhistory @oldest_date = @CleanupDate" -b', 
		@output_file_name=N'G:\Program Files\Microsoft SQL Server\MSSQL11.DVS1201\MSSQL\LOG\sp_purge_jobhistory_$(ESCAPE_SQUOTE(JOBID))_$(ESCAPE_SQUOTE(STEPID))_$(ESCAPE_SQUOTE(STRTDT))_$(ESCAPE_SQUOTE(STRTTM)).txt', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:30:23 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'syspolicy_purge_history', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=2, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', 
		@notify_email_operator_name=N'DBA Group', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Verify that automation is enabled.]    Script Date: 11/20/2014 2:30:23 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Verify that automation is enabled.', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=1, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'IF (msdb.dbo.fn_syspolicy_is_automation_enabled() != 1)
        BEGIN
            RAISERROR(34022, 16, 1)
        END', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Purge history.]    Script Date: 11/20/2014 2:30:23 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Purge history.', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC msdb.dbo.sp_syspolicy_purge_history', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Erase Phantom System Health Records.]    Script Date: 11/20/2014 2:30:23 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Erase Phantom System Health Records.', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'PowerShell', 
		@command=N'if (''$(ESCAPE_SQUOTE(INST))'' -eq ''MSSQLSERVER'') {$a = ''\DEFAULT''} ELSE {$a = ''''};
(Get-Item SQLSERVER:\SQLPolicy\$(ESCAPE_NONE(SRVR))$a).EraseSystemHealthPhantomRecords()', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'syspolicy_purge_history_schedule', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20080101, 
		@active_end_date=99991231, 
		@active_start_time=20000, 
		@active_end_time=235959, 
		@schedule_uid=N'9f503e7a-f6cf-4b4e-969d-fb9bac2e7598'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:30:23 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'sysutility_get_cache_tables_data_into_aggregate_tables_daily', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'At every 12:01 AM stroke, the data of the cache tables get aggregated and put into corresponding aggregate by day tables.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Aggregate current days data from the cache tables into the server aggregation table]    Script Date: 11/20/2014 2:30:23 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Aggregate current days data from the cache tables into the server aggregation table', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @now DATETIME; SELECT @now = GETUTCDATE(); EXEC [sysutility_ucp_core].sp_copy_cache_table_data_into_aggregate_tables @aggregation_type=2, @endTime=@now', 
		@database_name=N'sysutility_mdw', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Purge cache table history data based on retention period]    Script Date: 11/20/2014 2:30:23 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Purge cache table history data based on retention period', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC [sysutility_ucp_core].[sp_purge_cache_tables];', 
		@database_name=N'sysutility_mdw', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Purge resource health policy evaluation history based on trailing window]    Script Date: 11/20/2014 2:30:23 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Purge resource health policy evaluation history based on trailing window', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC msdb.dbo.sp_sysutility_ucp_delete_policy_history', 
		@database_name=N'msdb', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'OccursOnceADayAt12:01AM', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20080218, 
		@active_end_date=99991231, 
		@active_start_time=100, 
		@active_end_time=235959, 
		@schedule_uid=N'acb4d2d5-d2ee-4d33-b82e-a296a41fc225'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:30:23 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'sysutility_get_cache_tables_data_into_aggregate_tables_hourly', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'At every hour''s stroke, the data of the cache tables get aggregated and put into corresponding aggregate by hour tables.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Aggregate current hours data from the cache tables into the server aggregation table]    Script Date: 11/20/2014 2:30:23 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Aggregate current hours data from the cache tables into the server aggregation table', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @now DATETIMEOFFSET(7); SELECT @now = SYSDATETIMEOFFSET(); EXEC [sysutility_ucp_core].sp_copy_cache_table_data_into_aggregate_tables @aggregation_type=1, @endTime=@now', 
		@database_name=N'sysutility_mdw', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'OccursEveryOneHour', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=8, 
		@freq_subday_interval=1, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140918, 
		@active_end_date=99991231, 
		@active_start_time=100, 
		@active_end_time=235959, 
		@schedule_uid=N'51a7404f-7bd0-4210-87b7-da1eb2ff3f6e'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 11/20/2014 2:30:23 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'sysutility_get_views_data_into_cache_tables', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Gets all the views data into corresponding cache tables after every 15 minutes', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'KMHP\SCM-SQL12', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Insert latest data from live tables into cache tables]    Script Date: 11/20/2014 2:30:23 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Insert latest data from live tables into cache tables', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC [sysutility_ucp_staging].sp_copy_live_table_data_into_cache_tables', 
		@database_name=N'sysutility_mdw', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Execute resource health policy evaluation job]    Script Date: 11/20/2014 2:30:23 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Execute resource health policy evaluation job', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'PowerShell', 
		@command=N'$serverName = ''$(ESCAPE_SQUOTE(SRVR))'';
                                   $path = Convert-UrnToPath "PolicyStore[@Name=`''$serverName`'']";
                                   dir $path\Policies -FORCE | where { $_.IsSystemObject -eq $true -and $_.Name -like ''Utility*'' } | Invoke-PolicyEvaluation -TargetServerName $serverName;', 
		@database_name=N'msdb', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Compute resource health states]    Script Date: 11/20/2014 2:30:23 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Compute resource health states', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC msdb.dbo.sp_sysutility_ucp_calculate_health', 
		@database_name=N'msdb', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'OccursEvery15Minutes', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=15, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140918, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'7c3e972b-6e4b-4c61-9061-715d8b9ba531'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Utility - Managed Instance]    Script Date: 11/20/2014 2:30:23 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Utility - Managed Instance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Utility - Managed Instance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'sysutility_mi_collect_and_upload', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Collect configuration and performance information', 
		@category_name=N'Utility - Managed Instance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Record batch start time]    Script Date: 11/20/2014 2:30:23 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Record batch start time', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'
               USE tempdb
               
               IF OBJECT_ID (''[tempdb].[dbo].[sysutility_batch_time_internal]'') IS NOT NULL
               BEGIN
                  DROP TABLE [tempdb].[dbo].[sysutility_batch_time_internal];
               END;
               
               CREATE TABLE [tempdb].[dbo].[sysutility_batch_time_internal] (
                  latest_batch_time datetimeoffset(7) PRIMARY KEY NOT NULL
               );
                  
               -- The DC job needs to access the timestamp in this table, and it may not run under a login that 
               -- is mapped to a user in tempdb, so grant SELECT permissions to public.  The table contains no 
               -- sensitive data (only a single datetimeoffset value), so granting read permission to public 
               -- does create a security problem. 
               GRANT SELECT ON [tempdb].[dbo].[sysutility_batch_time_internal] TO PUBLIC;

               -- Save the start time for the current execution of the managed instance data collection job
               INSERT INTO [tempdb].[dbo].[sysutility_batch_time_internal] (latest_batch_time) VALUES (SYSDATETIMEOFFSET());', 
		@database_name=N'tempdb', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Stage Data Collected from PowerShell Script]    Script Date: 11/20/2014 2:30:24 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Stage Data Collected from PowerShell Script', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'PowerShell', 
		@command=N'[Void] [System.Reflection.Assembly]::LoadWithPartialName("System.Data")
[Void] [System.Reflection.Assembly]::LoadWithPartialName("System.Diagnostics")
[Void] [System.Reflection.Assembly]::LoadWithPartialName("System.Collections")

###############################################################################
# Powershell settings
###############################################################################

# Generate an error if attempt to access a nonexisting variable
Set-PsDebug -Strict

# Global settings for what to do on a error, warning, or verbose call
# Change these settings to change how this script writes output in the agent logs
# Settings also affects how SQL Agent reports success or failure in the script
# Options are:
#      Continue - Continue processing and notify the user 
#             - Agent reaction: step will report success, and
#                           log will include message
#      Inquire - Stop processing and ask the user how it should proceed 
#             - Agent reaction: step fails with "cannot invoke this function"
#                           the Agent PS provider does not implement this
#      SilentlyContinue - Continue processing without notifying the user
#                    - Agent reaction:  will not fail step 
#                                 and will not log any message
#      Stop - Stop processing when an action occurs
#          - Agent reaction: step will fail with message in log
$VerbosePreference = "SilentlyContinue"
$WarningPreference = "Continue"
$ErrorActionPreference = "Stop"

###############################################################################
# Global Variables
###############################################################################

# The following line uses SQL Agent tokens to set the server name
# ESCAPE_SQUOTE(SRVR) with a $ sign in front is a special token to SQL Agent
# When the job is run, SQL Agent will expand the string to the server name
# Use single quotes so that PS considers the string a literal and will not
# try to expand the $ reference and the script will not fail in a test environment
$serverName = ''$(ESCAPE_SQUOTE(SRVR))''

# Currently the best way to tell if the script is running in Agent
# is to check if the console is not the ConsoleHost.  The Powershell
# subsystem for Agent has no console and thus writing to the host directly
# does not show up in the Agent logs.
$isNotConsole = ($host.Name -ne "ConsoleHost")

$connection = $null
$transaction = $null
$isVistaOrXPSp2OrHigher = $null
$sleepTimeoutSeconds = 5
$directoryNameToDeviceId=$null

$cpuStageTableName = "[msdb].[dbo].[sysutility_mi_cpu_stage_internal]"
$cpuStageDataTable = $null
$cpuNumProcessorsColumnName = "num_processors"
$cpuNameColumnName = "cpu_name"
$cpuCaptionColumnName = "cpu_caption"
$cpuFamilyIdColumnName = "cpu_family_id"  
$cpuArchitectureIdColumnName = "cpu_architecture_id"
$cpuMaxClockSpeedColumnName = "cpu_max_clock_speed"
$cpuClockSpeedColumnName = "cpu_clock_speed"
$cpuL2CacheSizeColumnName = "l2_cache_size"
$cpuL3CacheSizeColumnName = "l3_cache_size"
# Start of collection column names
$cpuInstanceProcessorUsageStartTicks = "instance_processor_usage_start_ticks"
$cpuInstanceCollectTimeStartTicks = "instance_collect_time_start_ticks"
$cpuComputerProcessorIdleStartTicks = "computer_processor_idle_start_ticks"
$cpuComputerCollectTimeStartTicks = "computer_collect_time_start_ticks"
# End of collection column names
$cpuInstanceProcessorUsageEndTicks = "instance_processor_usage_end_ticks"
$cpuInstanceCollectTimeEndTicks = "instance_collect_time_end_ticks"
$cpuComputerProcessorIdleEndTicks = "computer_processor_idle_end_ticks"
$cpuComputerCollectTimeEndTicks = "computer_collect_time_end_ticks"


$volumeStageTableName = "[msdb].[dbo].[sysutility_mi_volumes_stage_internal]"
$volumeStageDataTable = $null
$volumeDeviceIdColumnName = "volume_device_id"
$volumeNameColumnName = "volume_name"
$volumeCapacityColumnName = "capacity_mb"
$volumeFreeSpaceColumnName = "free_space_mb"

$smoStageTableName = "[msdb].[dbo].[sysutility_mi_smo_stage_internal]"
$smoStageDataTable = $null
$smoTypeColumnName = "object_type"
$smoUrnColumnName = "urn"
$smoPropertyNameColumnName = "property_name"
$smoPropertyValueColumnName = "property_value"

###############################################################################
# Functions that help with handling output to SQL Agent
#
# Sql Agent PS provider does not write output to the log from
# the warnings, errors, and verbose Write cmdlets.  The following
# functions wrap these cmdlets for execution as an agent job step.
###############################################################################

# This function is a helper function throws an exception if the passed in object 
# is null or empty.  The intent is to mimic the PowerShell version 2.0 parameter 
# validation function with the same name. The paramter validation is available 
# in 2.0 or higher, but this script can run in 1.0 or 2.0 runtime environment.
function ValidateNotNullOrEmpty($object)
{
    if(($object -eq $null) -or ($object -eq ""))
    {
        throw "The argument is null or empty."
    }
}

# This function helps control control flow for the agent step context
# When running within agent, there are different semantics for writing
# errors, warnings, and messages.  In addition, when running inside an
# agent step, the script will automatically collect and stage data.
# However, if the script is loaded in a PS environment outside of 
# agent, the script will not automatically start to collect and stage data
#
# Returns True if the script is run inside an agent step
#         False if the script is run outside an agent step 
function Get-IsAgentStep
{
   $global:isNotConsole
}

function Write-AgentLog([String] $prefix, [String] $printString, [String] $preference)
{
   if((Get-IsAgentStep) -and ($preference -ne "SilentlyContinue"))
   {
      [Console]::Error.WriteLine($prefix + $printString)
   }
}

function Get-PrintString ($object)
{
   ValidateNotNullOrEmpty $object
   
   $date = Get-Date -DisplayHint Time
   $printString = $date.ToString() + " : " +  $object.ToString()
   $printString
}

function Write-ScriptVerbose ($object)
{
   $printString = Get-PrintString $object
   
   Write-AgentLog "VERBOSE : " $printString $VerbosePreference 
   Write-Verbose $printString
}


function Write-ScriptWarning ($object)
{
   $printString = Get-PrintString $object
   
   Write-AgentLog "WARNING : " $printString $WarningPreference 
   Write-Warning $printString
}

function Write-ScriptError ($object)
{
   $printString = Get-PrintString $object
   
   Write-AgentLog "ERROR : " $printString $ErrorActionPreference 
   Write-Error $printString   
}

function Resolve-Error ($ErrorRecord=$Error[0])
{
   $errorString = $ErrorRecord | Format-List * -Force  | Out-String
   Write-ScriptWarning $errorString
   $errorString = $ErrorRecord.InvocationInfo | Format-List * | Out-String
   Write-ScriptWarning $errorString
   $Exception = $ErrorRecord.Exception
   
   # Print the entire stack of exceptions
   for ($i = 0; $Exception; $i++, ($Exception = $Exception.InnerException))
   {   Write-ScriptWarning ("$i" * 80)
       $errorString = $Exception | Format-List * -Force  | Out-String
      Write-ScriptWarning $errorString
   }
}


###############################################################################
# Connection Functions help to send queries to and manage the connection 
# to the server .
###############################################################################
function Get-Connection
{
   if($global:serverName.Contains(''ESCAPE_SQUOTE(SRVR)''))
   {
      throw "The global variable serverName has not been set."
   }
   if($global:connection -eq $null)
   {
      Write-ScriptVerbose "Opening connection to $global:serverName"
      $connString="Application Name=SQL Server Utility Managed Instance;Server=$global:serverName;Database=msdb;Trusted_Connection=True;"
      
      $global:connection = New-Object System.Data.SqlClient.SqlConnection
      $global:connection.ConnectionString = $connString
      [Void]$global:connection.Open()
      Write-ScriptVerbose "Opened connection with connection string:`n $connString"
   }
   $global:connection
}

function Remove-Connection
{
   if($global:connection -ne $null)
   {
      $dataSource=$global:connection.DataSource
      Write-ScriptVerbose "Closing and disposing connection to $dataSource"
      [Void]$global:connection.Close()
      [Void]$global:connection.Dispose()
      Write-ScriptVerbose "Connection is closed and disposed"
   }
   $global:connection = $null
}

function Invoke-BeginTransaction([string] $tranName)
{
   Write-ScriptVerbose "Opening transaction"
   $sqlConnection = Get-Connection
   $global:transaction = $sqlConnection.BeginTransaction($tranName)
}

function Invoke-CommitTransaction
{
   if($global:transaction -ne $null)
   {
      Write-ScriptVerbose "Committing transaction"
      $global:transaction.Commit()
      $global:transaction.Dispose()
      $global:transaction = $null
   }
}

function Invoke-RollbackTransaction
{
   if($global:transaction -ne $null)
   {
      Write-ScriptVerbose "Rolling back transaction"
      $global:transaction.Rollback() 
      $global:transaction.Dispose()
      $global:transaction = $null
   }
}

function Invoke-SubmitSqlCommandNonQuery([string] $query)
{
   ValidateNotNullOrEmpty $query
      
   Write-ScriptVerbose "Submitting as NonQuery : $query"
   $TsqlCommand = New-Object System.Data.SqlClient.SqlCommand;
   $TsqlCommand.CommandText = $query
   $TsqlCommand.CommandType = "Text";
   $TsqlCommand.Transaction = $global:transaction
   
   $TsqlCommand.Connection = Get-Connection
   $TsqlCommand.CommandTimeout = 0
   [Void] $TsqlCommand.ExecuteNonQuery()
}

function Get-SqlDataTable([string] $query)
{
   ValidateNotNullOrEmpty $query
   
   Write-ScriptVerbose "Requesting data table for : $query"
   $sqlConnection = Get-Connection
    $dataAdapter = New-Object System.Data.SqlClient.SqlDataAdapter($query, $sqlConnection)
    $dataTable = New-Object System.Data.DataTable
    $rowsFilled = $dataAdapter.Fill($dataTable)
   Write-ScriptVerbose "Query added $rowsFilled rows to the data table"
    # return the data table.  We need to wrap the variable because PS will
   # return data rows otherwise.
   return @(,($dataTable))
} 

function Invoke-BulkCopyCommand([System.Data.DataTable] $dataTableData)
{
   ValidateNotNullOrEmpty $dataTableData
   
   $opt = [System.Data.SqlClient.SqlBulkCopyOptions] 

   # Obtain a TableLock
   # But do not (use) Default (options), KeepIdentity, CheckConstraints, KeepNulls
   #  FireTriggers,  UseInternalTransaction
   $bulkOptions = $opt::none -bxor ("TableLock" -as $opt) 

   $tabName=$dataTableData.TableName
   Write-ScriptVerbose "Bulk copying data table : $tabName"
   $sqlConnection = Get-Connection
   $bulkCopy = new-object Data.SqlClient.SqlBulkCopy $sqlConnection, $bulkOptions,  $global:transaction
   $bulkCopy.DestinationTableName = $dataTableData.TableName
   
   #Map the columns so that the computed columns are skipped in the upload
   foreach($col in $dataTableData.Columns)
   {
      [Void] $bulkCopy.ColumnMappings.Add($col.ColumnName, 
                                 $col.ColumnName)
   }
   [Void] $bulkCopy.WriteToServer($dataTableData)
   
}

###############################################################################
# Short Helper Functions 
###############################################################################

function Get-DefaultIfNull($object, $default)
{
    if($object -eq $null) 
    {
        $default
    } 
    else
    {
        $object
    }
}

function Get-StringDefaultIfNull([String] $object)
{
    Get-DefaultIfNull $object ""
}

function Get-NumericDefaultIfNull($object)
{
    Get-DefaultIfNull $object 0
}

function Get-ProcessId
{
   $result = Get-SqlDataTable "SELECT SERVERPROPERTY(''ProcessID'') AS ProcessId"  | %{ $_.Rows }
   $result.ProcessId
}

function Get-IsWmiVolumeQueryAvailable
{
   if($global:isVistaOrXPSp2OrHigher -eq $null)
   {
      $osVersion = [System.Environment]::OsVersion.Version
      $global:isVistaOrXPSp2OrHigher = ($osVersion.Major -ge 6 -or ($osVersion.Major -ge 5 -and $osVersion.Minor -ge 2))
   }
   Write-ScriptVerbose "This computer is Vista or XP Sp2 or higher value is $global:isVistaOrXPSp2OrHigher"
   $global:isVistaOrXPSp2OrHigher
}

# Trims the volume name to <drive_letter>: format. 
# Reason: Data collection using WMI on different OS returns diffrent volume formats
# E.g. Win32_LogicalDisk on WIN2K3 returns c: and Win32_Volume on WIN2K8 returns c:
function Get-FormattedVolumeName([String] $volumeName)
{
   [String] $volumeName = Get-StringDefaultIfNull $volumeName
   
   Write-ScriptVerbose "Formatting volume name $volumeName"
   if($volumeName.EndsWith("\"))
   {
      $volumeName = $volumeName.SubString(0,$volumeName.Length - 1)
   }
   
   Write-ScriptVerbose "Formatted volume name to $volumeName"
   $volumeName
}

function Get-MountPointDictionary()
{
	if($global:directoryNameToDeviceId -eq $null)
	{
		$global:directoryNameToDeviceId=@{}
		(Get-Wmiobject Win32_MountPoint) | 
		%{ $directory=$_.Directory.Replace("Win32_Directory.Name=", "").Replace("`"", "").Replace("\\", "\")
		   $deviceId=$_.Volume.Replace("Win32_Volume.DeviceID=`"", "").Replace("`"", "").Replace("\\", "\")
		   $global:directoryNameToDeviceId[$directory]=$deviceId
		}
	}
	return $global:directoryNameToDeviceId
}

# The following function returns a directory name that maps to a volume device
# based on longest match.  It is not exact because a file can have a long
# convoluted path that pass through many mount point references
# However, it will find the most common use case for mount points
function Get-MountPointName([String] $fileName)
{
    [String] $fileName = Get-StringDefaultIfNull $fileName

    $longestMatch = ""
    $dict = Get-MountPointDictionary
    foreach($directory in $dict.Keys)
    {
        if($fileName.StartsWith($directory, [System.StringComparison]::OrdinalIgnoreCase))
        {
            if($directory.Length -gt $longestMatch.Length)
            {
                $longestMatch = $directory
            }
        }
    }
    return $longestMatch
}


function Get-DeviceIdFromMountPointName([String] $mountPointDirectory)
{
    [String] $mountPointDirectory = Get-StringDefaultIfNull $mountPointDirectory

    $dict = Get-MountPointDictionary
    
    $dict[$mountPointDirectory]
} 

function Get-MegabytesFromBytes ([Uint64] $bytes)
{
   [Uint64] $bytes = Get-NumericDefaultIfNull $bytes
      
   Write-ScriptVerbose "Converting $bytes bytes to megabytes"
   $oneMB = 1048576
   [UInt64] ($bytes / $oneMB)  # No fractional MBs
}

function Get-ShouldCollectCpu
{   
   if( ($global:cpuStageDataTable -eq $null) -or ($global:cpuStageDataTable.Rows.Count -eq 0))
   {
      Write-ScriptVerbose "The cpu staging table is null or empty.  Get-ShouldCollectCpu returning true"
      # return True and exit early
      return $true
   }
   else
   {
      $dataRow = $global:cpuStageDataTable.Rows[0]
      
      # return the value of the disjunction
      $dataRow[$cpuInstanceProcessorUsageStartTicks] -eq 0 -or
         $dataRow[$cpuInstanceCollectTimeStartTicks] -eq 0 -or
         $dataRow[$cpuComputerProcessorIdleStartTicks] -eq 0 -or
         $dataRow[$cpuComputerCollectTimeStartTicks] -eq 0
   }
}

###############################################################################
# Staging Functions that construct DataTables based on the different types of 
# data collection
###############################################################################
function Add-StageCpuRow
{
   param ([Int32] $numProcessors, [String] $cpuName, [String] $cpuCaption, [UInt16] $cpuFamily, 
      [UInt16] $architecture, [UInt32] $cpuMaxClockSpeed, [UInt32] $clockSpeed, 
      [UInt32] $l2CacheSize, [UInt32] $l3CacheSize, 
      [UInt64] $instanceProcessorUsage, [Int64] $instanceCollectTime, 
      [UInt64] $computerIdleTime, [UInt64] $computerCollectTime)

   begin
   {
      # This function update the Cpu table in-place by
      # first querying the server for the previous collection
      # information
      if($global:cpuStageDataTable -eq $null)
      {
         $query = "SELECT  
                  $cpuNumProcessorsColumnName,
                  $cpuNameColumnName,
                  $cpuCaptionColumnName,
                  $cpuFamilyIdColumnName,
                  $cpuArchitectureIdColumnName,
                  $cpuMaxClockSpeedColumnName,
                  $cpuClockSpeedColumnName,
                  $cpuL2CacheSizeColumnName,
                  $cpuL3CacheSizeColumnName,
                  $cpuInstanceProcessorUsageStartTicks,
                  $cpuInstanceCollectTimeStartTicks,
                  $cpuComputerProcessorIdleStartTicks,
                  $cpuComputerCollectTimeStartTicks,
                  $cpuInstanceProcessorUsageEndTicks,
                  $cpuInstanceCollectTimeEndTicks,
                  $cpuComputerProcessorIdleEndTicks,
                  $cpuComputerCollectTimeEndTicks
               FROM $global:cpuStageTableName"
         $global:cpuStageDataTable = Get-SqlDataTable $query
                  
         # If the data table is null, then there is no
         # data on the server and the table needs to be initialized
         if($global:cpuStageDataTable -eq $null)
         {
            Write-ScriptVerbose "Database returned no rows for cpu table. Creating table definition"
            $global:cpuStageDataTable = New-Object System.Data.DataTable ($global:cpuStageTableName)
            
            ($cpuNumProcessorsColumnName, [UInt16]), 
            ($cpuNameColumnName,[string]), 
            ($cpuCaptionColumnName,[string]), 
            ($cpuFamilyIdColumnName, [UInt16]), 
            ($cpuArchitectureIdColumnName, [UInt16]), 
            ($cpuMaxClockSpeedColumnName, [UInt32]), 
            ($cpuClockSpeedColumnName, [UInt32]), 
            ($cpuL2CacheSizeColumnName, [UInt32]), 
            ($cpuL3CacheSizeColumnName, [UInt32]), 
            ($cpuInstanceProcessorUsageStartTicks, [UInt64]), 
            ($cpuInstanceCollectTimeStartTicks, [Int64]), 
            ($cpuComputerProcessorIdleStartTicks, [UInt64]), 
            ($cpuComputerCollectTimeStartTicks, [UInt64]), 
            ($cpuInstanceProcessorUsageEndTicks, [UInt64]), 
            ($cpuInstanceCollectTimeEndTicks, [Int64]),
            ($cpuComputerProcessorIdleEndTicks, [UInt64]), 
            ($cpuComputerCollectTimeEndTicks, [UInt64]) | 
            foreach { ,
               $column =  new-object Data.DataColumn ($_)
               $global:cpuStageDataTable.Columns.Add($column) 
            }
         }
         $global:cpuStageDataTable.TableName = $global:cpuStageTableName
      }
      
      
      # If there is one row in the table, it is the data that the query returned
      # update the start values to be the old end values
      if ($global:cpuStageDataTable.Rows.Count -eq 1)
      {
         Write-ScriptVerbose "Stage table contains one row. Swapping end to start values."
         $dataRow = [System.Data.DataRow] $global:cpuStageDataTable.Rows[0]
   
         # The previous end values become the start values
         $dataRow[$cpuInstanceProcessorUsageStartTicks] = $dataRow[$cpuInstanceProcessorUsageEndTicks]
         $dataRow[$cpuInstanceCollectTimeStartTicks] = $dataRow[$cpuInstanceCollectTimeEndTicks]
         $dataRow[$cpuComputerProcessorIdleStartTicks] = $dataRow[$cpuComputerProcessorIdleEndTicks]
         $dataRow[$cpuComputerCollectTimeStartTicks] = $dataRow[$cpuComputerCollectTimeEndTicks]
      } 
      else
      {
         # There were no rows in the table or too many rows
         # Either way, the data needs to be cleared and updated
         # with the new information
         $rowCount = $global:cpuStageDataTable.Rows.Count
         Write-ScriptVerbose "Number of rows in data table is $rowCount"   
         
         Write-ScriptVerbose "Clearing stage table and marking start values with 0"
         [Void] $global:cpuStageDataTable.Clear()
         $dataRow = [System.Data.DataRow] $global:cpuStageDataTable.NewRow()
         $global:cpuStageDataTable.Rows.Add($dataRow)
         
         # There are no start values
         $dataRow[$cpuInstanceProcessorUsageStartTicks] = 0
         $dataRow[$cpuInstanceCollectTimeStartTicks] = 0
         $dataRow[$cpuComputerProcessorIdleStartTicks] = 0
         $dataRow[$cpuComputerCollectTimeStartTicks] = 0
      }
   }
   
   process
   {
      # Powershell 2.0 does not default typed parameters that are $null
      # So, the function has to set the defaults for the null parameters
      [Int32] $numProcessors = Get-NumericDefaultIfNull $numProcessors
      [String] $cpuName = Get-StringDefaultIfNull $cpuName
      [String] $cpuCaption = Get-StringDefaultIfNull $cpuCaption
      [UInt16] $cpuFamily = Get-NumericDefaultIfNull $cpuFamily
      [UInt16] $architecture = Get-NumericDefaultIfNull $architecture
      [UInt32] $cpuMaxClockSpeed = Get-NumericDefaultIfNull $cpuMaxClockSpeed
      [UInt32] $clockSpeed = Get-NumericDefaultIfNull $clockSpeed
      [UInt32] $l2CacheSize = Get-NumericDefaultIfNull $l2CacheSize
      [UInt32] $l3CacheSize = Get-NumericDefaultIfNull $l3CacheSize
      [UInt64] $instanceProcessorUsage = Get-NumericDefaultIfNull $instanceProcessorUsage
      [Int64] $instanceCollectTime = Get-NumericDefaultIfNull $instanceCollectTime
      [UInt64] $computerIdleTime = Get-NumericDefaultIfNull $computerIdleTime
      [UInt64] $computerCollectTime = Get-NumericDefaultIfNull $computerCollectTime
      
   
      # instanceCollectTime comes in as an signed int, make sure it is not neg
      if($instanceCollectTime -lt 0)
      {
         $instanceCollectTime = 0
      }
      
      # numProcessors comes in as an signed int, make sure it is not neg
      if($numProcessors -lt 0)
      {
         $numProcessors = 0
      }
   
      # Add the collected information
      Write-ScriptVerbose "Adding collected information to data table"
      $dataRow[$cpuNumProcessorsColumnName] = $numProcessors
      $dataRow[$cpuNameColumnName] = $cpuName
      $dataRow[$cpuCaptionColumnName] = $cpuCaption
      $dataRow[$cpuFamilyIdColumnName] = $cpuFamily
      $dataRow[$cpuArchitectureIdColumnName] = $architecture
      $dataRow[$cpuMaxClockSpeedColumnName] = $cpuMaxClockSpeed
      $dataRow[$cpuClockSpeedColumnName] = $clockSpeed
      $dataRow[$cpuL2CacheSizeColumnName] = $l2CacheSize
      $dataRow[$cpuL3CacheSizeColumnName] = $l3CacheSize
      $dataRow[$cpuInstanceProcessorUsageEndTicks] = $instanceProcessorUsage
      $dataRow[$cpuInstanceCollectTimeEndTicks] = $instanceCollectTime
      $dataRow[$cpuComputerProcessorIdleEndTicks] = $computerIdleTime
      $dataRow[$cpuComputerCollectTimeEndTicks] = $computerCollectTime
   }
}



function Add-StageVolumeRow
{ 
   param ([String]$deviceId,
         [String] $volumeNameRaw, 
         [UInt64] $capacityBytes, 
         [UInt64] $freeSpaceBytes)
   begin
   {
      # Initialize the stage table
      if($global:volumeStageDataTable -eq $null)
      {   
         Write-ScriptVerbose "Volume data table is null, creating table definition."
         $global:volumeStageDataTable = New-Object System.Data.DataTable ($global:volumeStageTableName)
            
         ($global:volumeDeviceIdColumnName, [String]), 
         ($global:volumeNameColumnName, [String]), 
         ($global:volumeCapacityColumnName, [UInt64]), 
         ($global:volumeFreeSpaceColumnName, [UInt64])| 
         foreach { ,
            $column =  new-object Data.DataColumn ($_)
            $global:volumeStageDataTable.Columns.Add($column) 
         }
      }
   }
   process
   {
      [String] $deviceId = Get-StringDefaultIfNull $deviceId
      [String] $formattedName = Get-FormattedVolumeName $volumeNameRaw
      [UInt64] $freeSpaceMB = Get-MegabytesFromBytes $freeSpaceBytes
      [UInt64] $capacityMB = Get-MegabytesFromBytes $capacityBytes
      
      if ( ($formattedName -eq "") -or ($deviceId -eq ""))
      {
         Write-ScriptWarning "DeviceId is empty string, or volume name formatting results in empty string.  Skipping this row."
         Write-ScriptWarning "Device Id = $deviceId. Volume name raw = $volumeNameRaw."
         return # return early
      }

      Write-ScriptVerbose "Adding collected information to data table"
      $dataRow = [System.Data.DataRow] $global:volumeStageDataTable.NewRow()
      $dataRow[$global:volumeNameColumnName] = $formattedName
      $dataRow[$global:volumeFreeSpaceColumnName] = $freeSpaceMB
      $dataRow[$global:volumeCapacityColumnName] = $capacityMB
      $dataRow[$global:volumeDeviceIdColumnName] = $deviceId
      Write-ScriptVerbose "Adding row to table"
      
      [Void] $global:volumeStageDataTable.Rows.Add($dataRow)
   }
}


function Add-StageSmoRow
{
   param ([Int32] $type, [String] $objUrn, [String] $propertyName, [object] $value)
   begin
   {      
      # Initialize the stage table
      if($global:smoStageDataTable -eq $null)
      {   
         Write-ScriptVerbose "Smo data table is null, creating table definition."
         $global:smoStageDataTable = New-Object System.Data.DataTable ($global:smoStageTableName)
         
         ($global:smoTypeColumnName, [Int32]), 
         ($global:smoUrnColumnName, [String]), 
         ($global:smoPropertyNameColumnName, [String]), 
         ($global:smoPropertyValueColumnName, [Object]) | 
         foreach { ,
            $column =  new-object Data.DataColumn ($_)
            $global:smoStageDataTable.Columns.Add($column) 
         }   
      }
   }
   process
   {  
      # if the type, propertyName, or Urn is null, something is wrong, throw an exception
      ValidateNotNullOrEmpty $type          
      ValidateNotNUllOrEmpty $propertyName
      ValidateNotNUllOrEmpty $objUrn
      
      # value can be null sometimes, which is fine.  Just throw the row out.
      if ( $value -eq $null )
      {
         Write-ScriptWarning "The value for property $propertyName is null. This property will not be added."
         Write-ScriptWarning "(objUrn = $objUrn)) (type = $type)) (propertyName = $propertyName)) (value = $value))"
         return # return early
      }
      
      Write-ScriptVerbose "Adding collected information for $propertyName to data table"
      $dataRow = [System.Data.DataRow] $global:smoStageDataTable.NewRow()
      $dataRow[$global:smoTypeColumnName] = $type
      $dataRow[$global:smoUrnColumnName] = $objUrn
      $dataRow[$global:smoPropertyNameColumnName] = $propertyName
      $dataRow[$global:smoPropertyValueColumnName] = $value
      
      $global:smoStageDataTable.Rows.Add($dataRow)
      
   }
}
   

###############################################################################
# Collection functions
###############################################################################
function Collect-CpuData
{

   &{ # PS Try
      # Get the Instance-level Performance Data.  An instance is identified 
      # by its process-id
      $processId = Get-ProcessId;
      
      Write-ScriptVerbose "Get WMI percent cpu time for process id = $processId"
      # Get the total processor time from the wmi object
      # PercentProcessorTime is bad property name, it is actually counting the 
      # total number of ticks (100NS based)
      # the instance has spent on processors.
      (Get-WmiObject Win32_PerfRawData_PerfProc_Process -filter "IDProcess = ''$processId''") | 
      %{ $instanceProcessorUsage = $_.PercentProcessorTime };
      
      Write-ScriptVerbose "Get current time for collection time"
      # Find the current number of ticks
      $instanceCollectTime = [DateTime]::UtcNow.Ticks
      
      Write-ScriptVerbose "Get WMI machine cpu time and time stamp"
      # Get the Machine-level Performance Data
      (Get-WmiObject Win32_PerfRawData_PerfOS_Processor -filter "Name = ''_Total''") |
      %{ $computerIdleTime = $_.PercentProcessorTime; 
      $computerCollectTime = $_.TimeStamp_Sys100NS };
      
      Write-ScriptVerbose "Get WMI cpu details"
      # Get the processor details
      (Get-WmiObject Win32_Processor) | 
      %{$cpuName = $_.Name;
      $cpuCaption = $_.Caption;
      $cpuFamily = $_.Family; 
      $architecture = $_.Architecture; 
      $cpuMaxClockSpeed = $_.MaxClockSpeed;
      $clockSpeed = $_.CurrentClockSpeed; 
      $l2CacheSize = $_.L2CacheSize; 
      $l3CacheSize = $_.L3CacheSize };
      
      [Int32] $numProcessors = [System.Environment]::ProcessorCount
      
      Write-ScriptVerbose "Add row to cpu information"
      Add-StageCpuRow   $numProcessors $cpuName $cpuCaption $cpuFamily $architecture $cpuMaxClockSpeed $clockSpeed $l2CacheSize $l3CacheSize $instanceProcessorUsage $instanceCollectTime $computerIdleTime $computerCollectTime
      
      $global:cpuStageDataTable
   }
   # PS Catch
   trap [Exception]
   {
      Resolve-Error
      Write-ScriptError "Caught exception while collecting cpu properties.  A WMI query might have failed."
   }   
   
}

function Collect-VolumeData
{
   &{ # PS Try
      if( Get-IsWmiVolumeQueryAvailable )
      {
         # A null DriveLetter indicates that the volume is a mount point
         # Casting DriveLetter to [Boolean] results in False if it is null 
         Write-ScriptVerbose "Collecting volume information using Win32_Volume"
         (Get-Wmiobject Win32_Volume -filter "DriveType = 3") | 
         %{ Add-StageVolumeRow $_.DeviceId $_.Name $_.Capacity $_.FreeSpace }
      }
      else
      {
         # logical disk only collects disk information, not mount point information
         # hence passing in false as is_mount_point parameter
         Write-ScriptVerbose "Collecting volume information using Win32_LogicalDisk"
         (Get-Wmiobject Win32_LogicalDisk -filter "DriveType = 3") | 
         %{ Add-StageVolumeRow $_.DeviceId $_.Name $_.Size $_.FreeSpace }
      }
      
      $global:volumeStageDataTable
   }
   # PS Catch
   trap [Exception]
   {
      Resolve-Error
      Write-ScriptError "Caught exception while collecting volume properties.  A WMI query might have failed."
   }   
}

function Collect-SmoData
{
   
   &{ # PS try
      $sqlConnection = Get-Connection
      $serverConnection = New-Object Microsoft.SqlServer.Management.Common.ServerConnection $sqlConnection
      $server = New-Object Microsoft.SqlServer.Management.Smo.Server($serverConnection);
      
      # remove configurations from this table
      $objectsQuery = "SELECT object_type, sfc_query 
               FROM [msdb].[dbo].[sysutility_mi_smo_objects_to_collect_internal] AS sfc_queries";
      
      $sfcQueries = Get-SqlDataTable $objectsQuery | %{ $_.Rows }
      
      foreach ($sfcQueryRow in $sfcQueries)
      {
         [Int32] $object_type = $sfcQueryRow.object_type;
         $sfcQueryString = $sfcQueryRow.sfc_query.ToString();
   
         Write-ScriptVerbose "Retrieving list of properties to collect"
         $propertiesQuery = "SELECT property_name 
                        FROM [msdb].[dbo].[sysutility_mi_smo_properties_to_collect_internal] 
                        WHERE object_type ="+ $object_type.ToString();
         $properties = Get-SqlDataTable $propertiesQuery | %{ $_.Rows } | foreach { $_.property_name };
         
         Write-ScriptVerbose "Collecting smo information for sfc query $sfcQueryString"
         $oq = New-Object Microsoft.SqlServer.Management.Sdk.Sfc.SfcObjectQuery($server);
         $exp = New-Object Microsoft.SqlServer.Management.Sdk.Sfc.SfcQueryExpression($sfcQueryString);
         
         &{ # PS try
         
            # The following call is not itempotent.  The code does not run the same
            # in debug mode. If you are running in debug mode, any value display
            # invalidates the foreach statement.
            $en = $oq.ExecuteIterator($exp, $null, $null);   
            
            foreach($obj in $en)
            {
               $objUrn = $obj.Urn.ToString();
               Write-ScriptVerbose "Collecting smo information for urn $objUrn"
               
               # For each property get the value and insert it into the smo stage data table
               # the statment $obj.$_ retrieves the propety value from the object
               # going through the PS provider.  If the property is not found or throws an
               # exception from the SMO side, the PS provider wraps the property and returns
               # an empty value.
               $properties | 
               %{ 
                  if ($_ -eq "ProcessorUsage")
                  {
                      # for ProcessorUsage, we are in fact collecting the
                      # the data by ourselves in our own staging table.
                      # and we do not want to call SMO as this property
                      # may not exist on downlevel server.
                      # so here, we put a dummy value and later during upload
                      # we replace it with our real value.
                      # Note that we a similar situation for VolumeFreeSpace
                      # but the solution is different. For VolumeFreeSpace property
                      # it is not put in the sysutility_mi_smo_properties_to_collect_internal
                      # and we collect through other means and then do a join on the UCP
                      # side, versus for ProcessorUsage, we put the property in the list
                      # and during MI collection, we replace it with our own value.
                      # The difference is inconsistent and we should change them to behave
                      # the same in future releases.
                      Add-StageSmoRow $object_type $objUrn $_ [object]0
                  }
                  else
                  {
                      Add-StageSmoRow $object_type $objUrn $_ $obj.$_ 
                  }
                  
                  # if this property is FileName, we append volume/mount point info.
                  if($_ -eq "FileName")
                  {
                     Write-ScriptVerbose "Property is FileName, getting volume information"
                     [String] $mountPointName = Get-MountPointName $obj.FileName
                     Add-StageSmoRow $object_type $objUrn "mount_point_name" $mountPointName 
                     
                     [String] $deviceId = Get-DeviceIdFromMountPointName $mountPointName
                     Add-StageSmoRow $object_type $objUrn "volume_device_id" $deviceId
                  }
               }
               
               $psPath = Convert-UrnToPath $objUrn
               ("powershell_path", $psPath),
               ("parent_name", $obj.Parent.Name),              # If no Parent exists, Ps will return null
               ("grandparent_name", $obj.Parent.Parent.Name) | # If no Parent.Parent exists, Ps will return null
                  %{ ,
                     $propertyName = $_[0]                     
                     [String] $value = $_[1]    # Cast to string results in $null values becoming ""
                     if($value -ne "")
                     {
                        Add-StageSmoRow $object_type $objUrn $propertyName $value
                     }
                  }  
            }
         } # PS catch exception
         trap [Exception]
         {
            Resolve-Error
            Write-ScriptError "Caught exception while collecting smo properties."
         }   
      }
      $global:smoStageDataTable
   } # PS catch exception
   trap [Exception]
   {
      Resolve-Error
          Write-ScriptError "Caught exception while collecting smo properties."
   }   
}

###############################################################################
# Functions that mange the server tables by clearing and loading collected data 
###############################################################################
function Clear-AllStagedData
{
   # TRUNCATE TABLE removes all rows from a table without logging the 
   # individual row deletes.

   $cpuClearQuery = "TRUNCATE TABLE $global:cpuStageTableName; "
   $volumeClearQuery = "TRUNCATE TABLE $global:volumeStageTableName; "
   $smoClearQuery = "TRUNCATE TABLE $global:smoStageTableName; "
   
   Invoke-SubmitSqlCommandNonQuery "$cpuClearQuery $volumeClearQuery $smoClearQuery"
}

function Collect-AllStagedData
{

   Collect-CpuData | Out-Null
      
   # Should we collect cpu data again?
   # This will happen if the script is
   # run when there is no data yet in
   # the cpu staging table.
   if(Get-ShouldCollectCpu)
   {
      #Wait for some time to pass
      Write-ScriptVerbose "Waiting $sleepTimeoutSeconds seconds to collect cpu data."
      Start-Sleep -Seconds $sleepTimeoutSeconds
      #Collect the data again
      Collect-CpuData | Out-Null
   }
   
   Collect-SmoData | Out-Null
   Collect-VolumeData | Out-Null
}

function Save-AllStagedData
{
   Invoke-BulkCopyCommand $global:cpuStageDataTable
   Invoke-BulkCopyCommand $global:volumeStageDataTable
   Invoke-BulkCopyCommand $global:smoStageDataTable
}

function Invoke-StageData
{

   &{ # Try 
      
      Collect-AllStagedData
      
      Invoke-BeginTransaction
      
      Clear-AllStagedData
      Save-AllStagedData
      
      Invoke-CommitTransaction
      Remove-Connection
   }
   trap [Exception] # Catch
   {
      Write-ScriptWarning "Error occurred during execution of script."
      Write-ScriptWarning "Transaction will be rolled back."
      
      Resolve-Error
      
      Invoke-RollbackTransaction
      Remove-Connection
      
      # With ErrorActionPreference=Stop the following line will stop the script
      Write-ScriptError "Error.  Transaction was rolled back"
   }
}

if(Get-IsAgentStep)
{
   Invoke-StageData
}', 
		@database_name=N'master', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Upload to Utility Control Point]    Script Date: 11/20/2014 2:30:24 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Upload to Utility Control Point', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC [msdb].[dbo].[sp_sysutility_mi_upload]', 
		@database_name=N'msdb', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'sysutility_mi_collect_and_upload', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=15, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140918, 
		@active_end_date=99991231, 
		@active_start_time=500, 
		@active_end_time=400, 
		@schedule_uid=N'e2ca4fdd-33f4-4ba8-8c9a-da466ce1eb25'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Utility - Managed Instance]    Script Date: 11/20/2014 2:30:24 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Utility - Managed Instance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Utility - Managed Instance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'sysutility_mi_collect_performance', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Collect performance information', 
		@category_name=N'Utility - Managed Instance', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Collect DAC execution statistics]    Script Date: 11/20/2014 2:30:24 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Collect DAC execution statistics', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC [msdb].[dbo].[sp_sysutility_mi_collect_dac_execution_statistics_internal]', 
		@database_name=N'msdb', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'sysutility_mi_collect_performance', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=2, 
		@freq_subday_interval=15, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20140918, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'2bc2c377-f0c8-4962-9488-2ff7bf4d1b8f'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO
EXEC msdb.dbo.sp_add_operator @name=N'DBA Group', 
		@enabled=1, 
		@weekday_pager_start_time=90000, 
		@weekday_pager_end_time=180000, 
		@saturday_pager_start_time=90000, 
		@saturday_pager_end_time=180000, 
		@sunday_pager_start_time=90000, 
		@sunday_pager_end_time=180000, 
		@pager_days=0, 
		@email_address=N'DL-KMHP_MSSQLDBAGroup@kmhp.com', 
		@category_name=N'[Uncategorized]'
GO
EXEC msdb.dbo.sp_add_operator @name=N'Jeff', 
		@enabled=1, 
		@weekday_pager_start_time=80000, 
		@weekday_pager_end_time=180000, 
		@saturday_pager_start_time=90000, 
		@saturday_pager_end_time=180000, 
		@sunday_pager_start_time=90000, 
		@sunday_pager_end_time=180000, 
		@pager_days=62, 
		@email_address=N'jshurak@amerihealthcaritas.com', 
		@category_name=N'[Uncategorized]'
GO
EXEC msdb.dbo.sp_add_proxy @proxy_name=N'CMS',@credential_name=N'CMS', 
		@enabled=1
GO
EXEC msdb.dbo.sp_grant_proxy_to_subsystem @proxy_name=N'CMS', @subsystem_id=3
GO
EXEC msdb.dbo.sp_add_proxy @proxy_name=N'UtilityAgentProxy_7A189120-ABCD-47D5-946B-C0E3B8A15C83',@credential_name=N'UtilityAgentProxyCredential_7A189120-ABCD-47D5-946B-C0E3B8A15C83', 
		@enabled=1
GO
EXEC msdb.dbo.sp_grant_proxy_to_subsystem @proxy_name=N'UtilityAgentProxy_7A189120-ABCD-47D5-946B-C0E3B8A15C83', @subsystem_id=3
GO
EXEC msdb.dbo.sp_grant_login_to_proxy @proxy_name=N'UtilityAgentProxy_7A189120-ABCD-47D5-946B-C0E3B8A15C83', @msdb_role=N'dc_admin'
GO
exec sp_CONFIGURE 'show advanced options', 1
reconfigure
exec sp_configure 'recovery interval (min)', 0
exec sp_configure 'allow updates', 0
exec sp_configure 'user connections', 0
exec sp_configure 'locks', 0
exec sp_configure 'open objects', 0
exec sp_configure 'fill factor (%)', 0
exec sp_configure 'disallow results from triggers', 0
exec sp_configure 'nested triggers', 1
exec sp_configure 'server trigger recursion', 1
exec sp_configure 'remote access', 1
exec sp_configure 'default language', 0
exec sp_configure 'cross db ownership chaining', 0
exec sp_configure 'max worker threads', 0
exec sp_configure 'network packet size (B)', 4096
exec sp_configure 'remote proc trans', 0
exec sp_configure 'c2 audit mode', 0
exec sp_configure 'default full-text language', 1033
exec sp_configure 'two digit year cutoff', 2049
exec sp_configure 'index create memory (KB)', 0
exec sp_configure 'priority boost', 0
exec sp_configure 'remote login timeout (s)', 10
exec sp_configure 'remote query timeout (s)', 600
exec sp_configure 'cursor threshold', -1
exec sp_configure 'set working set size', 0
exec sp_configure 'user options', 0
exec sp_configure 'affinity mask', 0
exec sp_configure 'max text repl size (B)', 65536
exec sp_configure 'media retention', 0
exec sp_configure 'cost threshold for parallelism', 20
exec sp_configure 'max degree of parallelism', 8
exec sp_configure 'min memory per query (KB)', 1024
exec sp_configure 'query wait (s)', -1
exec sp_configure 'min server memory (MB)', 16
exec sp_configure 'max server memory (MB)', 12288
exec sp_configure 'query governor cost limit', 0
exec sp_configure 'lightweight pooling', 0
exec sp_configure 'scan for startup procs', 0
exec sp_configure 'affinity64 mask', 0
exec sp_configure 'affinity I/O mask', 0
exec sp_configure 'affinity64 I/O mask', 0
exec sp_configure 'transform noise words', 0
exec sp_configure 'precompute rank', 0
exec sp_configure 'PH timeout (s)', 60
exec sp_configure 'clr enabled', 1
exec sp_configure 'max full-text crawl range', 4
exec sp_configure 'ft notify bandwidth (min)', 0
exec sp_configure 'ft notify bandwidth (max)', 100
exec sp_configure 'ft crawl bandwidth (min)', 0
exec sp_configure 'ft crawl bandwidth (max)', 100
exec sp_configure 'default trace enabled', 1
exec sp_configure 'blocked process threshold (s)', 0
exec sp_configure 'in-doubt xact resolution', 0
exec sp_configure 'remote admin connections', 0
exec sp_configure 'common criteria compliance enabled', 0
exec sp_configure 'EKM provider enabled', 0
exec sp_configure 'backup compression default', 1
exec sp_configure 'filestream access level', 0
exec sp_configure 'optimize for ad hoc workloads', 0
exec sp_configure 'access check cache bucket count', 0
exec sp_configure 'access check cache quota', 0
exec sp_configure 'Agent XPs', 1
exec sp_configure 'Database Mail XPs', 1
exec sp_configure 'SMO and DMO XPs', 1
exec sp_configure 'Ole Automation Procedures', 1
exec sp_configure 'xp_cmdshell', 1
exec sp_configure 'Ad Hoc Distributed Queries', 0
exec sp_configure 'Replication XPs', 0
exec sp_configure 'contained database authentication', 0
exec sp_CONFIGURE 'show advanced options', 0
reconfigure
EXEC master.dbo.sp_addlinkedserver @server = N'RPT_REG_1', @srvproduct=N'Sybase', @provider=N'MSDASQL', @provstr=N'DSN=RPT_REG_1', @catalog=N'FACETS'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'RPT_REG_1',@useself=N'False',@locallogin=NULL,@rmtuser=N'mssqlproduser',@rmtpassword='########'

GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'collation compatible', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'rpc', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'rpc out', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'use remote collation', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_1', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO
EXEC master.dbo.sp_addlinkedserver @server = N'RPT_REG_2', @srvproduct=N'Sybase', @provider=N'MSDASQL', @provstr=N'DSN=RPT_REG_2', @catalog=N'FACETS'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'RPT_REG_2',@useself=N'False',@locallogin=NULL,@rmtuser=N'mssqlproduser',@rmtpassword='########'

GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'collation compatible', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'rpc', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'rpc out', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'use remote collation', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_2', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO
EXEC master.dbo.sp_addlinkedserver @server = N'RPT_REG_3', @srvproduct=N'Sybase', @provider=N'MSDASQL', @provstr=N'DSN=RPT_REG_3', @catalog=N'FACETS'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'RPT_REG_3',@useself=N'False',@locallogin=NULL,@rmtuser=N'mssqlproduser',@rmtpassword='########'

GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'collation compatible', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'rpc', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'rpc out', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'use remote collation', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_3', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO
EXEC master.dbo.sp_addlinkedserver @server = N'RPT_REG_4', @srvproduct=N'Sybase', @provider=N'MSDASQL', @provstr=N'DSN=RPT_REG_4', @catalog=N'FACETS'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'RPT_REG_4',@useself=N'False',@locallogin=NULL,@rmtuser=N'mssqlproduser',@rmtpassword='########'

GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'collation compatible', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'rpc', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'rpc out', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'use remote collation', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_4', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO
EXEC master.dbo.sp_addlinkedserver @server = N'RPT_REG_5', @srvproduct=N'Sybase', @provider=N'MSDASQL', @provstr=N'DSN=RPT_REG_5', @catalog=N'FACETS'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'RPT_REG_5',@useself=N'False',@locallogin=NULL,@rmtuser=N'mssqlproduser',@rmtpassword='########'

GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'collation compatible', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'rpc', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'rpc out', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'use remote collation', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_5', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO
EXEC master.dbo.sp_addlinkedserver @server = N'RPT_REG_6', @srvproduct=N'Sybase', @provider=N'MSDASQL', @provstr=N'DSN=RPT_REG_6', @catalog=N'FACETS'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'RPT_REG_6',@useself=N'False',@locallogin=NULL,@rmtuser=N'mssqlproduser',@rmtpassword='########'

GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'collation compatible', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'rpc', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'rpc out', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'use remote collation', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'RPT_REG_6', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO
/* sp_help_revlogin script 
** Generated Nov 20 2014  2:30PM on PHLDVWSSQL002\DVS1201 */
 
 
-- Login: ##MS_PolicyTsqlExecutionLogin##
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD = 0x0200A0C7F25E9C0C60A1691464E445A9CF834345772FBEACCF095473CEC5B2AD3E933BE3B8755B0CCDBC74183BB633CF71B646CA4CE2BFF310CDFD65A231865319C50CFD82D2 HASHED, SID = 0xFB5428192C68DE479445435923D3CE58, DEFAULT_DATABASE = [master], CHECK_POLICY = ON, CHECK_EXPIRATION = OFF; ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
 
-- Login: KMHP\jstarkw
CREATE LOGIN [KMHP\jstarkw] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: KMHP\SCM-SQL12
CREATE LOGIN [KMHP\SCM-SQL12] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: NT SERVICE\SQLWriter
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: NT SERVICE\Winmgmt
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: NT SERVICE\MSSQL$DVS1201
CREATE LOGIN [NT SERVICE\MSSQL$DVS1201] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: NT AUTHORITY\SYSTEM
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: NT SERVICE\SQLAgent$DVS1201
CREATE LOGIN [NT SERVICE\SQLAgent$DVS1201] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: link_admin
CREATE LOGIN [link_admin] WITH PASSWORD = 0x02000BA0883118FCE0F5084815E3E5DE429E616FC0ABD078DA6151F87AE4639142D7B7D535E8ED8E191BE05E6DD806F1DFB05C09C9189FBD4184EC0CF726A6698611F0469DDE HASHED, SID = 0x8CB30B63B18CA34E89A321ED06CF95BC, DEFAULT_DATABASE = [master], CHECK_POLICY = OFF, CHECK_EXPIRATION = OFF
 
-- Login: ##MS_PolicyEventProcessingLogin##
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD = 0x020070229A142E9C534127E51D49F7BFC58F9F79BD8B5BBA8187527B98CFAFC1D4331175258BD250A7288C2C23D400BDEBF25D636D7E08F60BEC86C9C4DB4A09400849A0BC23 HASHED, SID = 0xDB4F7D5FDDA61243B38C42099BBCD7FB, DEFAULT_DATABASE = [master], CHECK_POLICY = ON, CHECK_EXPIRATION = OFF; ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
 
-- Login: KMHP-DEV\SCL-tfsDV13setup
CREATE LOGIN [KMHP-DEV\SCL-tfsDV13setup] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: KMHP-DEV\SCL-tfsDV13svc
CREATE LOGIN [KMHP-DEV\SCL-tfsDV13svc] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: KMHP-DEV\SCL-tfsDV13wsssvc
CREATE LOGIN [KMHP-DEV\SCL-tfsDV13wsssvc] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: KMHP-DEV\SCL-tfsDV13rpts
CREATE LOGIN [KMHP-DEV\SCL-tfsDV13rpts] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: KMHP\vgupta
CREATE LOGIN [KMHP\vgupta] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: KMHP\Ksi
CREATE LOGIN [KMHP\Ksi] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: KMHP\jshurak
CREATE LOGIN [KMHP\jshurak] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: KMHP\SQL DBA Team
CREATE LOGIN [KMHP\SQL DBA Team] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: KMHP\tleiker
CREATE LOGIN [KMHP\tleiker] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: POM_ADMIN
CREATE LOGIN [POM_ADMIN] WITH PASSWORD = 0x02009E31A626A865FBF7B4432CF06D83633AEF46ED5537BE3151302D98DB507D1EA73AC37F31E3B51FB90215C6032FE93098A85A09FE2B856169E5ED2F29C8E0BD429AC39C3C HASHED, SID = 0xE5CB2D5E4D6E2740A86AEA82B66729F2, DEFAULT_DATABASE = [master], CHECK_POLICY = OFF, CHECK_EXPIRATION = OFF
 
-- Login: test
CREATE LOGIN [test] WITH PASSWORD = 0x02009CECD57DE94C6B52CB7D5EACF6541B63B2B80B7852D279064DDFE590FF3D252D4381EECF7176BF8468184A05C287C47514A2BC1B06BE927438416F63EC01E38FC8F38C0A HASHED, SID = 0x2D4372C80ADC9F45A17A0BB7AF1E3B21, DEFAULT_DATABASE = [master], CHECK_POLICY = OFF, CHECK_EXPIRATION = OFF
 
-- Login: KMHP\cstrand
CREATE LOGIN [KMHP\cstrand] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: KMHP\jboyle
CREATE LOGIN [KMHP\jboyle] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: KMHP\jferro
CREATE LOGIN [KMHP\jferro] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: KMHP\jparkhi
CREATE LOGIN [KMHP\jparkhi] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: KMHP\kfluehr
CREATE LOGIN [KMHP\kfluehr] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: KMHP\mwerner
CREATE LOGIN [KMHP\mwerner] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: KMHP\wsc
CREATE LOGIN [KMHP\wsc] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: wtx_edi
CREATE LOGIN [wtx_edi] WITH PASSWORD = 0x02003EC47A32F27326E58EEC58FBC3B596022F02DB2A73385A15B7DAF6AD2E2522EAB194CA87878A481C5565A03C8DBEC6ACFEDE5ED9480C49A62690896C0DCBB49E0AAFE166 HASHED, SID = 0xD8ADAB7909E40C429D24EB947FEE23DA, DEFAULT_DATABASE = [WTX_APP], CHECK_POLICY = OFF, CHECK_EXPIRATION = OFF
 
-- Login: KMHP\asrivas
CREATE LOGIN [KMHP\asrivas] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: KMHP\lthirup
CREATE LOGIN [KMHP\lthirup] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: KMHP\rmcfate
CREATE LOGIN [KMHP\rmcfate] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: KMHP\svc-egdbuser
CREATE LOGIN [KMHP\svc-egdbuser] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: KMHP\AppV_Administrators-QA
CREATE LOGIN [KMHP\AppV_Administrators-QA] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: KMHP\AppV_Servers-QA
CREATE LOGIN [KMHP\AppV_Servers-QA] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: KMHP-DEV\svc-ctx76
CREATE LOGIN [KMHP-DEV\svc-ctx76] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: KMHP-DEV\Phldvwsx7pvs001$
CREATE LOGIN [KMHP-DEV\Phldvwsx7pvs001$] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
 
-- Login: KMHP-DEV\Phldvwsx7dc001$
CREATE LOGIN [KMHP-DEV\Phldvwsx7dc001$] FROM WINDOWS WITH DEFAULT_DATABASE = [master]
