DECLARE @DBName SYSNAME
DECLARE @auid VARCHAR(11)

DECLARE #ExistingDBList CURSOR FOR
SELECT upi FROM [722Admin]..Student --change this accordingly
UNION
SELECT upi FROM [722Admin]..Staff --change this accordingly


OPEN #ExistingDBList 
FETCH NEXT FROM #ExistingDBList into @auid

WHILE (@@Fetch_Status = 0)
BEGIN

    SELECT @DBName = @auid + '' --change this accordingly
	
	PRINT 'ALTER DATABASE [' + @DBName + '] SET OFFLINE WITH ROLLBACK IMMEDIATE'
	PRINT 'EXEC master.dbo.sp_detach_db @dbname = N''' + @DBName + ''''
	PRINT 'GO'

   FETCH NEXT FROM #ExistingDBList into @auid
END

close #ExistingDBList

deallocate #ExistingDBList
