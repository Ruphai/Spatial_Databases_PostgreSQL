/*DATA DEFINITION LANGUAGE*/
DROP TABLE IF EXISTS wetlands;
CREATE TABLE wetlands (
	wl_id	SERIAL	PRIMARY KEY, 
	wl_name	VARCHAR(10)	UNIQUE NOT NULL, 
	wl_system	VARCHAR(15)	DEFAULT 'Palustrine' CHECK (wl_system IN ('Riverine', 'Lacustrine', 'Palustrine')) NOT NULL,
	wl_subsys	VARCHAR(15)	DEFAULT	''	NOT NULL, 
	wl_class	VARCHAR(15),
	wl_width	DOUBLE PRECISION,
	wl_depth	DOUBLE PRECISION
);

/*Use the AddGeometry Column form POSTGIS to create your geometry colum */
SELECT AddGeometryColumn('wetlands', 'geom', 4326, 'MULTIPOLYGON', 2 )

