-- ALTER TABLE
-- ADD

CREATE TABLE persons8 (
	id int NOT NULL AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime DEFAULT CURRENT_TIMESTAMP(),
    UNIQUE(id),
    PRIMARY KEY(id),
    CHECK(age>=18)
);

ALTER TABLE persons8 
ADD surname varchar(150);

-- RENAME COLUMN

ALTER TABLE persons8 
RENAME COLUMN surname TO description;

-- MODIFY COLUMN 

ALTER TABLE persons8 
MODIFY COLUMN description varchar(250);