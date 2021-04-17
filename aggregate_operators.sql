-- AGGREGATE OPERATORS AND FUNCTIONS
-- Aggregations functions are useful for summarizing data
-- SELECT COUNT(*), AVG(NEST), MAX(DATE) FROM raptor_surveys;
-- STATISTICAL AGGREGATE Functions:: STDEV(expression), VARIANCE(expression), CORR(exp1, exp2), COVAR(exp1, exp2)
-- SELECT r.nest, COUNT(*) FROM raptor_surveys WHERE result = 'ACTIVE NEST' GROUP BY nest ORDER BY nest;

SELECT
	r.nest, r.result, COUNT(*) AS CNT, MAX(date) AS maxdate
		FROM raptor_surveys r 
			GROUP BY r.nest, r.result 
			ORDER BY maxdate, r.result DESC;
		
-- SELECT 
-- 	* 
-- 		FROM buowl_habitat;

/* SELECT
 	CORR (postgis_fi::double precision, recentstat::double precision) AS hab_correl
 	FROM buowl_habitat;
	*/
	
	
