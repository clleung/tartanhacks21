-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-03-06 22:35:00.045

-- tables
-- Table: Category
CREATE TABLE Category (
    category_id serial  NOT NULL,
    name varchar(100)  NOT NULL,
    description text  NOT NULL,
    risk_index int  NOT NULL,
    CONSTRAINT Category_pk PRIMARY KEY (category_id)
);

-- Table: Health_Condition
CREATE TABLE Health_Condition (
    condition_id serial  NOT NULL,
    name varchar(100)  NOT NULL,
    risk_index int  NOT NULL,
    CONSTRAINT Health_Condition_pk PRIMARY KEY (condition_id)
);

-- Table: Insurance_Company
CREATE TABLE Insurance_Company (
    company_id serial  NOT NULL,
    name varchar(100)  NOT NULL,
    CONSTRAINT Insurance_Company_pk PRIMARY KEY (company_id)
);

-- Table: Insurance_Plan
CREATE TABLE Insurance_Plan (
    email varchar(100)  NOT NULL,
    company_id int  NOT NULL,
    membership varchar(100)  NOT NULL,
    member_num varchar(100)  NOT NULL,
    "group" varchar(100)  NOT NULL,
    start_date date  NOT NULL,
    CONSTRAINT Insurance_Plan_pk PRIMARY KEY (email,company_id)
);

-- Table: Person
CREATE TABLE Person (
    email varchar(100)  NOT NULL,
    first_name varchar(100)  NOT NULL,
    last_name varchar(100)  NOT NULL,
    password varchar(100)  NOT NULL,
    birthday date  NOT NULL,
    street_1 varchar(100)  NOT NULL,
    street_2 varchar(100)  NOT NULL,
    city varchar(100)  NOT NULL,
    zip int  NOT NULL,
    state char(2)  NOT NULL,
    risk_assessment int  NOT NULL,
    phone varchar(20)  NOT NULL,
    CONSTRAINT Person_pk PRIMARY KEY (email)
);

-- Table: Person_Category
CREATE TABLE Person_Category (
    email varchar(100)  NOT NULL,
    category_id int  NOT NULL,
    CONSTRAINT Person_Category_pk PRIMARY KEY (email,category_id)
);

-- Table: Person_Health
CREATE TABLE Person_Health (
    email varchar(100)  NOT NULL,
    condition_id int  NOT NULL,
    CONSTRAINT Person_Health_pk PRIMARY KEY (email,condition_id)
);

-- Table: Person_Vaccine
CREATE TABLE Person_Vaccine (
    email varchar(100)  NOT NULL,
    date date  NOT NULL,
    provider_id int  NOT NULL,
    CONSTRAINT Person_Vaccine_pk PRIMARY KEY (email,date)
);

-- Table: Vaccine_Provider
CREATE TABLE Vaccine_Provider (
    provider_id serial  NOT NULL,
    name varchar(100)  NOT NULL,
    street_1 varchar(100)  NOT NULL,
    street_2 varchar(100)  NOT NULL,
    city varchar(100)  NOT NULL,
    zip int  NOT NULL,
    state char(2)  NOT NULL,
    phone varchar(20)  NOT NULL,
    website varchar(200)  NOT NULL,
    CONSTRAINT Vaccine_Provider_pk PRIMARY KEY (provider_id)
);

-- foreign keys
-- Reference: Category_Person_Category (table: Person_Category)
ALTER TABLE Person_Category ADD CONSTRAINT Category_Person_Category
    FOREIGN KEY (category_id)
    REFERENCES Category (category_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Health_Condition_Person_Health (table: Person_Health)
ALTER TABLE Person_Health ADD CONSTRAINT Health_Condition_Person_Health
    FOREIGN KEY (condition_id)
    REFERENCES Health_Condition (condition_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Insurance_Company_Insurance_Plan (table: Insurance_Plan)
ALTER TABLE Insurance_Plan ADD CONSTRAINT Insurance_Company_Insurance_Plan
    FOREIGN KEY (company_id)
    REFERENCES Insurance_Company (company_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Insurance_Plan_Person (table: Insurance_Plan)
ALTER TABLE Insurance_Plan ADD CONSTRAINT Insurance_Plan_Person
    FOREIGN KEY (email)
    REFERENCES Person (email)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Person_Health_Person (table: Person_Health)
ALTER TABLE Person_Health ADD CONSTRAINT Person_Health_Person
    FOREIGN KEY (email)
    REFERENCES Person (email)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Person_Person_Category (table: Person_Category)
ALTER TABLE Person_Category ADD CONSTRAINT Person_Person_Category
    FOREIGN KEY (email)
    REFERENCES Person (email)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Person_Vaccine_Person (table: Person_Vaccine)
ALTER TABLE Person_Vaccine ADD CONSTRAINT Person_Vaccine_Person
    FOREIGN KEY (email)
    REFERENCES Person (email)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Vaccine_Provider_Person_Vaccine (table: Person_Vaccine)
ALTER TABLE Person_Vaccine ADD CONSTRAINT Vaccine_Provider_Person_Vaccine
    FOREIGN KEY (provider_id)
    REFERENCES Vaccine_Provider (provider_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

