

DECLARE @db sysname = DB_NAME();
DECLARE @SQL NVARCHAR(MAX);
SET @SQL = N'
USE ' + QUOTENAME(@db) + N'
EXEC sys.sp_fulltext_database @action =   ''' + CASE
                                                  WHEN DATABASEPROPERTY(@db, 'IsFulltextEnabled') = 1 THEN
                                                      'disable'
                                                  ELSE
                                                      'enable'
                                              END + N'''';

PRINT @SQL;
EXEC sys.sp_executesql @SQL;