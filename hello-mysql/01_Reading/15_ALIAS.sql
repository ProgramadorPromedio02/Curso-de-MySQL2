-- ALIAS

SELECT name, init_date AS 'Fecha de inicio en programación' FROM users WHERE age BETWEEN 20 AND 30;
SELECT name, init_date AS "Fecha de inicio en programación" FROM users WHERE age BETWEEN 20 AND 30;
SELECT name, init_date AS "Fecha de inicio en programación" FROM users WHERE name = 'Brais';
SELECT name, init_date AS "Fecha de inicio en programación" FROM users WHERE name = "Brais";