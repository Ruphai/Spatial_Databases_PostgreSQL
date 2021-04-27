--GEOMETRY PROCESSING FUNCTIONS
-- BUFFER
-- POINT BUFFER
SELECT nest_id, status, ST_Buffer(ST_Transform(geom, 26913), 804.5) AS geom FROM baea_nests;

--ONE Weakness of the QGIS DB Manager is that it doesn't return error messages. 
-- LINEAR BUFFER using radius value based on fields.
SELECT project, type, row_width, ST_Buffer(ST_Transform(geom, 26913), row_width) AS geom FROM linear_projects;

-- BUFFERING based on classification
SELECT 
	nest_id,
	recentspec, 
	recentstat, 
	lastsurvey, 
	ST_Buffer(ST_Transform(geom, 26913), CASE  WHEN recentspec = 'Red-tail hawk' THEN 600 ELSE 400 END) AS geom 
FROM raptor_nests;


-- MULTI-RING BUFFERS based oon multi-distances  UNION ALL (combines the results of multiple select queries into one one output)
SELECT 
	nest_id,
	ST_Buffer(ST_Transform(geom, 26913), 200) AS geom, 200 as bufdist FROM baea_nests

UNION ALL 

SELECT 
	nest_id,
	ST_Buffer(ST_Transform(geom, 26913), 400) AS geom, 400 as bufdist FROM baea_nests

UNION ALL

SELECT 
	nest_id,
	ST_Buffer(ST_Transform(geom, 26913), 800) AS geom, 800 as bufdist FROM baea_nests;
	

--ST_INTERSECTION
--GEOPROCESSING STYLE Intersection::
SELECT
	e.nest_id, 
	e.status,
	p.project, 
	p.type, 
	p.row_width, 
	ST_Intersection(ST_Buffer(ST_Transform(e.geom, 26913), 804.5), 
					ST_Buffer(ST_Transform(p.geom, 26913), p.row_width)) AS geom
					FROM baea_nests e 
					JOIN linear_projects p
					ON ST_DWithin(e.geom::geography, p.geom::geography, 804.5+p.row_width)
					

--ST_UNION
-- It performs more of a Dissolve function than a UNION in its real sense.
--ST_Union(geom1, geom2), ST_MemUnion(set) --less memory intensive, ST_UnaryUnion(geom1) -- 
-- Work on geometry only and not on geography. Can take an array of more than two geometries. 
-- MemUnion uses disk rather than memory



--ST_Difference(geom1, geom2)
-- Spatial Substraction. 

--ST_SymDifference(geom1, geom2)
-- Points in geom1 and geom2 that are not in both. 

--ST_ConvexHull(geom1)
--returns the outer boundary of a single geometry. 

-- ST_ConcaveHull(geom1, proportion)
-- returns the outer boundary of a set of geometry but shrunk by a specified percentage. 

--ST_Split(geometry, blade)
-- Split the input geometry into multiple paths

--ST_Subdivide(geometry, vertices)
-- create smaller inputs for every similar number of vertices. 

--ST_Simplify(geometry, tolerance), ST_SimplifyVW(geometry, tolerance)

--ST_MakeValid(geom)

-- ST_Collect(geom1, geom2)
-- Takes an array of or set as well. and combines them into multiple geom. 

--ST_Multi(geom)
-- Takes a single geom and turns it into multiparts geometry. 

