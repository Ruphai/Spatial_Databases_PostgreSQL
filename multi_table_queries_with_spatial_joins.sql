--MULTI-TABLE QUERIES BASED ON SPATIAL RELATIONSHIPS
-- TWO TABLES
-- SELECT
-- 	p.project, 
-- 	p.type, 
-- 	b.habitat_id, 
-- 	b.habitat, 
-- 	b.recentstat, 
-- 	ST_Distance(p.geom, b.geom)
-- FROM linear_projects p
-- JOIN buowl_habitat b
-- ON ST_Intersects(p.geom, b.geom)
-- ORDER BY p.project, b.habitat_id;

-- 
-- SELECT
-- 	p.project, 
-- 	p.type, 
-- 	b.habitat_id, 
-- 	b.habitat, 
-- 	b.recentstat, 
-- 	ST_Distance(p.geom, b.geom)
-- FROM linear_projects p
-- JOIN buowl_habitat b
-- ON ST_Distance(p.geom, b.geom)=0
-- ORDER BY p.project, b.habitat_id;

--
--
SELECT
	p.project, 
	p.type, 
	b.habitat_id, 
	b.habitat, 
	b.recentstat, 
	ST_Distance(p.geom, b.geom)
FROM linear_projects p
JOIN buowl_habitat b
ON ST_DWithin(p.geom, b.geom, 0)
ORDER BY p.project, b.habitat_id;

--THREE TABLES
-- SELECT
-- 	p.project, 
-- 	p.type,
-- 	r.nest_id, 
-- 	r.recentspec, 
-- 	r.recentstat,
-- 	r.lastsurvey,
-- 	s.date, 
-- 	s.result
-- FROM linear_projects p
-- JOIN raptor_nests r
-- ON ST_DWithin(p.geom, r.geom, 0.005)
-- JOIN raptor_surveys s
-- ON r.nest_id=s.nest
-- ORDER BY p.project, r.nest_id;