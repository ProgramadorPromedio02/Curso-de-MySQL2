-- Mostrando la tabla users

SELECT * FROM users;
SELECT name FROM users;
SELECT user_id, name FROM users;

-- Modificadores
-- DISTINCT

SELECT DISTINCT * FROM users;
SELECT DISTINCT age FROM users;

-- WHERE

SELECT * FROM users WHERE age = 15;
SELECT name FROM users WHERE age = 15;
SELECT DISTINCT age FROM users WHERE age = 15;

-- ORDER_BY

SELECT * FROM users ORDER BY age;
SELECT * FROM users ORDER BY age ASC;
SELECT * FROM users ORDER BY age DESC;
SELECT * FROM users WHERE email = 'sara@gmail.com' ORDER BY age DESC;
SELECT name FROM users WHERE email = 'sara@gmail.com' ORDER BY age DESC;

-- LIKE

SELECT * FROM users WHERE email LIKE '%@gmail.com';
SELECT * FROM users WHERE email LIKE 'sara%';
SELECT * FROM users WHERE email LIKE '%@%';

-- AND_OR_NOT

SELECT * FROM users WHERE NOT email = 'sara@gmail.com';
SELECT * FROM users WHERE NOT email = 'sara@gmail.com' AND age = 15;
SELECT * FROM users WHERE NOT email = 'sara@gmail.com' OR age = 15;

-- LIMIT

SELECT * FROM users LIMIT 3;
SELECT * FROM users WHERE NOT email = 'sara@gmail.com' OR age = 15 LIMIT 2;

-- NULL

SELECT * FROM users WHERE email IS NULL;
SELECT * FROM users WHERE email IS NOT NULL;
SELECT * FROM users WHERE email IS NOT NULL AND age = 15;

-- MIN_MAX

SELECT MAX(age) FROM users;
SELECT MIN(age) FROM users;

-- COUNT

SELECT COUNT(*) FROM users;
SELECT COUNT(age) FROM users;

-- SUM

SELECT SUM(age) FROM users;

-- AVG

SELECT AVG(age) FROM users;

-- IN 

SELECT * FROM users WHERE name IN ('Brais');
SELECT * FROM users WHERE name IN ('brais');
SELECT * FROM users WHERE name IN ("Brais");
SELECT * FROM users WHERE name IN ('brais', 'sara'); 

-- BETWEEN

SELECT * FROM users WHERE age BETWEEN 20 AND 30;

-- ALIAS

SELECT name, init_date AS 'Fecha de inicio en programación' FROM users WHERE age BETWEEN 20 AND 30;
SELECT name, init_date AS "Fecha de inicio en programación" FROM users WHERE age BETWEEN 20 AND 30;
SELECT name, init_date AS "Fecha de inicio en programación" FROM users WHERE name = 'Brais';
SELECT name, init_date AS "Fecha de inicio en programación" FROM users WHERE name = "Brais";

-- CONCAT

SELECT CONCAT(name, surname) FROM users;
SELECT CONCAT(name, ' ', surname) FROM users;
SELECT CONCAT('Nombre: ',name', ', surname) FROM users;
SELECT CONCAT(name,', ', surname) AS 'Nombre Completo' FROM users;

-- GROUP_BY

SELECT MAX(age) FROM users GROUP BY age;
SELECT COUNT(age), age FROM users GROUP BY age;
SELECT COUNT(age), age FROM users GROUP BY age ORDER BY age ASC;
SELECT COUNT(age), age FROM users WHERE age > 15 GROUP BY age ORDER BY age ASC;

-- HAVING

SELECT * FROM users HAVING age > 20;
SELECT * FROM users HAVING age > 19;
SELECT * FROM users HAVING age > 14;
SELECT COUNT(age) FROM users HAVING COUNT(age) > 0;
SELECT COUNT(age) FROM users HAVING COUNT(age) > 3;
SELECT COUNT(age) FROM users HAVING COUNT(age) > 4;

-- CASE

SELECT *,
CASE
	WHEN age > 17 THEN 'Es mayor de edad'
    ELSE 'Es menor de edad'
END AS agetext
FROM users;

SELECT *,
CASE
	WHEN age > 17 THEN True
    ELSE False
END AS '¿Es mayor de edad?'
FROM users;

SELECT *,
CASE
	WHEN age > 17 THEN 'Es mayor de edad'
    WHEN age > 18 THEN 'Acaba de cumplir la mayoria de edad'
    ELSE 'Es menor de edad'
