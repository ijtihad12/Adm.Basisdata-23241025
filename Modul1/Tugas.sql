USE Akademik_Mahasiswa;
-- MAHASISWA
SELECT m.id_mahasiswa AS mahasiswa_id FROM MAHASISWA m;
SELECT m.id_mahasiswa AS mahasiswa_id, m.jurusan AS mahasiswa_jurusan FROM MAHASISWA m;

-- JADWAL
SELECT j.ruangan AS jadwal_ruangan FROM JADWAL j;
SELECT j.ruangan AS jadwal_ruangan, j.tanggal AS jadwal_tanggal FROM JADWAL j;

-- MATAKULIAH
SELECT mk.atribut AS matakuliah_atribut FROM MATAKULIAH mk;
SELECT mk.atribut AS matakuliah_atribut, mk.sks AS matakuliah_sks FROM MATAKULIAH mk;

-- KRS
SELECT k.tgl_krs AS krs_tanggal FROM KRS k;
SELECT k.id_mahasiswa AS krs_id_mahasiswa, k.total_sks AS krs_total_sks FROM KRS k;

-- MEMPUNYAI
SELECT mp.id_matkul AS mempunyai_id_matkul FROM MEMPUNYAI mp;
SELECT mp.id_matkul AS mempunyai_id_matkul, mp.id_tanggal AS mempunyai_id_tanggal FROM MEMPUNYAI mp;

-- DOSEN
SELECT d.nama_dosen AS dosen_nama FROM DOSEN d;
SELECT d.nama_dosen AS dosen_nama, d.no_tlpon AS dosen_no_tlpon FROM DOSEN d;

-- JURUSAN
SELECT j.nama_jurusan AS jurusan_nama FROM JURUSAN j;
SELECT j.nama_jurusan AS jurusan_nama, j.sks AS jurusan_sks FROM JURUSAN j;
