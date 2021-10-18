SELECT CAST(COUNT(1) * 8/1024.0 AS NUMERIC (10,2)) AS CachedDataMB,
CASE database_id
WHEN 32767 THEN '* Resource DB'
ELSE DB_NAME(database_id) END AS DatabaseName,
database_id DatabaseID
FROM sys.dm_os_buffer_descriptors
GROUP BY DB_NAME(database_id), database_id
ORDER BY DB_NAME(database_id)