\c tartanhacks

--\echo Let's you know which table is being shown
-- SELECT * on all the tables gives you all the information in the tables
-- Tables are ordered by ids to make them easier to read

\echo Person
SELECT *
  FROM Person
 ORDER BY person_id ASC;