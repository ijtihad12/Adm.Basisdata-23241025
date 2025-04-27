CREATE DATABASE Akademik_Mahasiswa;
USE Akademik_Mahasiswa;

-- Tabel MAHASISWA
CREATE TABLE MAHASISWA (
    id_mahasiswa INT PRIMARY KEY,
    matakuliah VARCHAR(100),
    dosen VARCHAR(100),
    jurusan VARCHAR(100),
    jadwal VARCHAR(100)
);
INSERT INTO MAHASISWA (id_mahasiswa, matakuliah, dosen, jurusan, jadwal) VALUES
(1, 'Basis Data', 'Budi Santoso', 'Teknik Informatika', 'Senin, 08:00'),
(2, 'Pemrograman Web', 'Rina Wijaya', 'Sistem Informasi', 'Selasa, 10:00'),
(3, 'Jaringan Komputer', 'Andi Pratama', 'Teknik Komputer', 'Rabu, 13:00');

-- Tabel JADWAL
CREATE TABLE JADWAL (
    id_jadwal INT PRIMARY KEY,
    ruangan VARCHAR(50),
    tanggal DATE
);
INSERT INTO JADWAL (id_jadwal, ruangan, tanggal) VALUES
(1, 'R101', '2025-05-01'),
(2, 'R102', '2025-05-02'),
(3, 'R103', '2025-05-03');

-- Tabel MATAKULIAH
CREATE TABLE MATAKULIAH (
    id_matkul INT PRIMARY KEY,
    atribut VARCHAR(100),
    id_mahasiswa INT,
    id_jadwal INT,
    sks INT,
    FOREIGN KEY (id_mahasiswa) REFERENCES MAHASISWA(id_mahasiswa),
    FOREIGN KEY (id_jadwal) REFERENCES JADWAL(id_jadwal)
);
INSERT INTO MATAKULIAH (id_matkul, atribut, id_mahasiswa, id_jadwal, sks) VALUES
(1, 'Teori + Praktikum', 1, 1, 3),
(2, 'Teori Saja', 2, 2, 2),
(3, 'Praktikum', 3, 3, 1);

-- Tabel KRS
CREATE TABLE KRS (
    id_mahasiswa INT,
    id_matkul INT,
    tgl_krs DATE,
    total_sks INT,
    PRIMARY KEY (id_mahasiswa, id_matkul),
    FOREIGN KEY (id_mahasiswa) REFERENCES MAHASISWA(id_mahasiswa),
    FOREIGN KEY (id_matkul) REFERENCES MATAKULIAH(id_matkul)
);
INSERT INTO KRS (id_mahasiswa, id_matkul, tgl_krs, total_sks) VALUES
(1, 1, '2025-04-20', 3),
(2, 2, '2025-04-21', 2),
(3, 3, '2025-04-22', 1);

-- Tabel MEMPUNYAI
CREATE TABLE MEMPUNYAI (
    id_matkul INT,
    id_tanggal INT,
    PRIMARY KEY (id_matkul, id_tanggal)
);
INSERT INTO MEMPUNYAI (id_matkul, id_tanggal) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Tabel DOSEN
CREATE TABLE DOSEN (
    id_dosen INT PRIMARY KEY,
    nama_dosen VARCHAR(100),
    no_tlpon VARCHAR(20),
    alamat TEXT,
    id_matkul INT,
    id_mahasiswa INT,
    FOREIGN KEY (id_matkul) REFERENCES MATAKULIAH(id_matkul),
    FOREIGN KEY (id_mahasiswa) REFERENCES MAHASISWA(id_mahasiswa)
);
INSERT INTO DOSEN (id_dosen, nama_dosen, no_tlpon, alamat, id_matkul, id_mahasiswa) VALUES
(1, 'Budi Santoso', '081234567890', 'Jl. Merdeka No. 10', 1, 1),
(2, 'Rina Wijaya', '082345678901', 'Jl. Diponegoro No.20', 2, 2),
(3, 'Andi Pratama', '083456789012', 'Jl. Sudirman No.30', 3, 3);

-- Tabel JURUSAN
CREATE TABLE JURUSAN (
    no_jurusan INT PRIMARY KEY,
    nama_jurusan VARCHAR(100),
    id_matkul INT,
    sks INT,
    FOREIGN KEY (id_matkul) REFERENCES MATAKULIAH(id_matkul)
);
INSERT INTO JURUSAN (no_jurusan, nama_jurusan, id_matkul, sks) VALUES
(1, 'Teknik Informatika', 1, 3),
(2, 'Sistem Informasi', 2, 2),
(3, 'Teknik Komputer', 3, 1);
