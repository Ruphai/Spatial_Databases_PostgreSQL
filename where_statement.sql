SELECT --DISTINCT
/*DISTINCT is used to return only unique values */
	r.id,
	r.nest,
	r.date AS survey_date,
	r.result
		FROM raptor_surveys r
		--when working with date the expected formated in postgresql is "YYYY-MM-DD"
				--WHERE r.date = '2015-06-09' OR nest>200
		-- Wildcards and other predicated expressions like % and _ are used to select 
		-- multiple characters and single character respectively in a database
		-- LIKE, NOT LIKE '%ACT%'
				--WHERE result LIKE '%ACT%'
		-- IN Operator:
		WHERE result NOT IN ('ACTIVE NEST', 'FLEDGED NEST')
		ORDER BY r.nest, r.date DESC