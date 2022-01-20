-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 20 Ara 2021, 01:24:26
-- Sunucu sürümü: 10.4.22-MariaDB
-- PHP Sürümü: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `kutuphane`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `adresler`
--

CREATE TABLE `adresler` (
  `adres_id` int(11) NOT NULL,
  `il` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL,
  `ilce` varchar(20) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `mahalle` varchar(50) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `bina_no` int(10) DEFAULT NULL,
  `posta_kodu` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `adresler`
--

INSERT INTO `adresler` (`adres_id`, `il`, `ilce`, `mahalle`, `bina_no`, `posta_kodu`) VALUES
(1, 'İzmir', 'Buca', NULL, NULL, NULL),
(2, 'İzmir', 'Bornova', NULL, NULL, NULL),
(3, 'İzmir', 'Karşıyaka', NULL, NULL, NULL),
(4, 'İzmir', 'Bayraklı', NULL, NULL, NULL),
(5, 'İzmir', 'Göztepe', NULL, NULL, NULL),
(6, 'İstanbul', 'Avcılar', NULL, NULL, NULL),
(7, 'İstanbul', 'Bağcılar', NULL, NULL, NULL),
(8, 'İstanbul', 'Bahçelievler', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `emanet`
--

CREATE TABLE `emanet` (
  `emanet_id` int(11) NOT NULL,
  `kitap_id` int(11) NOT NULL,
  `uye_id` int(11) NOT NULL,
  `alim_tarihi` date NOT NULL,
  `teslim_tarihi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoriler`
--

CREATE TABLE `kategoriler` (
  `kategori_id` int(11) NOT NULL,
  `kategori` varchar(35) COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `kategoriler`
--

INSERT INTO `kategoriler` (`kategori_id`, `kategori`) VALUES
(1, 'Korku'),
(2, 'Polisiye'),
(3, 'Şiir'),
(4, 'Bilim Kurgu'),
(5, 'Fantastik'),
(6, 'Felsefe'),
(7, 'Türk Edebiyatı'),
(8, 'Çizgi Roman'),
(9, 'Dram');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kitaplar`
--

CREATE TABLE `kitaplar` (
  `kitap_id` int(11) NOT NULL,
  `Isbn` int(11) NOT NULL,
  `kitapAd` varchar(35) COLLATE utf8mb4_turkish_ci NOT NULL,
  `yayinTarihi` date NOT NULL,
  `sayfaSayisi` int(15) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `kategori` varchar(35) COLLATE utf8mb4_turkish_ci NOT NULL,
  `yayinevi_id` int(11) NOT NULL,
  `yayinEviAd` varchar(35) COLLATE utf8mb4_turkish_ci NOT NULL,
  `yazar_id` int(11) NOT NULL,
  `yazar` varchar(35) COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `kitaplar`
--

INSERT INTO `kitaplar` (`kitap_id`, `Isbn`, `kitapAd`, `yayinTarihi`, `sayfaSayisi`, `kategori_id`, `kategori`, `yayinevi_id`, `yayinEviAd`, `yazar_id`, `yazar`) VALUES
(1, 15687512, 'Tepki', '2020-06-03', 350, 1, 'Korku', 4, 'Altın Kitaplar', 1, 'Stephen King'),
(2, 15687524, 'Medyum', '2014-08-10', 400, 1, 'Korku', 4, 'Altın Kitaplar', 1, 'Stephen King'),
(3, 31245635, 'İçimizdeki Şeytan', '2014-01-31', 231, 7, 'Türk Edebiyatı', 3, 'Yapı Kredi Yayınları', 3, 'Sabahattin Ali'),
(4, 12452125, 'Hayvan Mezarlığı', '2020-12-18', 700, 1, 'Korku', 4, 'Altın Kitaplar', 1, 'Stephen King');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kutuphane`
--

CREATE TABLE `kutuphane` (
  `kutuphane_id` int(11) NOT NULL,
  `kutuphaneAd` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uyeler`
--

CREATE TABLE `uyeler` (
  `uye_id` int(11) NOT NULL,
  `Tc_no` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `uyeAd` varchar(35) COLLATE utf8mb4_turkish_ci NOT NULL,
  `uyeSoyad` varchar(35) COLLATE utf8mb4_turkish_ci NOT NULL,
  `cinsiyet` tinyint(1) NOT NULL,
  `telefon` int(35) NOT NULL,
  `eposta` text COLLATE utf8mb4_turkish_ci NOT NULL,
  `adres_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `uyeler`
--

INSERT INTO `uyeler` (`uye_id`, `Tc_no`, `uyeAd`, `uyeSoyad`, `cinsiyet`, `telefon`, `eposta`, `adres_id`) VALUES
(7, '2147483647', 'Doğukan', 'Eşyer', 0, 2147483647, 'dogukanesyer@gmail.com', 1),
(12, '38083654714', 'Ali', 'Yavuzdoğan', 0, 2147483647, 'aliyavuzdogan@gmail.com', 3),
(13, '38083654104', 'Onur', 'Yılmaz', 0, 2147483647, 'onuryilmaz@gmail.com', 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yayinevleri`
--

CREATE TABLE `yayinevleri` (
  `yayinevi_id` int(11) NOT NULL,
  `yayinEviAd` varchar(35) COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `yayinevleri`
--

INSERT INTO `yayinevleri` (`yayinevi_id`, `yayinEviAd`) VALUES
(1, 'İthaki Yayınları'),
(2, 'Can Yayınları'),
(3, 'Yapı Kredi Yayınları'),
(4, 'Altın Kitaplar'),
(5, 'JBC Yayıncılık'),
(6, 'Alfa Yayıncılık'),
(7, 'Panama Yayınevi'),
(8, 'İş Bankası Kültür Yayınları'),
(9, 'Epsilon Yayınevi');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yazarlar`
--

CREATE TABLE `yazarlar` (
  `yazar_id` int(11) NOT NULL,
  `yazar` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `yazarlar`
--

INSERT INTO `yazarlar` (`yazar_id`, `yazar`) VALUES
(1, 'Stephen King'),
(2, 'Edgar Allan Poe'),
(3, 'H.P.Lovecraft'),
(4, 'Nazım Hikmet'),
(5, 'Sabahattin Ali'),
(6, 'Küçük İskender'),
(7, 'Alfred Bester'),
(8, 'Albert Camus'),
(9, 'Arthur Rimbaud'),
(10, 'Philip K. Dick'),
(11, 'J.R.R. Tolkien'),
(12, 'Anthony Burgess'),
(13, 'Turgut Uyar'),
(14, 'Cemal Süreyya'),
(15, 'Aldous Huxley'),
(16, 'Stefan Zweig'),
(17, 'Nilgün Marmara'),
(18, 'Didem Madak');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `adresler`
--
ALTER TABLE `adresler`
  ADD PRIMARY KEY (`adres_id`);

--
-- Tablo için indeksler `emanet`
--
ALTER TABLE `emanet`
  ADD PRIMARY KEY (`emanet_id`),
  ADD KEY `fk_kitap_id` (`kitap_id`),
  ADD KEY `fk_uye_id` (`uye_id`);

--
-- Tablo için indeksler `kategoriler`
--
ALTER TABLE `kategoriler`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Tablo için indeksler `kitaplar`
--
ALTER TABLE `kitaplar`
  ADD PRIMARY KEY (`kitap_id`),
  ADD UNIQUE KEY `Isbn` (`Isbn`),
  ADD KEY `fk_kategori_id` (`kategori_id`),
  ADD KEY `fk_yayinevi_id` (`yayinevi_id`),
  ADD KEY `fk_yazar_id` (`yazar_id`);

--
-- Tablo için indeksler `kutuphane`
--
ALTER TABLE `kutuphane`
  ADD PRIMARY KEY (`kutuphane_id`);

--
-- Tablo için indeksler `uyeler`
--
ALTER TABLE `uyeler`
  ADD PRIMARY KEY (`uye_id`),
  ADD UNIQUE KEY `Tc_no` (`Tc_no`),
  ADD KEY `fk_adres_id` (`adres_id`);

--
-- Tablo için indeksler `yayinevleri`
--
ALTER TABLE `yayinevleri`
  ADD PRIMARY KEY (`yayinevi_id`);

--
-- Tablo için indeksler `yazarlar`
--
ALTER TABLE `yazarlar`
  ADD PRIMARY KEY (`yazar_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `adresler`
--
ALTER TABLE `adresler`
  MODIFY `adres_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `emanet`
--
ALTER TABLE `emanet`
  MODIFY `emanet_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `kategoriler`
--
ALTER TABLE `kategoriler`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `kitaplar`
--
ALTER TABLE `kitaplar`
  MODIFY `kitap_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Tablo için AUTO_INCREMENT değeri `kutuphane`
--
ALTER TABLE `kutuphane`
  MODIFY `kutuphane_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `uyeler`
--
ALTER TABLE `uyeler`
  MODIFY `uye_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Tablo için AUTO_INCREMENT değeri `yayinevleri`
--
ALTER TABLE `yayinevleri`
  MODIFY `yayinevi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `yazarlar`
--
ALTER TABLE `yazarlar`
  MODIFY `yazar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `emanet`
--
ALTER TABLE `emanet`
  ADD CONSTRAINT `fk_kitap_id` FOREIGN KEY (`kitap_id`) REFERENCES `kitaplar` (`kitap_id`),
  ADD CONSTRAINT `fk_uye_id` FOREIGN KEY (`uye_id`) REFERENCES `uyeler` (`uye_id`);

--
-- Tablo kısıtlamaları `kitaplar`
--
ALTER TABLE `kitaplar`
  ADD CONSTRAINT `fk_kategori_id` FOREIGN KEY (`kategori_id`) REFERENCES `kategoriler` (`kategori_id`),
  ADD CONSTRAINT `fk_yayinevi_id` FOREIGN KEY (`yayinevi_id`) REFERENCES `yayinevleri` (`yayinevi_id`),
  ADD CONSTRAINT `fk_yazar_id` FOREIGN KEY (`yazar_id`) REFERENCES `yazarlar` (`yazar_id`);

--
-- Tablo kısıtlamaları `uyeler`
--
ALTER TABLE `uyeler`
  ADD CONSTRAINT `fk_adres_id` FOREIGN KEY (`adres_id`) REFERENCES `adresler` (`adres_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
