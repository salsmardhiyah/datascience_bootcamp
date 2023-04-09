--soal 1
SELECT DISTINCT kota 
FROM rakamin_customer_address;

--soal 2
SELECT * FROM rakamin_order
ORDER BY tanggal_pembelian DESC
LIMIT 10;

--soal 3
SELECT * FROM rakamin_customer
WHERE penipu = 1;

--soal 4
SELECT * FROM rakamin_order
WHERE LOWER(metode_bayar) = 'shopeepay'
ORDER BY harga DESC;

--soal 5
CREATE TABLE IF NOT EXISTS rakamin_customer_address_tangerang AS(
SELECT * FROM rakamin_customer_address
WHERE LOWER(kota) = 'tangerang');

--soal 6
UPDATE rakamin_customer_address_tangerang
SET provinsi = 'Banten';

UPDATE rakamin_customer_address_tangerang
SET alamat = 'Karawaci'
WHERE id_pelanggan = 10;

--soal 7 
INSERT INTO rakamin_customer_address_tangerang 
VALUES(
	101,
	70,
	'Ciledug',
	'Tangerang',
	'Banten'
);

--soal 8 
DELETE FROM rakamin_customer_address_tangerang
WHERE id_alamat = 54;
