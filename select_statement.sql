-- SELECT STATEMENT
-- SELECT * FROM [table];

-- SELECT AND THE ORDER BY Clause
/*SELECT 
	r.id,
	r.nest, 
	r.date, 
	LEFT(r.result, 3)
		FROM raptor_surveys r
			ORDER BY r.nest, r.date DESC; -- Remember that the default order is ASCENDING (Lowest to Highest)
			
			*/
			
-- ALIASES: We use aliases to provide a more descriptive names to the columns. See below:
SELECT 
	r.id*2 AS idx2,
	r.nest, 
	r.date AS survey_date, 
	LEFT(r.result, 3) AS result_code
		FROM raptor_surveys r
			ORDER BY r.nest, r.date DESC
			LIMIT 300;

-- SELECT Statement using subqueries
/*SELECT
	idx2, 
	survey_date, 
	result_code
	FROM( 
		SELECT
			r.id*2 AS idx2, 
			r.nest, r.date AS survey_date, 
			LEFT(r.result, 3) AS result_code 
			--INTO raptor_survey_sorted 
				FROM raptor_surveys r
			ORDER BY r.nest, r.date DESC
	) AS subq
	LIMIT 100;
	*/
