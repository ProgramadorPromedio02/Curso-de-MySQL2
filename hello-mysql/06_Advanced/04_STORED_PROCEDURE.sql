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