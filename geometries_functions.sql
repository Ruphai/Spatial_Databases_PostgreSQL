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
	((ST_Length(geom::geography) - ST_Length(ST_Transform(geom, 26913)))/ST_Length(geom::geography))*100 AS diff
		FROM linear_projects
		ORDER BY diff DESC;
		
