\c postgres
DROP DATABASE IF EXISTS tartanhacks;

CREATE database tartanhacks;
\c tartanhacks

\i create.SQL

--Copies all the data from the csv files to tables
\copy Person(first_name, last_name, email, password, birthday, street_1, street_2, city, state, zip) FROM 'person.csv' csv header