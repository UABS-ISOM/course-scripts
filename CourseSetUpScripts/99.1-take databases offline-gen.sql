Declare @DBName SYSNAME
Declare @UPI Varchar(11)

Declare #ExistingDBList CURSOR FOR
Select upi from [330Admin]..Student --change this accordingly
order by upi

OPEN #ExistingDBList 
FETCH NEXT FROM #ExistingDBList into @UPI

WHILE (@@Fetch_Status = 0)
BEGIN

    SELECT @DBName = @UPI + '_AWLT' --change this accordingly
	
	PRINT 'ALTER DATABASE [' + @DBName + '] SET OFFLINE WITH ROLLBACK IMMEDIATE'
	PRINT 'GO'

   FETCH NEXT FROM #ExistingDBList into @UPI
END

close #ExistingDBList
deallocate #ExistingDBList
