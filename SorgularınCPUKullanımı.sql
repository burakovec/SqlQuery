SELECT TOP 1000 ObjectName = OBJECT_SCHEMA_NAME(qt.objectid, qt.dbid) + '.' + OBJECT_NAME(qt.objectid, qt.dbid),
TexData = qt.text,
DiscReads = qs.total_physical_reads,
MemoryReads = qs.total_logical_reads,
Executions = qs.execution_count,
TotalCPUTime = qs.total_worker_time,
AvarageCPUTime = qs.total_worker_time/qs.execution_count,
DiscWaitAndCPUTime = qs.total_elapsed_time,
MemoryWrites = qs.max_logical_writes,
DateCached = qs.creation_time,
DatabaseName = DB_NAME(qt.dbid),
LastExecutionTime = qs.last_execution_time



FROM sys.dm_exec_query_stats AS qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS qt
ORDER BY qs.total_worker_time DESC;