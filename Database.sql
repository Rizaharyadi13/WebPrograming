/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.27-MariaDB : Database - perpustakaan_19220991
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`perpustakaan_19220991` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `perpustakaan_19220991`;

/*Table structure for table `tb_anggota` */

DROP TABLE IF EXISTS `tb_anggota`;

CREATE TABLE `tb_anggota` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_lengkap` varchar(255) NOT NULL,
  `alamat` varchar(120) DEFAULT NULL,
  `kota` varchar(70) DEFAULT NULL,
  `notelp` varchar(18) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_anggota` */

/*Table structure for table `tb_buku` */

DROP TABLE IF EXISTS `tb_buku`;

CREATE TABLE `tb_buku` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tb_kategori_id` int(10) unsigned DEFAULT NULL,
  `tb_penerbit_id` int(10) unsigned DEFAULT NULL,
  `judul` varchar(512) NOT NULL,
  `edisi` varchar(10) DEFAULT NULL,
  `cetakan` varchar(10) DEFAULT NULL,
  `sinopsis` text DEFAULT NULL,
  `halaman` varchar(20) DEFAULT NULL,
  `penulis` varchar(100) DEFAULT NULL,
  `tahun` year(4) DEFAULT NULL,
  `cover_file` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_kategori_id` (`tb_kategori_id`),
  KEY `tb_penerbit_id` (`tb_penerbit_id`),
  CONSTRAINT `tb_buku_ibfk_1` FOREIGN KEY (`tb_kategori_id`) REFERENCES `tb_kategori` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `tb_buku_ibfk_2` FOREIGN KEY (`tb_penerbit_id`) REFERENCES `tb_penerbit` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_buku` */

/*Table structure for table `tb_kategori` */

DROP TABLE IF EXISTS `tb_kategori`;

CREATE TABLE `tb_kategori` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kategori` varchar(255) DEFAULT NULL,
  `kode_ddc` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_kategori` */

/*Table structure for table `tb_koleksibuku` */

DROP TABLE IF EXISTS `tb_koleksibuku`;

CREATE TABLE `tb_koleksibuku` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tb_buku_id` int(10) unsigned DEFAULT NULL,
  `nomor_koleksi` int(11) DEFAULT NULL,
  `ststus_koleksi` enum('A','P','M','R') DEFAULT 'A',
  PRIMARY KEY (`id`),
  KEY `tb_buku_id` (`tb_buku_id`),
  CONSTRAINT `tb_koleksibuku_ibfk_1` FOREIGN KEY (`tb_buku_id`) REFERENCES `tb_buku` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_koleksibuku` */

/*Table structure for table `tb_peminjaman` */

DROP TABLE IF EXISTS `tb_peminjaman`;

CREATE TABLE `tb_peminjaman` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tgl_peminjaman` datetime NOT NULL,
  `tgl_pengembalian` datetime DEFAULT NULL,
  `tb_pengguna_id_peminjaman` int(10) unsigned NOT NULL,
  `tb_pengguna_id_pengembalian` int(10) unsigned DEFAULT NULL,
  `tb_anggota_id` int(10) unsigned NOT NULL,
  `tb_buku_id` int(10) unsigned DEFAULT NULL,
  `denda` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_pengguna_id_peminjaman` (`tb_pengguna_id_peminjaman`),
  KEY `tb_pengguna_id_pengembalian` (`tb_pengguna_id_pengembalian`),
  KEY `tb_anggota_id` (`tb_anggota_id`),
  KEY `tb_buku_id` (`tb_buku_id`),
  CONSTRAINT `tb_peminjaman_ibfk_1` FOREIGN KEY (`tb_pengguna_id_peminjaman`) REFERENCES `tb_pengguna` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `tb_peminjaman_ibfk_2` FOREIGN KEY (`tb_pengguna_id_pengembalian`) REFERENCES `tb_pengguna` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `tb_peminjaman_ibfk_3` FOREIGN KEY (`tb_anggota_id`) REFERENCES `tb_anggota` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `tb_peminjaman_ibfk_4` FOREIGN KEY (`tb_buku_id`) REFERENCES `tb_buku` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_peminjaman` */

/*Table structure for table `tb_penerbit` */

DROP TABLE IF EXISTS `tb_penerbit`;

CREATE TABLE `tb_penerbit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `penerbit` varchar(255) NOT NULL,
  `kota` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_penerbit` */

/*Table structure for table `tb_pengguna` */

DROP TABLE IF EXISTS `tb_pengguna`;

CREATE TABLE `tb_pengguna` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `katasandi` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tb_pengguna` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
