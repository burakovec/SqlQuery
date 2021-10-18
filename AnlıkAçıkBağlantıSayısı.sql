SELECT
COUNT(dbid) as ToplamBaglantiSayisi
FROM
 sys.sysprocesses
WHERE
 dbid > 0

SELECT
 DB_NAME(dbid) as Veritabani,
 COUNT(dbid) as ToplamBaglanti,
 loginame as Kullanici
FROM
 sys.sysprocesses
WHERE
 dbid > 0
GROUP BY
 dbid, loginame