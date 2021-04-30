--CHALLENGE Scenarios at a Small Consulting Service Company
/*1. A surveyor finds a new raptor nest and you need to know how many projects it will impact, how many acres of each, 
and the percent of each project impacted. */

SELECT
	r.nest_id,
	p.project, 
	p.type,
	Round((ST_Area(ST_Buffer(ST_Transform(p.geom, 26913), p.row_width))/4047)::numeric, 2)
		AS total_area,
		
	Round((ST_Area(ST_Intersection(ST_Buffer(ST_Transform(r.geom, 26913), 600)), --??? What is wrong here?
				   ST_Buffer(ST_Transform(p.geom, 26913), p.row_width))/4047)::numeric, 2) 
				   	AS impacted_area,
					
	Round(ST_Area(ST_Intersection(ST_Buffer(ST_Transform(r.geom, 26913), 600)), 
				  ST_Buffer(ST_Transform(p.geom, 26913), p.row_width)))/ST_Area(ST_Buffer(p.geom, p.row_width)) * 100 
				  	AS impact_pcnt,
					
	ST_Intersection(ST_Buffer(ST_Transform(r.geom, 26913), 600), ST_Buffer(ST_Transform(p.geom, 26913), p.row_width)) AS geom
		FROM raptor_nests r
		JOIN linear_projects p
		ON ST_DWithin(r.geom::geography, p.geom::geography, 600+p.row_width)
		WHERE r.nest_id=32;