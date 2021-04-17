-- GEOMETRY VERSUS GEOGRAPHY DATA TYPES
-- https://longitudestore.com/how-big-is-one-gps-degree
SELECT 
	--Since the default distance output from geometry type is in degrees, we have to convert it to 
	-- meters in order to better compare with the geography data type.
	ST_Distance('POINT(-122.33 47.606)'::geometry, 'POINT(-122.459444 47.241389)'::geometry)*111000,
	ST_Distance('POINT(-122.33 47.606)'::geography, 'POINT(-122.459444 47.241389)'::geography), 
	ST_Distance('POINT(-122.33 47.606)'::geometry, 'POINT(-177.425 47.658889)'::geometry)*111000,
	ST_Distance('POINT(-122.33 47.606)'::geography, 'POINT(-177.425 47.658889)'::geography),
	ST_Distance('POINT(-122.33 47.606)'::geometry, 'POINT(-21.96 64.15)'::geometry)*111000,
	ST_Distance('POINT(-122.33 47.606)'::geography, 'POINT(-21.96 64.15)'::geography)
	
--IF WE PAY ATTENTION TO THE DISTANCE DIFFERENCE AS THE SPATIAL EXTENT INCREASE, WE CAN TELL THAT THE GEOGRAPHY DATA TYPE
-- IS MORE ACCURATE. 