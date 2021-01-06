/* Wszystkie książki i ich autorzy */
SELECT ksiazki.id_ksiazki, tytul, CONCAT(autorzy.imie,' ',autorzy.nazwisko) AS 'autor'
FROM ksiazki
LEFT JOIN autorzy
ON ksiazki.id_autora = autorzy.id_autora