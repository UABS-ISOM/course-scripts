DECLARE @dbName sysname
DECLARE @upi varchar(10)

SET @dbName = 'AdventureWorksDW2014'
PRINT 'use ' + QUOTENAME(@dbName)

DECLARE cur CURSOR
FOR
SELECT 	UPI
FROM 	[330Admin]..Student
ORDER BY UPI

OPEN cur

FETCH NEXT FROM cur 
INTO @upi

WHILE @@FETCH_STATUS = 0
BEGIN

	PRINT 'GO'
	
	PRINT 'exec sp_dropuser ''UOA\' + @upi + ''''
	PRINT 'GO'
	FETCH NEXT FROM cur 
	INTO @upi
END

CLOSE cur
DEALLOCATE cur