END AS '¿Es mayor de edad?'
FROM users;

SELECT *,
CASE
	WHEN age > 18 THEN 'Es mayor de edad'
    WHEN age = 18 THEN 'Acaba de cumplir la mayoria de edad'
    ELSE 'Es menor de edad'
END AS '¿Es mayor de edad?'
FROM users;

SELECT *,
CASE
	WHEN age > 18 THEN 'Es mayor de edad'
    WHEN age = 18 THEN 'Acaba de cumplir la mayoria de edad'
    ELSE 'Es menor de edad'
END 
FROM users;

-- IFNULL

SELECT name, surname, IFNULL(age, 0) FROM users;
SELECT name, surname, IFNULL(age, 0) AS age FROM users;

-- Escritura de datos
-- INSERT

INSERT INTO users (user_id, name, surname) VALUES(8, 'María', 'Lopez');
INSERT INTO users (name, surname) VALUES('Paco', 'Pérez');
INSERT INTO users (user_id, name, surname) VALUES(11, 'El', 'Merma');

-- UPDATE

UPDATE users SET age = 21 WHERE user_id = 11;
UPDATE users SET age = 20, init_date = '2020-10-12' WHERE user_id = 11;

-- DELETE

DELETE FROM users WHERE user_id = 11;

-- Administración de la base de datos
-- CREATE

CREATE DATABASE test;

-- DROP

DROP DATABASE test;

-- CREACIÓN DE TABLAS RELACIONADAS
-- TABLAS 1:1

CREATE TABLE dni (
 dni_id int AUTO_INCREMENT PRIMARY KEY,
 dni_numer int NOT NULL,
 user_id int,
 UNIQUE(dni_id),
 FOREIGN KEY(user_id) REFERENCES users(user_id)
);

-- TABLAS 1:N

CREATE TABLE companies(
	company_id int AUTO_INCREMENT PRIMARY KEY,
	name varchar(100) NOT NULL
);

ALTER TABLE users
ADD company_id varchar(100);

ALTER TABLE users 
ADD CONSTRAINT fk_companies
FOREIGN KEY(company_id) REFERENCES companies(company_id);

-- TABLAS N:M

CREATE TABLE languages(
	languages_id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(100) NOT NULL
);

ALTER TABLE languages
RENAME COLUMN languages_id TO language_id;

CREATE TABLE users_languages(
	users_languages_id int AUTO_INCREMENT PRIMARY KEY,
    user_id int,
    language_id int,
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(language_id) REFERENCES languages(language_id),
    UNIQUE(user_id, language_id)
);

-- Almacenamiento de datos relacionados
-- Datos 1:1

INSERT INTO dni(dni_number, user_id) VALUES(11111111, 1);
INSERT INTO dni(dni_number, user_id) VALUES(22222222, 1);
INSERT INTO dni(dni_number, user_id) VALUES(33333333, 3);
INSERT INTO dni(dni_number) VALUES(44444444);

-- Datos 1:N

INSERT INTO companies (name) VALUES('MoureDev');
INSERT INTO companies (name) VALUES('Apple');
INSERT INTO companies (name) VALUES('Google');
INSERT INTO companies (company_id) VALUES(5); -- No se va a crear, porque requiere un nombre.

UPDATE users SET company_id = 1 WHERE user_id = 1;
UPDATE users SET company_id = 2 WHERE user_id = 3;
UPDATE users SET company_id = 3 WHERE user_id = 4;
UPDATE users SET company_id = 1 WHERE user_id = 7;

-- Datos N:M

INSERT INTO languages (name) VALUES ('Swift');
INSERT INTO languages (name) VALUES ('Kotlin');
INSERT INTO languages (name) VALUES ('JavaScript');
INSERT INTO languages (name) VALUES ('Java');
INSERT INTO languages (name) VALUES ('Python');
INSERT INTO languages (name) VALUES ('C#');
INSERT INTO languages (name) VALUES ('COBOL');

INSERT INTO users_languages (user_id, language_id) VALUES (1, 1);
INSERT INTO users_languages (user_id, language_id) VALUES (1, 2);
INSERT INTO users_languages (user_id, language_id) VALUES (1, 5);
INSERT INTO users_languages (user_id, language_id) VALUES (2, 3);
INSERT INTO users_languages (user_id, language_id) VALUES (2, 5);
INSERT INTO users_languages (user_id) VALUES (1); -- NOT NULL

