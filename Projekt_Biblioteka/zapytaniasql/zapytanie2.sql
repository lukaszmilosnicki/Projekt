/* Czytelnicy powyżej średniego wieku */
SELECT id_czytelnika, imie, nazwisko, data_ur
FROM czytelnicy
WHERE data_ur > (SELECT AVG(data_ur) FROM czytelnicy)