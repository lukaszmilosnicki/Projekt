DELIMITER //
CREATE TRIGGER update_statystyk AFTER INSERT
ON czytelnicy FOR EACH ROW
BEGIN
INSERT INTO statystyki(id_czytelnika)
VALUES (new.id_czytelnika);
END //

DELIMITER //
CREATE TRIGGER update_liczbyksiazek AFTER INSERT
ON wypozyczenia FOR EACH ROW
BEGIN
UPDATE statystyki
SET liczba_wypozyczonych_ksiazek = liczba_wypozyczonych_ksiazek + 1
WHERE id_czytelnika = new.id_czytelnika;
END //