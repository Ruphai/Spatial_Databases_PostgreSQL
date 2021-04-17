--SPATIAL REFERENCE IDs
-- PROJECTION, ZONES AND DATUM
-- SELECT * FROM spatial_ref_sys;
-- SELECT * FROM geometry_columns; -- returns the geometry information including the SRID and coordinate dimension for each table in the DB
-- SELECT ST_SRID(geom) FROM buowl_habitat; /*Returns the SRID for each record in the data field*/

--SELECT ST_SRID(geom), GeometryType(geom), geom, ST_AsText(geom) FROM buowl_habitat; -- MULTIPOLYGON
SELECT ST_SRID(geom), GeometryType(geom), geom, ST_AsText(geom) FROM baea_nests; --POINTS