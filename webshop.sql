-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 20 mrt 2022 om 20:07
-- Serverversie: 10.4.22-MariaDB
-- PHP-versie: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webshop`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `album`
--

CREATE TABLE `album` (
  `ID` int(11) NOT NULL,
  `titel` varchar(255) NOT NULL,
  `artiest` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `prijs` decimal(2,1) DEFAULT NULL,
  `voorraad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `album`
--

INSERT INTO `album` (`ID`, `titel`, `artiest`, `genre`, `prijs`, `voorraad`) VALUES
(1, 'Cafe Atlantico', 'Cesarie Evora', 'World', '3.0', 100),
(2, 'Rumba Azul', 'Caetona Velso', 'Latin', '4.9', 50),
(3, 'Survivor', 'Destiny\'s child', 'R&B', '3.0', 789),
(4, 'Oh Girl', 'The Chi-lites', 'Pop', '3.0', 2),
(5, 'Der Herr ist mein getre', 'Ton Koopman', 'Klassiek', '5.5', 30),
(6, 'Closing Time', 'Tom Waits', 'Rock', '3.0', 0),
(7, 'Irresistible', 'Celia Cruz', 'Latin', '3.5', 23),
(8, 'Marvin Gaye II', 'Marvin Gaye', 'R&B', '4.0', 154),
(9, 'Mi Sangre', 'Juanes', 'Latin', '3.9', 123),
(10, 'Greatest Hits 2', 'Qeen', 'Rock', '3.0', 0),
(11, '3121', 'Prince', 'Rock', '3.5', 0),
(12, 'Antologia I', 'Paco de Lucia', 'World', '3.0', 320);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `item`
--

CREATE TABLE `item` (
  `ID` int(11) NOT NULL,
  `weborder_ID` int(11) NOT NULL,
  `klant_ID` int(11) NOT NULL,
  `album_ID` int(11) NOT NULL,
  `aantal` int(11) NOT NULL,
  `prijs_eenheid` decimal(2,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `item`
--

INSERT INTO `item` (`ID`, `weborder_ID`, `klant_ID`, `album_ID`, `aantal`, `prijs_eenheid`) VALUES
(1, 1, 1, 1, 1, '3.0'),
(2, 1, 1, 5, 2, '5.5'),
(3, 2, 5, 8, 1, '4.0'),
(4, 2, 5, 10, 2, '3.0'),
(5, 3, 3, 1, 1, '3.0'),
(6, 4, 2, 5, 1, '5.5'),
(7, 4, 2, 8, 1, '4.0'),
(8, 4, 2, 6, 1, '3.0'),
(9, 5, 6, 4, 2, '3.0'),
(10, 5, 6, 6, 1, '3.0'),
(11, 5, 6, 1, 1, '3.0'),
(12, 5, 6, 9, 1, '3.9'),
(13, 5, 6, 10, 3, '3.0');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klant`
--

CREATE TABLE `klant` (
  `ID` int(11) NOT NULL,
  `voornaam` varchar(255) NOT NULL,
  `achternaam` varchar(255) NOT NULL,
  `straat` varchar(255) NOT NULL,
  `postcode` varchar(7) NOT NULL,
  `woonplaats` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `wachtwoord` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `rol` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `klant`
--

INSERT INTO `klant` (`ID`, `voornaam`, `achternaam`, `straat`, `postcode`, `woonplaats`, `email`, `wachtwoord`, `token`, `rol`) VALUES
(1, 'Dylan', 'Huisden', 'middenweg 11', '1088 VV', 'Amsterdam', 'dhuisden@roc.nl', '', '', 0),
(2, 'Nitin', 'Bosman', 'Leidseweg 22', '9900 BB', 'Amsterdam', 'nbosman@roc.nl', '', '', 0),
(3, 'Joseph', 'Demirel', 'Leidseplein 33', '9988 BB', 'Utrecht', 'Josdem@hotmal.com', '', '', 0),
(4, 'Franco', 'Tasiyan', 'Kruislaan 444', '3300 VV', 'Utrecht', 'frantas@wanadoo.nl', '', '', 0),
(5, 'Akash', 'Kabli', 'Galileiplantsoen 333', '2299 NN', 'Amstelveen', 'aka@hetnet.nl', '', '', 0),
(6, 'Tamara', 'Kabli', 'Mozartstraat 22', '3388 XX', 'Amsterdam', 'tamka@hotmail.com', '', '', 0),
(7, 'Arnold', 'Shaw', 'Kruislaan 1', '9876 FF', 'Rotterdam', 'asha@roc.nl', '', '', 0),
(8, 'TEST update', 'test', 'Test123', '1234 AA', 'Teststaat', '123@gmail.com', '$2y$10$MeIE5Xljkrqkm7uhBSOc/uAmEpo/Oc8KiZDsH6JAptiHs4S0d0KvS', '', 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `weborder`
--

CREATE TABLE `weborder` (
  `ID` int(11) NOT NULL,
  `klant_ID` int(11) NOT NULL,
  `datum` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `weborder`
--

INSERT INTO `weborder` (`ID`, `klant_ID`, `datum`) VALUES
(1, 1, '2015-01-01'),
(2, 1, '2015-01-01'),
(3, 2, '2015-02-15'),
(4, 3, '2015-02-20'),
(5, 3, '2015-03-13');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`ID`);

--
-- Indexen voor tabel `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `weborder_ID` (`weborder_ID`),
  ADD KEY `klant_ID` (`klant_ID`),
  ADD KEY `album_ID` (`album_ID`);

--
-- Indexen voor tabel `klant`
--
ALTER TABLE `klant`
  ADD PRIMARY KEY (`ID`);

--
-- Indexen voor tabel `weborder`
--
ALTER TABLE `weborder`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `klant_ID` (`klant_ID`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `album`
--
ALTER TABLE `album`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT voor een tabel `item`
--
ALTER TABLE `item`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT voor een tabel `klant`
--
ALTER TABLE `klant`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT voor een tabel `weborder`
--
ALTER TABLE `weborder`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`weborder_ID`) REFERENCES `weborder` (`ID`),
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`klant_ID`) REFERENCES `klant` (`ID`),
  ADD CONSTRAINT `item_ibfk_3` FOREIGN KEY (`album_ID`) REFERENCES `album` (`ID`);

--
-- Beperkingen voor tabel `weborder`
--
ALTER TABLE `weborder`
  ADD CONSTRAINT `weborder_ibfk_1` FOREIGN KEY (`klant_ID`) REFERENCES `klant` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
