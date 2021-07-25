-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 25, 2021 at 01:45 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `djelatnici`
--

CREATE TABLE `djelatnici` (
  `oib_djelatnika` bigint(11) NOT NULL,
  `naziv_knjižnice` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `ime_djelatnika` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `opis_posla` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `datum_početka_rada` date NOT NULL,
  `datum_završetka_rada` date DEFAULT NULL,
  `plaća` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `djelatnici`
--

INSERT INTO `djelatnici` (`oib_djelatnika`, `naziv_knjižnice`, `ime_djelatnika`, `opis_posla`, `datum_početka_rada`, `datum_završetka_rada`, `plaća`) VALUES
(74899965215, 'Gradska Knjižnica Požega', 'Marko Petrović', 'Auditor književne građe', '2010-03-01', NULL, '3300.00'),
(86052648999, 'Gradska Knjižnica Požega', 'Marko Josipović', 'Knjižničar', '2010-03-01', NULL, '3500.50');

-- --------------------------------------------------------

--
-- Table structure for table `knjige`
--

CREATE TABLE `knjige` (
  `serijski_broj` bigint(10) NOT NULL,
  `autor` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  `naziv_knjige` varchar(100) COLLATE utf8_croatian_ci NOT NULL,
  `godina_izdanja` int(4) NOT NULL,
  `status_knjige` varchar(30) COLLATE utf8_croatian_ci NOT NULL,
  `naziv_knjižnice` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `oib_člana` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `knjige`
--

INSERT INTO `knjige` (`serijski_broj`, `autor`, `naziv_knjige`, `godina_izdanja`, `status_knjige`, `naziv_knjižnice`, `oib_člana`) VALUES
(1455552369, 'Marko Jurendić', 'Informatika', 2010, 'Dostupno', 'Gradska Knjižnica Požega', NULL),
(1478885699, 'Josip Josipović', 'Glazbena umjetnost', 2005, 'Dostupno', 'Gradska Knjižnica Požega', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `knjižnice`
--

CREATE TABLE `knjižnice` (
  `oib_knjižnice` bigint(11) NOT NULL,
  `naziv_knjižnice` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `adresa_knjižnice` varchar(120) COLLATE utf8_croatian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `knjižnice`
--

INSERT INTO `knjižnice` (`oib_knjižnice`, `naziv_knjižnice`, `adresa_knjižnice`) VALUES
(78944444444, 'Čitaonica Dragutin Lerman', 'Osiječka 53 Osijek'),
(78945633333, 'Gradska Knjižnica Pula', 'Zagrebačka 1285 Pula'),
(86425566612, 'Gradska Knjižnica Požega', 'Stjepana Radića 16 Požega');

-- --------------------------------------------------------

--
-- Table structure for table `multimedija`
--

CREATE TABLE `multimedija` (
  `serijski_broj_sadržaja` bigint(10) NOT NULL,
  `ime_sadržaja` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `vrsta_sadržaja` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `status_sadržaja` varchar(30) COLLATE utf8_croatian_ci DEFAULT NULL,
  `naziv_knjižnjice` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `oib_člana` bigint(11) DEFAULT NULL,
  `datum_posudbe` date DEFAULT NULL,
  `zadani_rok_vraćanja` date DEFAULT NULL,
  `konačni_rok_vraćanja` date DEFAULT NULL,
  `zakasnina` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `multimedija`
--

INSERT INTO `multimedija` (`serijski_broj_sadržaja`, `ime_sadržaja`, `vrsta_sadržaja`, `status_sadržaja`, `naziv_knjižnjice`, `oib_člana`, `datum_posudbe`, `zadani_rok_vraćanja`, `konačni_rok_vraćanja`, `zakasnina`) VALUES
(2436457984, 'Učilica za 8 razred', 'CD sa interaktivnim sadržajem', 'Dostupno', 'Gradska Knjižnica Požega', NULL, NULL, NULL, NULL, NULL),
(7888885641, 'Životinje u divljini', 'DVD sa dokumentarnim sadržajem', 'Dostupno', 'Gradska Knjižnica Požega', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `članovi`
--

CREATE TABLE `članovi` (
  `oib_člana` bigint(11) NOT NULL,
  `naziv_knjižnice` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `ime_člana` varchar(50) COLLATE utf8_croatian_ci NOT NULL,
  `broj_posuđenih_knjiga` int(1) DEFAULT NULL,
  `popis_posuđenih_knjiga` varchar(255) COLLATE utf8_croatian_ci DEFAULT NULL,
  `datum_posuđene_knjige` date DEFAULT NULL,
  `zadani_datum_vraćanja` date DEFAULT NULL,
  `konačni_datum_vraćene_knjige` date DEFAULT NULL,
  `zakasnina` decimal(10,2) DEFAULT NULL,
  `datum_upisa` date NOT NULL,
  `datum_ispisa` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `članovi`
--

INSERT INTO `članovi` (`oib_člana`, `naziv_knjižnice`, `ime_člana`, `broj_posuđenih_knjiga`, `popis_posuđenih_knjiga`, `datum_posuđene_knjige`, `zadani_datum_vraćanja`, `konačni_datum_vraćene_knjige`, `zakasnina`, `datum_upisa`, `datum_ispisa`) VALUES
(14555569332, 'Gradska Knjižnica Požega', 'Marko Antolović', 1, 'Marko Jurendić, Informatika', '2012-01-01', '2012-01-31', '2015-08-20', '0.00', '2010-02-01', NULL),
(86256974555, 'Gradska Knjižnica Požega', 'Josip Bošnjak', NULL, NULL, NULL, NULL, NULL, NULL, '2012-08-01', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `djelatnici`
--
ALTER TABLE `djelatnici`
  ADD PRIMARY KEY (`oib_djelatnika`),
  ADD KEY `naziv_knjižnice_fk` (`naziv_knjižnice`);

--
-- Indexes for table `knjige`
--
ALTER TABLE `knjige`
  ADD PRIMARY KEY (`serijski_broj`),
  ADD UNIQUE KEY `nknjige_uk` (`naziv_knjige`),
  ADD KEY `nknj_1_in` (`naziv_knjižnice`),
  ADD KEY `nčlana_ind` (`oib_člana`);

--
-- Indexes for table `knjižnice`
--
ALTER TABLE `knjižnice`
  ADD PRIMARY KEY (`oib_knjižnice`),
  ADD UNIQUE KEY `knjižnice_uk1` (`naziv_knjižnice`);

--
-- Indexes for table `multimedija`
--
ALTER TABLE `multimedija`
  ADD PRIMARY KEY (`serijski_broj_sadržaja`),
  ADD UNIQUE KEY `ime_sadržaja` (`ime_sadržaja`),
  ADD KEY `naziv_knjižnjice` (`naziv_knjižnjice`),
  ADD KEY `oib_člana` (`oib_člana`);

--
-- Indexes for table `članovi`
--
ALTER TABLE `članovi`
  ADD PRIMARY KEY (`oib_člana`),
  ADD KEY `nk_ind` (`naziv_knjižnice`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `djelatnici`
--
ALTER TABLE `djelatnici`
  ADD CONSTRAINT `naziv_knjižnice_fk` FOREIGN KEY (`naziv_knjižnice`) REFERENCES `knjižnice` (`naziv_knjižnice`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `knjige`
--
ALTER TABLE `knjige`
  ADD CONSTRAINT `nk_fk` FOREIGN KEY (`naziv_knjižnice`) REFERENCES `knjižnice` (`naziv_knjižnice`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `oib_čl_fk` FOREIGN KEY (`oib_člana`) REFERENCES `članovi` (`oib_člana`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `multimedija`
--
ALTER TABLE `multimedija`
  ADD CONSTRAINT `nkfk` FOREIGN KEY (`naziv_knjižnjice`) REFERENCES `knjižnice` (`naziv_knjižnice`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ocl` FOREIGN KEY (`oib_člana`) REFERENCES `članovi` (`oib_člana`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `članovi`
--
ALTER TABLE `članovi`
  ADD CONSTRAINT `naziv_knjižnice_fk02` FOREIGN KEY (`naziv_knjižnice`) REFERENCES `knjižnice` (`naziv_knjižnice`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
