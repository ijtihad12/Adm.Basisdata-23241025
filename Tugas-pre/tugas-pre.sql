-- Tabel MAHASISWA
CREATE TABLE MAHASISWA (
    id_mahasiswa INT PRIMARY KEY,
    matakuliah VARCHAR(100),
    dosen VARCHAR(100),
    jurusan VARCHAR(100),
    jadwal VARCHAR(100)
);

-- Tabel JADWAL
CREATE TABLE JADWAL (
    id_jadwal INT PRIMARY KEY,
    ruangan VARCHAR(50),
    tanggal DATE
);

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

-- Tabel MEMPUNYAI
CREATE TABLE MEMPUNYAI (
    id_matkul INT,
    id_tanggal INT,
    PRIMARY KEY (id_matkul, id_tanggal)
);

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

-- Tabel JURUSAN
CREATE TABLE JURUSAN (
    no_jurusan INT PRIMARY KEY,
    nama_jurusan VARCHAR(100),
    id_matkul INT,
    sks INT,
    FOREIGN KEY (id_matkul) REFERENCES MATAKULIAH(id_matkul)
);