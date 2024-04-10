-- CREATE

CREATE TABLE persons (
	id int,
    name varchar(100),
    age int,
    email varchar(50),
    created date
);

-- NOT NULL

CREATE TABLE persons2 (
	id int NOT NULL,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created date
);

-- UNIQUE

CREATE TABLE persons3 (
	id int NOT NULL ,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime,
    UNIQUE(id)
);

-- PRIMARY KEY

CREATE TABLE persons4 (
	id int NOT NULL ,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime,
    UNIQUE(id),
    PRIMARY KEY(id)
);

-- CHECK

CREATE TABLE persons5 (
	id int NOT NULL ,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime,
    UNIQUE(id),
    PRIMARY KEY(id),
    CHECK(age>=18)
);

-- DEFAULT

CREATE TABLE persons6 (
	id int NOT NULL,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime DEFAULT CURRENT_TIMESTAMP(),
    UNIQUE(id),
    PRIMARY KEY(id),
    CHECK(age>=18)
);

-- AUTO_INCREMENT

CREATE TABLE persons7 (
	id int NOT NULL AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime DEFAULT CURRENT_TIMESTAMP(),
    UNIQUE(id),
    PRIMARY KEY(id),
    CHECK(age>=18)
);

