-- Index

CREATE INDEX idx_name ON users(name);

CREATE UNIQUE INDEX idx_name ON users(name);

CREATE UNIQUE INDEX idx_name_surname ON users(name, surname);

SELECT * FROM users WHERE name = "brais";

DROP INDEX idx_name ON users;