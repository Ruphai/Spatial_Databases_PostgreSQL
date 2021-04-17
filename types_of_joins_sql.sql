--MULTI TABLE QUERIES
-- We access data from different tables based on a common field.
-- It is good practice to fully qualify your tables/ column selection when you are working with multi-tables queries
--SELECT 
--	raptor_nests.id, nest, nest_id, date, result, recentspec 
--FROM raptor_surveys s, raptor_nests n
--	WHERE nest=nest_id;

-- CARDINALITY:: 1:1, 1:N, M:N
-- 
-- SELECT
-- 		n.id, s.nest, n.nest_id, s.date, s.result, n.recentspec
-- 		FROM raptor_surveys s, raptor_nests n
-- 		WHERE nest=nest_id AND s.result != 'ACTIVE NEST'
-- 		ORDER BY n.nest_id;
		
-- PART TWO: Multi-table queries::
--Types of JOINS
--Inner Join: The default join in postgres (if you do not specify the type)
-- INNER JOIN

/* SELECT n.id, s.nest, n.nest_id, s.date, s.result, n.recentspec
		FROM raptor_surveys s JOIN raptor_nests n
		ON nest=nest_id --WHERE s.result != 'ACTIVE NEST'
		ORDER BY n.nest_id;
		*/
		
-- LEFT OUTER JOIN
/* SELECT
		n.id, s.nest, n.nest_id, s.date, s.result, n.recentspec
		FROM raptor_surveys s LEFT OUTER JOIN raptor_nests n
		ON nest=nest_id
		ORDER BY n.nest_id;
		*/
		
-- RIGHT OUTER JOIN
/* SELECT
		n.id, s.nest, n.nest_id, s.date, s.result, n.recentspec
		FROM raptor_surveys s RIGHT OUTER JOIN raptor_nests n
		ON nest=nest_id
		ORDER BY n.nest_id;
		*/
-- FULL OUTER JOIN	
/* SELECT
		n.id, s.nest, n.nest_id, s.date, s.result, n.recentspec
		FROM raptor_surveys s FULL OUTER JOIN raptor_nests n
		ON nest=nest_id
		ORDER BY n.nest_id;
		*/
		
-- CROSS JOIN
-- SELECT
-- 		n.id, s.nest, n.nest_id, s.date, s.result, n.recentspec
-- 		FROM raptor_surveys s CROSS JOIN raptor_nests n
-- 		WHERE s.nest=n. nest_id AND s.result != 'ACTIVE NEST'
-- 		ORDER BY n.nest_id;


--PLAYING AROUND WITH PREDICATES AND AGGREGATE FUNCTIONS
SELECT 
	s.nest, n.nest_id, COUNT(s.*) 
	FROM raptor_surveys s 
	RIGHT OUTER JOIN raptor_nests n 
	ON s.nest=n.nest_id GROUP BY s.nest, n.nest_id
	ORDER BY n.nest_id;
	