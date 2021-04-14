SELECT
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
	) AS subq;
