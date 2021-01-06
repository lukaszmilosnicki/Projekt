CREATE VIEW zapytanie1 AS
SELECT ksiazki.id_ksiazki, tytul, CONCAT(autorzy.imie,' ',autorzy.nazwisko) AS 'autor'
FROM ksiazki
LEFT JOIN autorzy
ON ksiazki.id_autora = autorzy.id_autora;

CREATE VIEW zapytanie2 AS
SELECT id_czytelnika, imie, nazwisko, data_ur
FROM czytelnicy
WHERE data_ur > (SELECT AVG(data_ur) FROM czytelnicy);

CREATE VIEW zapytanie3 AS
SELECT id_ksiazki, tytul, data_wydania
FROM ksiazki
WHERE data_wydania=(SELECT MIN(data_wydania) FROM ksiazki);

CREATE VIEW zapytanie4 AS
SELECT id_ksiazki, tytul, data_wydania
FROM ksiazki
WHERE data_wydania=(SELECT MAX(data_wydania) FROM ksiazki);

CREATE VIEW zapytanie5 AS
SELECT COUNT(id_ksiazki) AS 'Liczba książek w bibliotece'
FROM ksiazki;

CREATE VIEW zapytanie6 AS
SELECT tytul, COUNT(id_ksiazki) AS 'liczba egzemplarzy'
FROM ksiazki
GROUP BY tytul;

CREATE VIEW zapytanie7 AS
SELECT COUNT(id_czytelnika) AS 'Liczba czytelników'
FROM czytelnicy;

CREATE VIEW zapytanie8 AS
SELECT  ksiazki.id_ksiazki, tytul
FROM ksiazki
LEFT JOIN wypozyczenia
ON ksiazki.id_ksiazki = wypozyczenia.id_ksiazki
WHERE data_oddania IS NOT NULL
ORDER BY ksiazki.id_ksiazki;

CREATE VIEW zapytanie9 AS
SELECT DISTINCT czytelnicy.id_czytelnika, imie, nazwisko
FROM czytelnicy
INNER JOIN wypozyczenia
ON czytelnicy.id_czytelnika = wypozyczenia.id_czytelnika;

CREATE VIEW zapytanie10 AS
SELECT *
FROM czytelnicy
WHERE id_czytelnika IN (SELECT id_czytelnika FROM statystyki WHERE (liczba_wypozyczonych_ksiazek = (SELECT MAX(liczba_wypozyczonych_ksiazek) FROM statystyki)));

CREATE VIEW zapytanie11 AS
SELECT ksiazki.id_ksiazki, tytul, wypozyczenia.data_wypozyczenia
FROM ksiazki
LEFT JOIN wypozyczenia 
ON ksiazki.id_ksiazki = wypozyczenia.id_ksiazki
WHERE ksiazki.id_ksiazki IN (SELECT id_ksiazki FROM wypozyczenia WHERE data_oddania IS NULL);
