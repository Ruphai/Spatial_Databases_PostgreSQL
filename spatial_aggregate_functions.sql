--SPATIAL AGGREGATE FUNCTIONS
-- SELECT
-- 	p.project,
-- 	r.recentspec,
-- 	r.recentstat,
-- 	COUNT(r.*) AS number_of_nest,
-- 	AVG(ST_Distance(p.geom::geography, r.geom::geography)) AS avg_distance
-- FROM linear_projects p
-- JOIN raptor_nests r
-- ON ST_DWithin(r.geom::geography, p.geom::geography, 402.5)
-- GROUP BY p.project, r.recentspec, r.recentstat
-- ORDER BY p.project, r.recentspec, r.recentstat;

-- SPATIAL AGGRE
SELECT
	p.project,
	r.nest_id,
	COUNT(s.*), 
	MAX(s.date)
FROM linear_projects p
JOIN raptor_nests r
ON ST_DWithin(r.geom::geography, p.geom::geography, 402.5)
LEFT OUTER JOIN raptor_surveys s
ON r.nest_id = s.nest
GROUP BY p.project, r.nest_id
ORDER BY p.project, r.nest_id;