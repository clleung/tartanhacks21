-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-03-06 06:11:47.907

-- tables
-- Table: Person
CREATE TABLE Person (
    person_id serial  NOT NULL,
    first_name varchar(100)  NOT NULL,
    last_name varchar(100)  NOT NULL,
    email varchar(100)  NOT NULL,
    password varchar(100)  NOT NULL,
    birthday date  NOT NULL,
    street_1 varchar(100)  NOT NULL,
    street_2 varchar(100)  NULL,
    city varchar(100)  NOT NULL,
    state varchar(100)  NOT NULL,
    zip decimal(5,0)  NOT NULL,
    CONSTRAINT Person_pk PRIMARY KEY (person_id)
);

-- End of file.

