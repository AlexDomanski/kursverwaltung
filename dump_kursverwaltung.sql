-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 03. Sep 2020 um 09:21
-- Server-Version: 10.4.14-MariaDB
-- PHP-Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `kursverwaltung`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fachbereich`
--

CREATE TABLE `fachbereich` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `fachbereich`
--

INSERT INTO `fachbereich` (`id`, `name`) VALUES
(1, 'EDV'),
(2, 'Sprachen'),
(3, 'Betriebswirtschaft');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kurs`
--

CREATE TABLE `kurs` (
  `kursnummer` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `beschreibung` text DEFAULT NULL,
  `beginndatum` date NOT NULL,
  `dauer` int(10) UNSIGNED NOT NULL,
  `schwierigkeitsgrad_id` int(10) UNSIGNED NOT NULL,
  `fachbereich_id` int(10) UNSIGNED NOT NULL,
  `kursort_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `kurs`
--

INSERT INTO `kurs` (`kursnummer`, `name`, `beschreibung`, `beginndatum`, `dauer`, `schwierigkeitsgrad_id`, `fachbereich_id`, `kursort_id`) VALUES
(1, 'PHP Einführung', 'Einführung in PHP', '2020-09-15', 16, 1, 1, 1),
(2, 'HTML & CSS', 'Einführung in HTML & CSS', '2020-09-06', 24, 1, 1, 1),
(3, 'Englisch B2', 'Aufbaukurs für Englisch', '2020-09-15', 16, 2, 2, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kursort`
--

CREATE TABLE `kursort` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `kursort`
--

INSERT INTO `kursort` (`id`, `name`) VALUES
(1, 'Linz'),
(2, 'Perg'),
(3, 'Wels'),
(4, 'Steyr');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kurstermin`
--

CREATE TABLE `kurstermin` (
  `id` int(10) UNSIGNED NOT NULL,
  `kursnummer` int(10) UNSIGNED NOT NULL,
  `beginn` datetime NOT NULL,
  `dauer` int(10) UNSIGNED NOT NULL,
  `trainer_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `kurstermin`
--

INSERT INTO `kurstermin` (`id`, `kursnummer`, `beginn`, `dauer`, `trainer_id`) VALUES
(1, 1, '2020-09-15 18:00:00', 4, 2),
(2, 1, '2020-09-17 18:00:00', 4, 2),
(3, 1, '2020-09-20 18:00:00', 4, 1),
(4, 1, '2020-09-22 18:00:00', 4, 1),
(5, 3, '2020-09-15 08:00:00', 8, 2),
(6, 3, '2020-09-16 08:00:00', 8, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kurs_teilnehmer`
--

CREATE TABLE `kurs_teilnehmer` (
  `kursnummer` int(10) UNSIGNED NOT NULL,
  `teilnehmer_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `schwierigkeitsgrad`
--

CREATE TABLE `schwierigkeitsgrad` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `schwierigkeitsgrad`
--

INSERT INTO `schwierigkeitsgrad` (`id`, `name`) VALUES
(1, 'Anfänger'),
(2, 'Fortgeschrittene'),
(3, 'Experten');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teilnehmer`
--

CREATE TABLE `teilnehmer` (
  `id` int(10) UNSIGNED NOT NULL,
  `vorname` varchar(50) NOT NULL,
  `nachname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `geburtsdatum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `teilnehmer`
--

INSERT INTO `teilnehmer` (`id`, `vorname`, `nachname`, `email`, `geburtsdatum`) VALUES
(1, 'Max', 'Mustermann', 'max.mustermann@test.at', '1970-01-01'),
(2, 'Susi', 'Musterfrau', 'susi.musterfrau@test.at', '1971-02-13'),
(3, 'Jane', 'Doe', 'jane.doe@test.com', '1980-04-23'),
(4, 'John', 'Doe', 'john.doe@test.com', '1982-06-22');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `trainer`
--

CREATE TABLE `trainer` (
  `id` int(10) UNSIGNED NOT NULL,
  `vorname` varchar(50) NOT NULL,
  `nachname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `trainer`
--

INSERT INTO `trainer` (`id`, `vorname`, `nachname`, `email`) VALUES
(1, 'Hans', 'Meister', 'hans.meister@test.at'),
(2, 'Nina', 'Müller', 'nina.mueller@test.at');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `fachbereich`
--
ALTER TABLE `fachbereich`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `kurs`
--
ALTER TABLE `kurs`
  ADD PRIMARY KEY (`kursnummer`),
  ADD KEY `schwierigkeitsgrad_id` (`schwierigkeitsgrad_id`,`fachbereich_id`,`kursort_id`),
  ADD KEY `fachbereich_id` (`fachbereich_id`),
  ADD KEY `kursort_id` (`kursort_id`);

--
-- Indizes für die Tabelle `kursort`
--
ALTER TABLE `kursort`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `kurstermin`
--
ALTER TABLE `kurstermin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kursnummer` (`kursnummer`),
  ADD KEY `trainer_id` (`trainer_id`);

--
-- Indizes für die Tabelle `kurs_teilnehmer`
--
ALTER TABLE `kurs_teilnehmer`
  ADD PRIMARY KEY (`kursnummer`,`teilnehmer_id`),
  ADD KEY `teilnehmer_id` (`teilnehmer_id`);

--
-- Indizes für die Tabelle `schwierigkeitsgrad`
--
ALTER TABLE `schwierigkeitsgrad`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `teilnehmer`
--
ALTER TABLE `teilnehmer`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `trainer`
--
ALTER TABLE `trainer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `fachbereich`
--
ALTER TABLE `fachbereich`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `kurs`
--
ALTER TABLE `kurs`
  MODIFY `kursnummer` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `kursort`
--
ALTER TABLE `kursort`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `kurstermin`
--
ALTER TABLE `kurstermin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `schwierigkeitsgrad`
--
ALTER TABLE `schwierigkeitsgrad`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `teilnehmer`
--
ALTER TABLE `teilnehmer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `trainer`
--
ALTER TABLE `trainer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `kurs`
--
ALTER TABLE `kurs`
  ADD CONSTRAINT `kurs_ibfk_1` FOREIGN KEY (`fachbereich_id`) REFERENCES `fachbereich` (`id`),
  ADD CONSTRAINT `kurs_ibfk_2` FOREIGN KEY (`kursort_id`) REFERENCES `kursort` (`id`),
  ADD CONSTRAINT `kurs_ibfk_3` FOREIGN KEY (`schwierigkeitsgrad_id`) REFERENCES `schwierigkeitsgrad` (`id`);

--
-- Constraints der Tabelle `kurstermin`
--
ALTER TABLE `kurstermin`
  ADD CONSTRAINT `kurstermin_ibfk_1` FOREIGN KEY (`kursnummer`) REFERENCES `kurs` (`kursnummer`),
  ADD CONSTRAINT `kurstermin_ibfk_2` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`id`);

--
-- Constraints der Tabelle `kurs_teilnehmer`
--
ALTER TABLE `kurs_teilnehmer`
  ADD CONSTRAINT `kurs_teilnehmer_ibfk_1` FOREIGN KEY (`kursnummer`) REFERENCES `kurs` (`kursnummer`),
  ADD CONSTRAINT `kurs_teilnehmer_ibfk_2` FOREIGN KEY (`teilnehmer_id`) REFERENCES `teilnehmer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
