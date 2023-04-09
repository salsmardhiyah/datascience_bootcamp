-- soal 1
SELECT 
	nama,
	email,
	bulan_lahir,
	tanggal_registrasi
FROM
	rakamin_customer rc
WHERE
	bulan_lahir IN ('Januari', 'Februari', 'Maret')
AND
	tanggal_registrasi BETWEEN '2012-01-01' AND '2012-03-31'
AND 
	(LOWER(email) LIKE '%yahoo%' OR 
	LOWER(email) LIKE '%roketmail%')
;

-- soal 2
SELECT
	id_order,
	id_pelanggan,
	harga,
	harga*(1+ppn) AS harga_inc_ppn,
	CASE
		WHEN harga*(1+ppn) > 50000 THEN 'HIGH'
		WHEN harga*(1+ppn) > 20000 THEN 'MEDIUM'
		ELSE 'LOW'
	END AS spending_bucket
FROM 
	rakamin_order
ORDER BY 4 DESC
;

-- soal 3
SELECT
	id_merchant,
	COUNT(id_order) as jumlah_order,
	SUM(harga) as jumlah_pendapatan_exc_ppn
FROM 
	rakamin_order
GROUP BY
	id_merchant
ORDER BY 
	3 DESC
;

-- soal 4
SELECT
	metode_bayar,
	COUNT(id_order) as frekuensi
FROM
	rakamin_order
GROUP BY
	metode_bayar
HAVING COUNT(id_order) > 10
ORDER BY
	2 DESC
;

-- soal 5
WITH populasi_pelanggan AS (
	SELECT
		kota,
		COUNT(kota) as populasi
	FROM rakamin_customer_address
	GROUP BY 
		1)
SELECT 
	MIN(populasi) as min_populasi, 
	MAX(populasi) as max_populasi
FROM populasi_pelanggan
;

-- soal 6
SELECT
	rm.nama_merchant,
	ro.metode_bayar,
	COUNT(ro.metode_bayar) AS frekuensi
FROM 
	rakamin_order ro
JOIN
	rakamin_merchant rm
ON ro.id_merchant = rm.id_merchant
GROUP BY
	rm.nama_merchant,
	ro.metode_bayar
ORDER BY 1
;

-- soal 7
WITH trx AS (
	SELECT
		id_pelanggan,
		SUM(kuantitas) as total_kuantitas
	FROM
		rakamin_order
	GROUP BY 
		id_pelanggan
	HAVING SUM(kuantitas) > 5
)
SELECT 
	rc.id_pelanggan,
	trx.total_kuantitas,
	rc.nama,
	rc.email
FROM trx
JOIN rakamin_customer rc
ON rc.id_pelanggan = trx.id_pelanggan
;