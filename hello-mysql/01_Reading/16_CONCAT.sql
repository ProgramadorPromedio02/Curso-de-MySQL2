-- CONCAT

SELECT CONCAT(name, surname) FROM users;
SELECT CONCAT(name, ' ', surname) FROM users;
SELECT CONCAT('Nombre: ',name', ', surname) FROM users;
SELECT CONCAT(name,', ', surname) AS 'Nombre Completo' FROM users;