/* Po podaniu nazwiska autora wyświetlane są wypożyczenia książek jego autorstwa*/ 
DELIMITER //
CREATE PROCEDURE ProceduraWypozyczenia (IN nazwiskoautora VARCHAR(50))
BEGIN
SELECT * 
FROM wypozyczenia
WHERE id_ksiazki IN (SELECT id_ksiazki FROM ksiazki WHERE id_autora = (SELECT id_autora FROM autorzy WHERE nazwisko = nazwiskoautora));
END //