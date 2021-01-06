/* Książki, które zostały conajmniej raz wypożyczone */
SELECT ksiazki.id_ksiazki, tytul, id_wypozyczenia, data_wypozyczenia, data_oddania
FROM ksiazki
LEFT JOIN wypozyczenia
ON ksiazki.id_ksiazki = wypozyczenia.id_ksiazki