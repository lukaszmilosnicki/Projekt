/* Po podaniu id czytelnika wyświetlany jest jego numer telefonu*/
DELIMITER $$
CREATE FUNCTION telefonCzytelnika (idczytelnika INT)
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
DECLARE numer INT;
SET numer = (SELECT numer_telefonu FROM czytelnicy WHERE id_czytelnika = idczytelnika);
RETURN numer;
END $$