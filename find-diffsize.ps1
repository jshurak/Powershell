function find-diffsize {

    param
    (
        [parameter(mandatory=$true)]
        [int]$ServerID,
        [string]$InstanceName,
        [int]$InstanceID,
        [string]$DatabaseName,
        [string]$DatabaseGUID
    )

$Query = @"
/*SQL Differential Backup Size Prediction / Estimation - Doug Zuckerman, 2009 - http://dougzuck.com */
 
IF isNULL(object_id('tempdb.dbo.##showFileStats'), 1) <> 1
	DROP TABLE ##showFileStats
 
CREATE TABLE ##showFileStats (
	fileID INT,
	fileGroup INT,
	totalExtents BIGINT,
	usedExtents BIGINT,
	logicalFileName VARCHAR (500),	
	filePath VARCHAR (1000)
)
 
IF isNULL(object_id('tempdb.dbo.##DCM'), 1) <> 1
	DROP TABLE ##DCM
 
CREATE TABLE ##DCM (
	parentObject VARCHAR(5000),
	[object] VARCHAR(5000),
	FIELD VARCHAR (5000),
	VALUE VARCHAR (5000)
)
 
/*we need to get a list of all the files in the database.  each file needs to be looked at*/	
INSERT INTO ##showFileStats EXEC('DBCC SHOWFILESTATS with tableresults')
 
DECLARE @currentFileID INT,
	@totalExtentsOfFile BIGINT,
	@dbname VARCHAR(100),
	@SQL VARCHAR(200),
	@currentDCM BIGINT,
	@step INT
 
SET @dbname = db_name()
SET @step = 511232
 
DECLARE myCursor SCROLL CURSOR FOR
SELECT fileID, totalExtents 
FROM ##showFileStats
 
OPEN myCursor
FETCH NEXT FROM myCursor INTO @currentFileID, @totalExtentsOfFile
 
/*look at each differential change map page in each data file of the database and put the output into ##DCM*/
WHILE @@FETCH_STATUS = 0 
BEGIN
 
	SET @currentDCM = 6
	WHILE @currentDCM <= @totalExtentsOfFile*8
	BEGIN	
		SET @SQL = 'dbcc page('+ @dbname + ', ' + CAST(@currentFileID AS VARCHAR) + ', ' + CAST(@currentDCM AS VARCHAR) + ', 3) WITH TABLERESULTS'
		INSERT INTO ##DCM EXEC (@SQL)
		SET @currentDCM = @currentDCM + @step
	END
 
	FETCH NEXT FROM myCursor INTO @currentFileID, @totalExtentsOfFile
END
CLOSE myCursor
DEALLOCATE myCursor
 
/*remove all unneeded rows from our results table*/
DELETE FROM ##DCM WHERE VALUE = 'NOT CHANGED' OR parentObject NOT LIKE 'DIFF_MAP%'
--SELECT * FROM ##DCM
 
/*sum the extentTally column*/
SELECT SUM (extentTally) AS ExtentsChanged, SUM(extentTally)/16 AS 'DifferentialSize' 
FROM
	/*create extentTally column*/
	(SELECT extentTally =
	CASE
		WHEN secondChangedExtent > 0 THEN CAST(secondChangedExtent AS BIGINT) - CAST(firstChangedExtent AS BIGINT) + 1
		ELSE 1
	END
	FROM
		/*parse the 'field' column to give us the first and last extents of the range*/
		(SELECT (SUBSTRING(FIELD,(SELECT CHARINDEX(':', FIELD, 0))+1,(CHARINDEX(')', FIELD, 0))-(CHARINDEX(':', FIELD, 0))-1))/8 AS firstChangedExtent,
		secondChangedExtent = 
		CASE	
			WHEN CHARINDEX(':', FIELD, CHARINDEX(':', FIELD, 0)+1) > 0 THEN (SUBSTRING(FIELD,(CHARINDEX(':', FIELD, CHARINDEX(':', FIELD, 0)+1)+1),(CHARINDEX(')', FIELD,CHARINDEX(')', FIELD, 0)+1))-(CHARINDEX(':', FIELD, CHARINDEX(':', FIELD, 0)+1))-1))/8
			ELSE ''
		END 
		FROM ##DCM)parsedFieldColumn)extentTallyColumn

"@

    Submit-SQLStatement -ServerInstance $InstanceName -Database $DatabaseName -Query $Query -ModuleName "find-diffsize" | % {
        $ExtentsChanged = $_.ExtentsChanged
        $DifferentialSize = $_.DifferentialSize
        
        Submit-SQLStatement -ServerInstance $CMSServer -Database $CMSDatabase -Module "find-diffsize" -Query "exec MonitoredDatabases_SetDatabases @DiffCatalog = 1, @DatabaseName = '$DatabaseName',@ServerID = $ServerID, @InstanceID = $InstanceID, @GUID = '$DatabaseGUID',@ExtentsChanged = $ExtentsChanged, @DifferentialSize = $DifferentialSize"
    }    
}