-- Consulta de Relaciones
-- Inner Join

SELECT * FROM users
INNER JOIN dni;

SELECT * FROM users
INNER JOIN dni
ON users.user_id = dni.user_id;

SELECT * FROM users
JOIN dni
ON users.user_id = dni.user_id;

SELECT * FROM users
JOIN dni
ON users.user_id = dni.user_id
ORDER BY age DESC;

SELECT * FROM users
JOIN dni
ON users.user_id = dni.user_id
ORDER BY age ASC;

SELECT name, dni_number FROM users
JOIN dni
ON users.user_id = dni.user_id
ORDER BY age ASC;

SELECT * FROM users
JOIN companies
ON users.company_id = companies.company_id;

SELECT * FROM companies
JOIN users
ON users.company_id = companies.company_id;

SELECT companies.name, users.name FROM companies
JOIN users
ON users.company_id = companies.company_id;

SELECT * 
FROM users_languages
JOIN users ON users_languages.user_id = users.user_id
JOIN languages ON users_languages.language_id = languages.language_id;

SELECT users.name, languages.name 
FROM users_languages
JOIN users ON users_languages.user_id = users.user_id
JOIN languages ON users_languages.language_id = languages.language_id;

-- LEFT JOIN

SELECT * FROM users
LEFT JOIN dni
ON users.user_id = dni.user_id;

SELECT name, dni_number FROM users
LEFT JOIN dni
ON users.user_id = dni.user_id;

SELECT name, dni_number FROM dni
LEFT JOIN users
ON users.user_id = dni.user_id;

SELECT users.name, languages.name 
FROM users_languages
LEFT JOIN users ON users_languages.user_id = users.user_id
LEFT JOIN languages ON users_languages.language_id = languages.language_id;

-- RIGHT JOIN

SELECT * FROM users
RIGHT JOIN dni
ON users.user_id = dni.user_id;

SELECT name, dni_number FROM dni
RIGHT JOIN users
ON users.user_id = dni.user_id;

SELECT users.name, languages.name 
FROM users_languages
RIGHT JOIN users ON users_languages.user_id = users.user_id
RIGHT JOIN languages ON users_languages.language_id = languages.language_id;

-- UNION / FULL JOIN

SELECT user_id FROM users
UNION
SELECT user_id FROM dni;

SELECT user_id FROM users
UNION ALL
SELECT user_id FROM dni;

SELECT users.user_id AS u_user_id, dni.user_id AS d_user_id
FROM users
LEFT JOIN dni
ON users.user_id = dni.user_id
UNION
SELECT users.user_id AS u_user_id, dni.user_id AS d_user_id
FROM users
RIGHT JOIN dni
ON	users.user_id = dni.user_id;

SELECT *
FROM users
LEFT JOIN dni
ON users.user_id = dni.user_id
UNION
SELECT *
FROM users
RIGHT JOIN dni
ON	users.user_id = dni.user_id;

-- Conceptos Avanzados
-- INDEX

CREATE INDEX idx_name ON users(name);

CREATE UNIQUE INDEX idx_name ON users(name);

CREATE UNIQUE INDEX idx_name_surname ON users(name, surname);

SELECT * FROM users WHERE name = "brais";

DROP INDEX idx_name ON users;

-- TRIGGERS

-- CREATE TRIGGER tg_email
-- BEFORE/AFTER INSERT/UPDATE/DELETE

DELIMITER //
CREATE TRIGGER tg_email
AFTER UPDATE ON users
FOR EACH ROW
BEGIN
    IF OLD.email <> NEW.email THEN
        INSERT INTO email_history(user_id, email)
        VALUES (OLD.user_id, OLD.email);
    END IF;
END;
//
DELIMITER ;

UPDATE users SET email = 'mouredev@gmail.com' WHERE user_id = 1;

DROP TRIGGER tg_email;

-- VIEWS

CREATE VIEW v_adult_users AS
SELECT name, age
FROM users
WHERE age >= 18;

SELECT * FROM v_adult_users;

DROP VIEW v_adult_users;

-- STORED PROCEDURE

DELIMITER //
CREATE PROCEDURE p_all_users()
BEGIN
	SELECT * FROM users;
END//

CALL p_all_users;

DELIMITER //
CREATE PROCEDURE p_age_users(IN age_param int)
BEGIN
	SELECT * FROM users WHERE age = age_param;
END//

CALL p_age_users(30);

DROP PROCEDURE p_age_users;