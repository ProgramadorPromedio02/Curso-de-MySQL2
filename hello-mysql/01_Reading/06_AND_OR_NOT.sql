-- AND_OR_NOT

SELECT * FROM users WHERE NOT email = 'sara@gmail.com';
SELECT * FROM users WHERE NOT email = 'sara@gmail.com' AND age = 15;
SELECT * FROM users WHERE NOT email = 'sara@gmail.com' OR age = 15;