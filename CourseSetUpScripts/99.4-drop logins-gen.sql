USE master

Declare @DBName SYSNAME
Declare @UPI Varchar(11)
Declare @DBNameSuffix varchar(1024)
declare @admin varchar(11)

Declare #ExistingDBList CURSOR FOR
Select upi from [330Admin]..[Student] -- change this accordingly
order by upi

OPEN #ExistingDBList 
FETCH NEXT FROM #ExistingDBList into @UPI

WHILE (@@Fetch_Status = 0)
BEGIN

	PRINT 'DROP LOGIN [UOA\' + @UPI + ']';
	PRINT 'GO'

   FETCH NEXT FROM #ExistingDBList into @UPI
END

close #ExistingDBList
deallocate #ExistingDBList
