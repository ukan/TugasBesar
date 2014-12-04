-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2014 at 04:38 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `reservasi_tiket_kereta`
--

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE IF NOT EXISTS `jadwal` (
  `IDJadwal` varchar(10) NOT NULL,
  `Kode_KA` varchar(10) NOT NULL,
  `rute` varchar(70) NOT NULL,
  `Berangkat` time NOT NULL,
  `Tiba` time NOT NULL,
  PRIMARY KEY (`IDJadwal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`IDJadwal`, `Kode_KA`, `rute`, `Berangkat`, `Tiba`) VALUES
('JD001', 'KA001', 'BANDUNG - JAKARTA', '08:00:00', '11:00:00'),
('JD002', 'KA001', 'BANDUNG - GAMBIR', '20:30:00', '23:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `kereta`
--

CREATE TABLE IF NOT EXISTS `kereta` (
  `Kode_KA` varchar(10) NOT NULL,
  `Nama_KA` varchar(50) NOT NULL,
  `Kelas` varchar(50) NOT NULL,
  PRIMARY KEY (`Kode_KA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kereta`
--

INSERT INTO `kereta` (`Kode_KA`, `Nama_KA`, `Kelas`) VALUES
('KA001', 'PARAHYANGAN', 'Eksekutif'),
('KA002', 'DWIPANGGA', 'Eksekutif'),
('KA003', 'MURIA', 'Eksekutif'),
('KA004', 'JATI', 'Eksekutif'),
('KA005', 'GUMARANG', 'Bisnis'),
('KA006', 'LODAYA', 'Bisnis'),
('KA007', 'MUTIARA TIMUR', 'Bisnis'),
('KA008', 'SANCAKA', 'Bisnis'),
('KA009', 'MAJAPAHIT', 'Ekonomi'),
('KA010', 'KERTAJAYA', 'Ekonomi'),
('KA011', 'BEEGAWAN', 'Ekonomi');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `ID_Member` varchar(10) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Alamat` varchar(70) NOT NULL,
  `Telepon` varchar(15) NOT NULL,
  PRIMARY KEY (`ID_Member`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`ID_Member`, `Nama`, `Alamat`, `Telepon`) VALUES
('M0001', 'Asep', 'Bandung', '089226788199'),
('M0002', 'Sumiati', 'Garut', '081223687667'),
('M0003', 'Ganda', 'Sumedang', '082113678990'),
('M0004', 'Dadan', 'Cimahi', '087678556700'),
('M0005', 'Agus', 'Sumedang', '089778677898');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE IF NOT EXISTS `pembayaran` (
  `ID_Pembayaran` varchar(10) NOT NULL,
  `ID_Pemesan` varchar(10) NOT NULL,
  `Uang` int(10) NOT NULL,
  `Harga` int(10) NOT NULL,
  `Kembalian` int(10) NOT NULL,
  PRIMARY KEY (`ID_Pembayaran`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`ID_Pembayaran`, `ID_Pemesan`, `Uang`, `Harga`, `Kembalian`) VALUES
('BY001', 'TC002', 200000, 100000, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `pemesan`
--

CREATE TABLE IF NOT EXISTS `pemesan` (
  `ID_Pemesan` varchar(10) NOT NULL,
  `ID_Member` varchar(20) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `NamaKA` varchar(15) NOT NULL,
  `Kelas` varchar(10) NOT NULL,
  `NoDuduk` varchar(10) NOT NULL,
  `tanggalBerangkat` date NOT NULL,
  `rute` varchar(70) NOT NULL,
  `jamBerangkat` time NOT NULL,
  `Harga` varchar(15) NOT NULL,
  PRIMARY KEY (`ID_Pemesan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemesan`
--

INSERT INTO `pemesan` (`ID_Pemesan`, `ID_Member`, `Nama`, `NamaKA`, `Kelas`, `NoDuduk`, `tanggalBerangkat`, `rute`, `jamBerangkat`, `Harga`) VALUES
('TC001', 'M0003', 'Ganda', 'PARAHYANGAN', 'Eksekutif', 'A01', '2014-04-19', 'BANDUNG - JAKARTA', '08:00:00', '100000'),
('TC002', 'M0001', 'Asep', 'LODAYA', 'Ekonomi', 'A02', '2014-05-09', 'BANDUNG - GAMBIR', '20:30:00', '100000'),
('TC003', 'M0003', 'Ganda', 'PARAHYANGAN', 'Eksekutif', 'A01', '2014-09-08', 'BANDUNG - JAKARTA', '08:00:00', '100000');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE IF NOT EXISTS `pengguna` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`username`, `password`) VALUES
('admin', 'cobamasuk');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
