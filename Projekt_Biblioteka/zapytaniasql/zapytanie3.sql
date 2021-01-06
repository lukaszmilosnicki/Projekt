/* Najstarsze książki */
SELECT id_ksiazki, tytul, data_wydania
FROM ksiazki
WHERE data_wydania=(SELECT MIN(data_wydania) FROM ksiazki)