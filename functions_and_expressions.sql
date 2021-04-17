--EXPRESSIONS AND FUNCTIONS
-- The SQL FROM Clause includes an implicit loop
-- select 5 //shows only one single value of 5
--select 5 as five from raptor_surveys;  /*returns 5 for each record in the raptor_surveys table*/
--select random() from raptor_surveys; /*returns random number for each record in the table*/
-- SELECT nest*2 FROM raptor_surveys /*evaluates for every record in the table*/

-- USER DEFINED FUNCTIONS I
-- CREATE FUNCTION add(integer, integer)
-- 	RETURN integer
-- 	AS 'SELECT $1 + $2;'
-- 		LANGUAGE SQL
-- 		IMMUTABLE
-- 	RETURNS NULL ON NULL INPUT;


-- USER DEFINED FUNCTIONS II:: PL/pgSQL (Procedural Language)
CREATE OR REPLACE FUNCTION add(inp1 integer, inp2 integer)
	RETURNS integer as 
	$$
	BEGIN 
		RETURN inp1 + inp2;
	END;
	$$ LANGUAGE plpgsql;
	
	
-- SCRIPTING LANGUAGES like Python and JavaScript also allow you to create these User defined functions

