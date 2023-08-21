Declare @DBName SYSNAME
Declare @DBFileName SYSNAME
Declare @UPI VARCHAR(11)
DECLARE @BackupPath VARCHAR(1024)
Declare @DataPath VARCHAR(1024)
Declare @LogPath VARCHAR(1024)
Declare @DBNameSuffix VARCHAR(1024)
DECLARE @LogicalDataFilename SYSNAME;
DECLARE @LogicalLogFilename SYSNAME;

-- change these accordingly
SET @BackupPath = 'E:\Program Files\Microsoft SQL Server\MSSQL12.INFOSYS330\MSSQL\Backup\AdventureWorksLT2008R2.bak'
SET @DataPath = 'E:\Program Files\Microsoft SQL Server\MSSQL12.INFOSYS330\MSSQL\DATA\students-2019-s1\'
SET @LogPath = @DataPath

SET @DBNameSuffix = '_AWLT'
SET @LogicalDataFilename = 'AdventureWorksLT2008_Data'
SET @LogicalLogFilename = 'AdventureWorksLT2008_Log'

DECLARE @count INT = 0;
Declare #ExistingDBList CURSOR LOCAL FOR
Select upi from [330Admin]..student -- change this accordingly
order by upi;

OPEN #ExistingDBList ;
FETCH NEXT FROM #ExistingDBList into @UPI;

WHILE (@@Fetch_Status = 0)
BEGIN
	SELECT	@DBName = @UPI + @DBNameSuffix,
			@DBFileName = @DBNameSuffix + '_' + @UPI,
			@count += 1;

	PRINT '-- [' + CAST(@count AS CHAR(3)) + '] ' + @UPI
	
	--PRINT 'ALTER DATABASE [' + @DBName + '] SET SINGLE_USER WITH ROLLBACK IMMEDIATE'

	PRINT 'RESTORE DATABASE ' + @DBName
	PRINT ' FROM  DISK = ''' + @BackupPath + ''''
	PRINT ' WITH  FILE = 1,'
	PRINT ' MOVE N''' + @LogicalDataFilename + ''' TO ''' + @DataPath + @DBFileName + '.mdf'','              
	PRINT ' MOVE N''' + @LogicalLogFilename + ''' TO  ''' + @LogPath + @DBFileName + '_log.ldf'','

	PRINT ' NOUNLOAD,  REPLACE,  STATS = 10'
	PRINT ';'

	PRINT 'ALTER DATABASE [' + @DBName + '] SET MULTI_USER'
    PRINT 'GO'

	FETCH NEXT FROM #ExistingDBList into @UPI
END

close #ExistingDBList
deallocate #ExistingDBList
