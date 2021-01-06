CREATE DATABASE biblioteka;
USE biblioteka;

CREATE TABLE autorzy
(
	id_autora INT PRIMARY KEY AUTO_INCREMENT,
    imie VARCHAR(20) NOT NULL,
    nazwisko VARCHAR(35) NOT NULL
);

CREATE TABLE kategorie
(
	id_kategorii INT PRIMARY KEY AUTO_INCREMENT,
    kategoria VARCHAR(20) NOT NULL
);

CREATE TABLE wydawnictwa
(
	id_wydawnictwa INT PRIMARY KEY AUTO_INCREMENT,
    wydawnictwo VARCHAR (35) NOT NULL
);

CREATE TABLE czytelnicy
(
	id_czytelnika INT PRIMARY KEY AUTO_INCREMENT,
    imie VARCHAR(25) NOT NULL,
    nazwisko VARCHAR(40) NOT NULL,
    data_ur DATE,
    numer_telefonu VARCHAR(9)
);

CREATE TABLE ksiazki
(
	id_ksiazki INT PRIMARY KEY AUTO_INCREMENT,
    id_kategorii INT,
    tytul VARCHAR(50),
    id_autora INT,
    id_wydawnictwa INT,
    data_wydania DATE,
    FOREIGN KEY (id_kategorii) REFERENCES kategorie(id_kategorii),
    FOREIGN KEY (id_autora) REFERENCES autorzy(id_autora),
    FOREIGN KEY (id_wydawnictwa) REFERENCES wydawnictwa(id_wydawnictwa)
);

CREATE TABLE wypozyczenia
(
	id_wypozyczenia INT PRIMARY KEY AUTO_INCREMENT,
    id_czytelnika INT NOT NULL,
    id_ksiazki INT NOT NULL,
    data_wypozyczenia DATE NOT NULL,
    data_oddania DATE,
    FOREIGN KEY (id_czytelnika) REFERENCES czytelnicy(id_czytelnika),
    FOREIGN KEY (id_ksiazki) REFERENCES ksiazki(id_ksiazki)
);

CREATE TABLE statystyki
(
	id_czytelnika INT PRIMARY KEY,
    liczba_wypozyczonych_ksiazek INT DEFAULT 0,
    FOREIGN KEY (id_czytelnika) REFERENCES czytelnicy(id_czytelnika)
);