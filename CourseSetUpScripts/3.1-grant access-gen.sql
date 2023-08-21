USE master

Declare @DBName SYSNAME
Declare @UPI Varchar(11)
Declare @DBNameSuffix varchar(1024)
declare @admin varchar(11)

Set @DBNameSuffix = '_AWLT' -- change this accordingly
set @admin = 'sa'

Declare #ExistingDBList CURSOR FOR
Select upi from [330Admin]..[Student] -- change this accordingly
order by upi

OPEN #ExistingDBList 
FETCH NEXT FROM #ExistingDBList into @UPI

WHILE (@@Fetch_Status = 0)
BEGIN
	SELECT @DBName = @UPI + @DBNameSuffix

    PRINT 'use [' + @DBName + ']'
    PRINT 'GO'

	PRINT 'exec sp_changedbowner [' + @admin + '], ''true'''
	PRINT 'GO'
	
	PRINT 'exec sp_addrolemember ''db_owner'', [uoa\' + @UPI + ']'
	PRINT 'GO'

	PRINT 'ALTER USER [uoa\' + @upi + '] WITH DEFAULT_SCHEMA = dbo'
	PRINT 'GO'

	PRINT 'ALTER DATABASE '+ @DBName + ' SET RECOVERY SIMPLE'
	PRINT 'GO'
	PRINT ''

   FETCH NEXT FROM #ExistingDBList into @UPI
END

close #ExistingDBList
deallocate #ExistingDBList
