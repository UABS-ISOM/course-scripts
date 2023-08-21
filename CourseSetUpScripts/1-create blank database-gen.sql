Declare @DBName SYSNAME
Declare @DBFileName SYSNAME
Declare @UPI Varchar(11)
Declare @DataPath Varchar(1024)
Declare @LogPath Varchar(1024)
Declare @DBNameSuffix varchar(1024)

-- change these accordingly
Set @DataPath = 'E:\Program Files\Microsoft SQL Server\MSSQL12.INFOSYS330\MSSQL\DATA\students-2019-s1\'
Set @LogPath =  @DataPath;
Set @DBNameSuffix = '_AWLT'


DECLARE @count INT = 0;
Declare #ExistingDBList CURSOR LOCAL FOR
Select upi from [330Admin]..Student -- change this accordingly
order by upi;

OPEN #ExistingDBList ;
FETCH NEXT FROM #ExistingDBList into @UPI;

WHILE (@@Fetch_Status = 0)
BEGIN
	SELECT	@DBName = @UPI + @DBNameSuffix,
			@DBFileName = @DBNameSuffix + '_' + @UPI,
			@count += 1;
	
	PRINT '-- [' + CAST(@count AS CHAR(3)) + '] Create Database ' + @DBName
    PRINT 'CREATE DATABASE ['+ @DBName + ']  ON (NAME = N''' + @DBName + '_Data'', '
		+'FILENAME = N''' + @DataPath  + @DBFileName+ '_Data.MDF'' , SIZE = 5120KB , MAXSIZE = 614400KB , FILEGROWTH = 51200KB) ' --5 MB starting, 600 MB max, 50MB growth
		+'LOG ON (NAME = N''' + @DBName + '_Log'', FILENAME = N''' + @LogPath  + @DBFileName + '_Log.LDF''' + ', SIZE = 1, MAXSIZE = UNLIMITED, FILEGROWTH = 10%) '
		+'COLLATE SQL_Latin1_General_CP1_CI_AS'
    PRINT 'GO'

	FETCH NEXT FROM #ExistingDBList into @UPI
END

close #ExistingDBList
deallocate #ExistingDBList
