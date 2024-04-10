-- ORDER_BY

SELECT * FROM users ORDER BY age;
SELECT * FROM users ORDER BY age ASC;
SELECT * FROM users ORDER BY age DESC;
SELECT * FROM users WHERE email = 'sara@gmail.com' ORDER BY age DESC;
SELECT name FROM users WHERE email = 'sara@gmail.com' ORDER BY age DESC;