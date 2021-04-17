-- GEOMETRIES FUNCTIONS: WHAT CAN WE DO WITH GEOMETRIES?
-- I. GET INFORMATION ABOUT IT: 
-- SELECT GeometryType(geom), ST_Dimension(geom), ST_CoordDim(geom), ST_SRID(geom), ST_IsCollection(geom)
--	FROM baea_nests
-- SELECT project, GeometryType(geom), ST_Dimension(geom), ST_CoordDim(geom), ST_SRID(geom), ST_IsCollection(geom), ST_NumGeometries(geom) AS ng, ST_NPoints(geom) AS np 
-- 	FROM linear_projects
-- 	ORDER BY ng DESC, np DESC;
	
-- SELECT l.project, ST_IsValidReason(geom) 
-- 	FROM linear_projects l
-- 		WHERE NOT ST_IsValid(geom);

-- SELECT habitat_id, ST_IsValidReason(b.geom), ST_NumGeometries(b.geom)
-- 	FROM buowl_habitat b
-- 		WHERE NOT ST_IsValid(b.geom);

-- II. CHANGE ITS SPATIAL REFERENCE SYSTEMS
-- SETTING THE COORDINATE REFERENCE SYSTEMS AND TRANSFORMING THEM ALSO.
-- SETTING THE CRS
SELECT 
	nest_id,
	geom, ST_AsEWKT(geom),
	ST_AsEWKT(ST_SetSRID(geom, 26913)),
	ST_AsEWKT(ST_Transform(geom, 26913))
		FROM baea_nests;

-- III. MEASURE IT
SELECT 
	project,
	ST_GeometryType(geom),
	ST_Length(geom::geography), 
	ST_Length(ST_Transform(geom, 26913)),
	ST_LengthSpheroid(geom, 'SPHEROID["GRS_1980",6378137,298.257222101]'),
	((ST_Length(geom::geography) - ST_Length(ST_Transform(geom, 26913)))/ST_Length(geom::geography))*100 AS diff
		FROM linear_projects
		ORDER BY diff DESC;

SELECT
	habitat_id, 
	ST_Area(geom::geography), 
	ST_Perimeter(geom::geography)
		FROM buowl_habitat;
		

-- IV. CALCULATE DISTANCES FROM OTHER GEOMETRIES.

-- V. SEE ITS COORDINATES IN TEXT FORM
SELECT
	nest_id, 
	ST_AsText(geom), 
	ST_AsEWKT(geom), 
	ST_AsGeoJSON(ST_Transform(geom, 26913), 1), 
	ST_AsGML(geom), 
	ST_AsKML(geom) 
		FROM baea_nests;

-- VI. ACCESS INDIVIDUAL COORDINATES
SELECT	
	nest_id,
	long_x_dd,
	lat_y_dd,
	ST_X(geom), 
	ST_Y(geom), 
	ST_X(ST_Transform(geom, 26913)), -- Transform to UTM
	ST_Y(ST_Transform(geom, 26913))
		FROM baea_nests;

SELECT
	project, 
	ST_AsText(ST_startpoint(ST_GeometryN(geom, 1))) AS startpoint,
	ST_AsText(ST_LineInterpolatePoint(ST_GeometryN(geom, 1), 0.5)) AS midpoint, --MidPoint
	ST_AsText(ST_endpoint(ST_GeometryN(geom, 1))) AS endpoint
		FROM linear_projects;
