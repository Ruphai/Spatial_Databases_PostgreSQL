--SQL Views
--  SQL Views are virtual tables that are the results of a SQL query. 
-- This is in place in order to enforce the principles of good database design in cases where an intermediate table might be needed. 
-- Rather than duplicating tables, we create a view which updates itself.

/* CREATE VIEW raptor_survey_summary AS 
	SELECT
		n.nest_id, 
		COUNT(s.*) AS CNT,
		MAX(s.date) AS lastdate
			FROM raptor_nests n
			LEFT OUTER JOIN raptor_surveys s
			ON n.nest_id=s.nest
			GROUP BY n.nest_id
			ORDER BY n.nest_id
			*/
			
-- AFTER CREATING THE VIEW WE CAN ACCESS IT MORE LIKE A NORMAL TABLE. 
SELECT 
	n.nest_id, n.recentspec, s.cnt, s.lastdate 
	FROM raptor_survey_summary s, raptor_nests n 
		WHERE CNT > 0;
			
			