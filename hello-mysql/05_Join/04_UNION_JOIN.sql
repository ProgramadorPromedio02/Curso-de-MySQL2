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