--EXPRESSIONS AND FUNCTIONS
-- The SQL FROM Clause includes an implicit loop
-- select 5 //shows only one single value of 5
--select 5 as five from raptor_surveys;  /*returns 5 for each record in the raptor_surveys table*/
--select random() from raptor_surveys; /*returns random number for each record in the table*/
-- SELECT nest*2 FROM raptor_surveys /*evaluates for every record in the table*/

-- USER DEFINED FUNCTIONS
CREATE FUNCTION add(integer, integer)
RETURN integer
AS 'SELECT $1 + $2;'
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT

