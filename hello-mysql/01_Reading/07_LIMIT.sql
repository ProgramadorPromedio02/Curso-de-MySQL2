-- LIMIT

SELECT * FROM users LIMIT 3;
SELECT * FROM users WHERE NOT email = 'sara@gmail.com' OR age = 15 LIMIT 2;