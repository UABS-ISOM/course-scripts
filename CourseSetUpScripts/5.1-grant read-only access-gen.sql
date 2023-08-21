DECLARE @dbName sysname
DECLARE @upi varchar(10)

DECLARE cur CURSOR
FOR
SELECT 	UPI
FROM 	[330Admin]..student -- change this accordingly
UNION
SELECT 	UPI
FROM 	[330Admin]..staff -- change this accordingly
ORDER BY UPI

OPEN cur

FETCH NEXT FROM cur INTO @upi

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @dbName = 'AdventureWorks2008R2'
	PRINT 'use ' + QUOTENAME(@dbName)
	PRINT 'GO'
	
	PRINT 'CREATE USER [UOA\' + @upi + '] FOR LOGIN [UOA\' + @upi + ']'
	PRINT 'GO'
	PRINT 'exec sp_addrolemember ''db_datareader'', ''UOA\' + @upi + ''''
	PRINT 'GO'

	SET @dbName = 'AdventureWorksDW2008'
	PRINT 'use ' + QUOTENAME(@dbName)
	PRINT 'GO'
	
	PRINT 'CREATE USER [UOA\' + @upi + '] FOR LOGIN [UOA\' + @upi + ']'
	PRINT 'GO'
	PRINT 'exec sp_addrolemember ''db_datareader'', ''UOA\' + @upi + ''''
	PRINT 'GO'

	SET @dbName = 'AdventureWorks2014'
	PRINT 'use ' + QUOTENAME(@dbName)
	PRINT 'GO'
	
	PRINT 'CREATE USER [UOA\' + @upi + '] FOR LOGIN [UOA\' + @upi + ']'
	PRINT 'GO'
	PRINT 'exec sp_addrolemember ''db_datareader'', ''UOA\' + @upi + ''''
	PRINT 'GO'

	FETCH NEXT FROM cur INTO @upi
END

CLOSE cur
DEALLOCATE cur
