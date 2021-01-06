/* Lista czytelników, którzy wypożyczyli conajmniej jedną książkę */
SELECT DISTINCT czytelnicy.id_czytelnika, imie, nazwisko
FROM czytelnicy
INNER JOIN wypozyczenia
ON czytelnicy.id_czytelnika = wypozyczenia.id_czytelnika