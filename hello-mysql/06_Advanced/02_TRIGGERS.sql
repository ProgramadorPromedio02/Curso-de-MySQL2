-- TRIGGERS

CREATE TABLE `hello_mysql`.`email_history` (
  `email_history_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `email` VARCHAR(100) NULL,
  PRIMARY KEY (`email_history_id`),
  UNIQUE INDEX `email_history_id_UNIQUE` (`email_history_id` ASC) VISIBLE);

DELIMITER //

-- CREATE TRIGGER tg_email
-- BEFORE/AFTER INSERT/UPDATE/DELETE

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