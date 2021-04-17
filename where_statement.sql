SELECT --DISTINCT
/*DISTINCT is used to return only unique values */
	r.id,
	r.nest,
	r.date AS survey_date,
	r.result
		FROM raptor_surveys r
		--when working with date the expected format in PostgreSQL is "YYYY-MM-DD"
				--WHERE r.date = '2015-06-09' OR nest>200
		-- Wildcards and other predicated expressions like % and _ are used to select 
		-- multiple characters and single character respectively in a database
		-- Matching string expressions in PostgreSQL::
		--Think about Pattern Matching::https://www.postgresql.org/docs/9.3/functions-matching.html
		-- LIKE, NOT LIKE '%ACT%'
				--WHERE result LIKE '%ACT%'
		-- IN Operator:
		WHERE result NOT IN ('ACTIVE NEST', 'FLEDGED NEST')
		ORDER BY r.nest, r.date DESC