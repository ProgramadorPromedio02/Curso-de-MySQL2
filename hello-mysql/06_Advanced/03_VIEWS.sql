-- VIEWS

CREATE VIEW v_adult_users AS
SELECT name, age
FROM users
WHERE age >= 18;

SELECT * FROM v_adult_users;

DROP VIEW v_adult_users;