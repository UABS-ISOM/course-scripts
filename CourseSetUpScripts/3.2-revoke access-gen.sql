USE master

Declare @DBName SYSNAME
Declare @UPI Varchar(11)
Declare @DBNameSuffix varchar(1024)

Set @DBNameSuffix = 'LabTest'

Declare #ExistingDBList CURSOR FOR
Select upi from [330Admin]..[Student] -- change this accordingly
order by upi

OPEN #ExistingDBList 
FETCH NEXT FROM #ExistingDBList into @UPI

WHILE (@@Fetch_Status = 0)
BEGIN
	SELECT @DBName = @UPI + '_' + @DBNameSuffix

    PRINT 'use [' + @DBName + ']'
    PRINT 'GO'

	PRINT 'exec sp_dropuser ''UOA\' + @upi + ''''
	PRINT 'GO'
	PRINT ''

   FETCH NEXT FROM #ExistingDBList into @UPI
END

close #ExistingDBList
deallocate #ExistingDBList
