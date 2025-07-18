USE pti_mart;

-- Nama         : Akhul Ijtihad
-- NIM          : 23241025
-- Kelas        : PTI A / 4
-- Matakuliah   : Administrasi basis data

-- saol 1
SELECT nama_produk, SUM(qty) AS produk_terjual
FROM tr_penjualan_dqlab
GROUP BY nama_produk
HAVING SUM(qty);

-- Soal 2
SELECT nama_pelanggan, nilai_transaksi
FROM transaksi
ORDER BY nilai_transaksi DESC
LIMIT 1; 

-- Soal 3
SELECT p.nama_produk, p.kategori, p.harga
FROM produk p
LEFT JOIN detail_transaksi dt ON p.id_produk = dt.id_produk
WHERE dt.id_produk IS NULL;






-- Soal 1
SELECT 
tp.kode_pelanggan,
mp.nama_produk,
tp.qty,
mp.harga,
(tp.qty * mp.harga) AS total_harga
FROM tr_penjualan_dqlab tp
JOIN ms_produk_dqlab mp
ON tp.kode_produk = mp.kode_produk
WHERE (tp.qty * mp.harga) >= 200000
ORDER BY total_harga DESC;

-- Soal 2
SELECT 
    p.nama_pelanggan,
    SUM(t.qty * m.harga) AS total_transaksi
FROM tr_penjualan_dqlab t
JOIN ms_pelanggan_dqlab p ON t.kode_pelanggan = p.kode_pelanggan
JOIN ms_produk_dqlab m ON t.kode_produk = m.kode_produk
GROUP BY p.nama_pelanggan
ORDER BY total_transaksi DESC;


-- Soal 3
SELECT 
mp.nama_produk,
mp.kategori_produk,
mp.harga
FROM ms_produk_dqlab AS mp
LEFT JOIN tr_penjualan_dqlab tp 
ON mp.kode_produk = tp.kode_produk
WHERE tp.kode_produk IS NULL;

