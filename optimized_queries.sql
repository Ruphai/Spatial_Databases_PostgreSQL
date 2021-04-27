--OPTIMIZED QUERIES
SELECT
	p.project, 
 	p.type,
	r.nest_id, 
 	r.recentspec, 
 	r.recentstat,
 	r.lastsurvey,
 	--s.date, 
 	--s.result, 
	ST_Distance(p.geom::geography, r.geom::geography)
	--ST_Distance(ST_Transform(p.geom, 26913), ST_Transform(r.geom, 26913)) --Transform to UTM Zone 13
FROM linear_projects p
JOIN raptor_nests r
--ON ST_DWithin(p.geom, r.geom, 0.005)
ON ST_DWithin(p.geom::geography, r.geom::geography, 402.5) 
-- The Geography data type doesn't have a spatial index associated with it,
-- HOW SPATIAL INDEX WORKS and HOW Postgres process queries.
--JOIN raptor_surveys s
--ON r.nest_id=s.nest
--WHERE ST_Distance(p.geom::geography, r.geom::geography) < 402.5
ORDER BY p.project, r.nest_id;