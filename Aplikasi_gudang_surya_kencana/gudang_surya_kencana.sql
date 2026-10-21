-- Database: gudang_surya_kencana
CREATE DATABASE IF NOT EXISTS `gudang_surya_kencana` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gudang_surya_kencana`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` enum('admin','petugas') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `lokasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `barang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(100) NOT NULL,
  `kategori` varchar(100) DEFAULT NULL,
  `satuan` varchar(20) DEFAULT 'Pcs',
  `stok` int(11) DEFAULT 0,
  `stok_minimal` int(11) DEFAULT 0,
  `lokasi` varchar(100) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `barang_masuk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barang_id` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `asal` varchar(100) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `barang_keluar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barang_id` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `kota_tujuan` varchar(100) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `petugas` varchar(100) DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `log_aktivitas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `nama_user` varchar(100) DEFAULT NULL,
  `aksi` varchar(200) DEFAULT NULL,
  `waktu` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- DATA AWAL
INSERT INTO `users` (`nama`, `username`, `password`, `role`) VALUES
('Admin (Pemilik)', 'admin', 'admin123', 'admin'),
('Petugas Gudang', 'petugas', 'petugas123', 'petugas');

INSERT INTO `kategori` (`nama`) VALUES ('Kain'), ('Keset'), ('Alat Kebersihan');

INSERT INTO `lokasi` (`nama`) VALUES ('Gudang A'), ('Gudang B'), ('Rak Keset');

INSERT INTO `barang` (`nama_barang`, `kategori`, `satuan`, `stok`, `stok_minimal`, `lokasi`, `updated_at`) VALUES
('Kain Katun', 'Kain', 'Roll', 40, 10, 'Gudang A', CURDATE()),
('Kain Perca', 'Kain', 'Kg', 8, 10, 'Gudang A', CURDATE()),
('Keset Kain', 'Keset', 'Pcs', 120, 30, 'Rak Keset', CURDATE()),
('Sapu Ijuk', 'Alat Kebersihan', 'Pcs', 60, 20, 'Gudang B', CURDATE()),
('Pel Lantai', 'Alat Kebersihan', 'Pcs', 0, 15, 'Gudang B', CURDATE()),
('Kemoceng', 'Alat Kebersihan', 'Pcs', 25, 10, 'Gudang B', CURDATE());
