/* Liczba egzemplarzy książek */
SELECT tytul, COUNT(id_ksiazki) AS 'liczba egzemplarzy'
FROM ksiazki
GROUP BY tytul