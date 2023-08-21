USE master

Declare @DBName SYSNAME
Declare @UPI VARCHAR(7)
Declare @staffUPI VARCHAR(7)
Declare @DBNameSuffix VARCHAR(1024)

Set @DBNameSuffix = '_AWLT' -- change this accordingly

Declare #ExistingDBList CURSOR FOR
Select upi from [330Admin]..[Student] -- change this accordingly
order by upi

DECLARE #staffUPIs CURSOR SCROLL READ_ONLY FOR
SELECT upi FROM [330Admin]..[Staff] -- change this accordingly

OPEN #staffUPIs

OPEN #ExistingDBList 
FETCH NEXT FROM #ExistingDBList into @UPI

WHILE (@@Fetch_Status = 0)
BEGIN
	SELECT @DBName = @UPI + @DBNameSuffix

    PRINT 'use [' + @DBName + ']'
    PRINT 'GO'

	FETCH FIRST FROM #staffUPIs INTO @staffUPI
	WHILE (@@Fetch_Status = 0)
	BEGIN
		IF NOT (@UPI = @staffUPI)
		BEGIN

			PRINT 'CREATE USER [uoa\' + @staffUPI + '] FOR LOGIN [uoa\' + @staffUPI + ']'
			PRINT 'GO'
			PRINT 'exec sp_addrolemember ''db_datawriter'', [uoa\' + @staffUPI + ']'
			PRINT 'GO'
			PRINT 'exec sp_addrolemember ''db_datareader'', [uoa\' + @staffUPI + ']'
			PRINT 'GO'
			PRINT 'exec sp_addrolemember ''db_ddladmin'', [uoa\' + @staffUPI + ']'

		END

		FETCH NEXT FROM #staffUPIs INTO @staffUPI
	END

   FETCH NEXT FROM #ExistingDBList into @UPI
END

CLOSE #staffUPIs
DEALLOCATE #staffUPIs

close #ExistingDBList
deallocate #ExistingDBList
