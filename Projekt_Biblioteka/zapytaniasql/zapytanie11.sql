/* Wypożyczone książki, które nie zostały jeszcze oddane */
SELECT ksiazki.id_ksiazki, tytul, wypozyczenia.data_wypozyczenia
FROM ksiazki
LEFT JOIN wypozyczenia 
ON ksiazki.id_ksiazki = wypozyczenia.id_ksiazki
WHERE ksiazki.id_ksiazki IN (SELECT id_ksiazki FROM wypozyczenia WHERE data_oddania IS NULL);