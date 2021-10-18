SELECT t.name AS TaploAdi,
	   s.row_count AS KayitSayisi
	   FROM sys.tables t JOIN sys.dm_db_partition_stats s
	   ON t.object_id = s.object_id
	   AND t.type_desc = 'USER_TABLE'
	   AND t.name NOT LIKE '%dss%'
	   AND s.index_id IN (0,1) ORDER BY s.row_count DESC