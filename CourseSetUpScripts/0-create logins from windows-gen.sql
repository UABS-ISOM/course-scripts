USE master

DECLARE @DBName SYSNAME
DECLARE @UPI VARCHAR(11)
DECLARE @DBNameSuffix VARCHAR(1024)
DECLARE @admin VARCHAR(11)

Declare #ExistingDBList CURSOR FOR
Select upi from [330Admin]..[Student] -- change this accordingly
order by upi

OPEN #ExistingDBList 
FETCH NEXT FROM #ExistingDBList into @UPI

WHILE (@@Fetch_Status = 0)
BEGIN

	PRINT 'CREATE LOGIN [UOA\' + @UPI + '] FROM WINDOWS';
	PRINT 'GO'

   FETCH NEXT FROM #ExistingDBList into @UPI
END

close #ExistingDBList
deallocate #ExistingDBList
