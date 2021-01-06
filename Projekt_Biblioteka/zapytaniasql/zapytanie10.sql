/* Czytelnicy, który wypożyczyli najwięcej książek */
SELECT *
FROM czytelnicy
WHERE id_czytelnika IN (SELECT id_czytelnika FROM statystyki WHERE (liczba_wypozyczonych_ksiazek = (SELECT MAX(liczba_wypozyczonych_ksiazek) FROM statystyki)))