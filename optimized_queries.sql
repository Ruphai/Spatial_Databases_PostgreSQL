--OPTIMIZED QUERIES
SELECT
	p.project, 
 	p.type,
	r.nest_id, 
 	r.recentspec, 
 	r.recentstat,
 	r.lastsurvey,
 	s.date, 
 	s.result, 
	--ST_Distance(p.geom::geography, r.geom::geography)
	ST_Distance(ST_Transform(p.geom, 26913), ST_Transform(r.geom, 26913))
FROM linear_projects p
JOIN raptor_nests r
ON ST_DWithin(p.geom, r.geom, 0.005)
JOIN raptor_surveys s
ON r.nest_id=s.nest
ORDER BY p.project, r.nest_id;