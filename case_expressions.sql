--POSTGRES CASE EXPRESSIONS
-- CASE I: A general way to look evaluate the database for different conditions
-- 
/*
SELECT 
		nest_id, 
		long_x_dd, 
		CASE
			WHEN long_x_dd < (-104.9) THEN 'West'
			WHEN long_x_dd > (-104.5) THEN 'East'
			ELSE 'Center'
		END AS location, 
		status 
	FROM baea_nests
	*/
	
-- CASE II: Aggregate Expressions + Case Expressions
SELECT
		CASE
			WHEN long_x_dd < (-104.9) THEN 'West'
			WHEN long_x_dd > (-104.5) THEN 'East'
			ELSE 'Center'
		END AS location,
		status,
		COUNT(*)
	FROM baea_nests
	GROUP BY location, status
	

