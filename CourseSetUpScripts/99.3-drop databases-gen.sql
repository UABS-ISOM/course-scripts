Declare @DBName SYSNAME
Declare @UPI Varchar(11)

Declare #ExistingDBList CURSOR FOR
Select upi from [330Admin]..Student --change this accordingly

order by upi

OPEN #ExistingDBList 
FETCH NEXT FROM #ExistingDBList into @UPI

WHILE (@@Fetch_Status = 0)
BEGIN
    SELECT @DBName = @UPI + '' --change this accordingly
	PRINT 'DROP DATABASE [' + @DBName + ']'
	PRINT 'GO'

    SELECT @DBName = @UPI + '_A' --change this accordingly
	PRINT 'DROP DATABASE [' + @DBName + ']'
	PRINT 'GO'

    SELECT @DBName = @UPI + '_AWLT' --change this accordingly
	PRINT 'DROP DATABASE [' + @DBName + ']'
	PRINT 'GO'

	PRINT ''

   FETCH NEXT FROM #ExistingDBList into @UPI
END

close #ExistingDBList
deallocate #ExistingDBList
