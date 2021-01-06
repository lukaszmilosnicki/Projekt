/* Najnowsze książki */
SELECT id_ksiazki, tytul, data_wydania
FROM ksiazki
WHERE data_wydania=(SELECT MAX(data_wydania) FROM ksiazki)