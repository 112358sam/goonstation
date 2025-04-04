/atom/movable/screen/parallax_render_source/foreground
	plane = PLANE_FOREGROUND_PARALLAX

// Space Layers
/atom/movable/screen/parallax_render_source/space_1
	parallax_icon_state = "space_1"
	parallax_value = 0

/atom/movable/screen/parallax_render_source/space_1/south
	parallax_value = 0.005
	scroll_speed = 240
	scroll_angle = 180

/atom/movable/screen/parallax_render_source/space_1/west
	parallax_value = 0.005
	scroll_speed = 240
	scroll_angle = 270


/atom/movable/screen/parallax_render_source/space_2
	parallax_icon_state = "space_2"
	parallax_value = 0.009
	blend_mode = BLEND_ADD

/atom/movable/screen/parallax_render_source/space_2/south
	scroll_speed = 240
	scroll_angle = 180

/atom/movable/screen/parallax_render_source/space_2/west
	scroll_speed = 240
	scroll_angle = 270


// Ocean Caustics
/atom/movable/screen/parallax_render_source/foreground/caustics
	parallax_icon = 'icons/misc/parallax_caustics.dmi'
	parallax_icon_state = "caustics"
	static_colour = TRUE
	blend_mode = BLEND_ADD
	alpha = 75
	parallax_value = 1


// Typhon
/atom/movable/screen/parallax_render_source/typhon
	parallax_icon = 'icons/misc/1024x1024.dmi'
	parallax_icon_state = "plasma_giant"
	static_colour = TRUE
	parallax_value = 0.015
	tessellate = FALSE

/atom/movable/screen/parallax_render_source/typhon/cogmap
	initial_x_coordinate = 0
	initial_y_coordinate = 167

/atom/movable/screen/parallax_render_source/typhon/cogmap2
	initial_x_coordinate = 300
	initial_y_coordinate = 140

/atom/movable/screen/parallax_render_source/typhon/kondaru
	initial_x_coordinate = 150
	initial_y_coordinate = 500

/atom/movable/screen/parallax_render_source/typhon/donut2
	initial_x_coordinate = 300
	initial_y_coordinate = 350

/atom/movable/screen/parallax_render_source/typhon/donut3
	initial_x_coordinate = -50
	initial_y_coordinate = 350


// Planets
/atom/movable/screen/parallax_render_source/planet
	parallax_icon = 'icons/misc/512x512.dmi'
	static_colour = TRUE
	parallax_value = 0.03
	tessellate = FALSE


/// inner system - Diner debris belt

/atom/movable/screen/parallax_render_source/planet/quadriga // the channel node is near here, an Io-like volcanic, a nasty place
	parallax_icon_state = "quadriga"
	initial_x_coordinate = 50
	initial_y_coordinate = -50
	parallax_value = 0.03

/atom/movable/screen/parallax_render_source/planet/amantes // the space butt, haven of gangs, clown town, shanty colonies
	parallax_icon_state = "amantes"
	initial_x_coordinate = 160
	initial_y_coordinate = 325
	parallax_value = 0.040

// donut 2 neighborhood

/atom/movable/screen/parallax_render_source/planet/fatuus // the scary bog planet, home of Biodome and New Memphis
	parallax_icon_state = "fatuus"
	initial_x_coordinate = 0
	initial_y_coordinate = 50
	parallax_value = 0.03

/*
/atom/movable/screen/parallax_render_source/planet/domusdei // need to resprite this
	parallax_icon_state = "domusDei"
	initial_x_coordinate = 450
	initial_y_coordinate = 450
	parallax_value = 0.025
*/

// the Mundus Gap, a safer economic and administrative hub

/atom/movable/screen/parallax_render_source/planet/mundus  //  tundra and glacier planet, home of Space Canada
	parallax_icon_state = "mundus"
	initial_x_coordinate = 200
	initial_y_coordinate = 100
	parallax_value = 0.03

/atom/movable/screen/parallax_render_source/planet/iustitia // a moon with a major spaceport, diplomatic and cultural hub
	parallax_icon_state = "iustitia"
	initial_x_coordinate = 400
	initial_y_coordinate = 100
	parallax_value = 0.035

/atom/movable/screen/parallax_render_source/planet/iudicium // a desolate moon with old military sites, bunkers, Ainley hospital
	parallax_icon_state = "iudicium"
	initial_x_coordinate = 0
	initial_y_coordinate = 100
	parallax_value = 0.045

/// fortuna area

/atom/movable/screen/parallax_render_source/planet/fortuna // a strategic layover point between the inner and outer rings
	parallax_icon_state = "fortuna"
	initial_x_coordinate = 0
	initial_y_coordinate = 100
	parallax_value = 0.04

// outer rings

/atom/movable/screen/parallax_render_source/planet/mors // worse than Mars. bad
	parallax_icon_state = "mors"
	initial_x_coordinate = 50
	initial_y_coordinate = 100
	parallax_value = 0.03

/atom/movable/screen/parallax_render_source/planet/regis // possibly blob infested
	parallax_icon_state = "regis"
	initial_x_coordinate = 200
	initial_y_coordinate = 100
	parallax_value = 0.04

/atom/movable/screen/parallax_render_source/planet/magus // acidic frigid horrible death-ocean planet, Nadir's home
	parallax_icon_state = "magus"
	initial_x_coordinate = 0
	initial_y_coordinate = 100
	parallax_value = 0.03

/atom/movable/screen/parallax_render_source/planet/regina // a captive comet, hosts a flea market, ice-water mining
	parallax_icon = 'icons/obj/large/320x320.dmi'
	parallax_icon_state = "regina"
	initial_x_coordinate = 120
	initial_y_coordinate = 120
	parallax_value = 0.045


// Asteroid Layers
/atom/movable/screen/parallax_render_source/asteroids_far
	parallax_icon_state = "asteroids_far"
	static_colour = TRUE
	parallax_value = 0.06

/atom/movable/screen/parallax_render_source/asteroids_far/kondaru
	scroll_speed = 100
	scroll_angle = 98


/atom/movable/screen/parallax_render_source/asteroids_near
	parallax_icon_state = "asteroids_near"
	static_colour = TRUE
	parallax_value = 0.1

/atom/movable/screen/parallax_render_source/asteroids_near/sparse
	parallax_icon_state = "asteroids_sparse"
	parallax_value = 0.15

/atom/movable/screen/parallax_render_source/asteroids_near/sparse/south
	scroll_speed = 240
	scroll_angle = 180


// Miscellaneous Layers
/atom/movable/screen/parallax_render_source/blowout_clouds
	parallax_icon_state = "blowout_clouds"
	static_colour = TRUE
	parallax_value = 0.5
	blend_mode = BLEND_ADD
	scroll_speed = 500
	scroll_angle = 240

/atom/movable/screen/parallax_render_source/meteor_shower
	parallax_icon_state = "meteors"
	static_colour = TRUE
	parallax_value = 0.5
	scroll_speed = 500
	scroll_angle = 0

// scrolling doesnt work if scroll_angle is changed after initialisation i think. So I made these.
/atom/movable/screen/parallax_render_source/meteor_shower/north
	scroll_angle = 180

/atom/movable/screen/parallax_render_source/meteor_shower/south
	scroll_angle = 0

/atom/movable/screen/parallax_render_source/meteor_shower/east
	scroll_angle = 270

/atom/movable/screen/parallax_render_source/meteor_shower/west
	scroll_angle = 90

// Effects

// Clouds
/atom/movable/screen/parallax_render_source/foreground/clouds
	parallax_icon_state = "clouds_3"
	color = list(
		0, 0, 0, -0.4,
		0, 0, 0, -0.4,
		0, 0, 0, -0.4,
		0, 0, 0, 1,
		0, 0, 0, 0)
	static_colour = TRUE
	parallax_value = 0.9
	scroll_speed = 5
	scroll_angle = 150

/atom/movable/screen/parallax_render_source/foreground/clouds/dense
	color = list(
		0, 0, 0, -0.4,
		0, 0, 0, -0.4,
		0, 0, 0, -0.4,
		0, 0, 0, 1,
		0, 0, 0, -0.5)
	parallax_icon_state = "clouds_1"
	parallax_value = 0.8
	scroll_speed = 1

/atom/movable/screen/parallax_render_source/foreground/clouds/sparse
	color = list(
		0, 0, 0, -0.4,
		0, 0, 0, -0.4,
		0, 0, 0, -0.4,
		0, 0, 0, 0,
		0, 0, 0, -0.4)
	parallax_icon_state = "clouds_2"
	parallax_value = 0.7
	scroll_speed = 10


// Adventure Zones

// Snow Storm Layers
/atom/movable/screen/parallax_render_source/foreground/snow
	parallax_icon_state = "snow_dense"
	color = list(
		1, 0, 0, 0.4,
		0, 1, 0, 0.4,
		0, 0, 1, 0.4,
		0, 0, 0, 1,
		0, 0, 0, -1)
	static_colour = TRUE
	parallax_value = 0.8
	scroll_speed = 100
	scroll_angle = 240

/atom/movable/screen/parallax_render_source/foreground/snow/sparse
	parallax_icon_state = "snow_sparse"
	color = null
	blend_mode = BLEND_ADD
	parallax_value = 0.9
	scroll_speed = 150

/atom/movable/screen/parallax_render_source/foreground/fog
	parallax_icon_state = "snow_dense"
	color = list(
		1, 0, 0, 0.4,
		0, 1, 0, 0.4,
		0, 0, 1, 0.4,
		0, 0, 0, 1,
		0, 0, 0, -1)
	static_colour = TRUE
	parallax_value = 0.8
	scroll_speed = 5
	scroll_angle = 180


// Dust Storm Layers
/atom/movable/screen/parallax_render_source/foreground/dust
	parallax_icon_state = "dust_dense"
	color = list(
		1, 0, 0, 0.8,
		0, 1, 0, 0.8,
		0, 0, 1, 0.8,
		0, 0, 0, 1,
		0, 0, 0, -1)
	static_colour = TRUE
	parallax_value = 0.8
	scroll_speed = 150
	scroll_angle = 240

/atom/movable/screen/parallax_render_source/foreground/dust/sparse
	parallax_icon_state = "dust_sparse"
	color = null
	blend_mode = BLEND_ADD
	parallax_value = 0.9
	scroll_speed = 225


// Embers Layers
/atom/movable/screen/parallax_render_source/foreground/embers
	parallax_icon_state = "embers_dense"
	color = list(
		1, 0, 0, -0.8,
		0, 1, 0, -0.8,
		0, 0, 1, -0.8,
		0, 0, 0, 1,
		0, 0, 0, -0.7)
	static_colour = TRUE
	parallax_value = 0.8
	scroll_speed = 25
	scroll_angle = 135

/atom/movable/screen/parallax_render_source/foreground/embers/sparse
	parallax_icon_state = "embers_sparse"
	color = null
	parallax_value = 0.9
	scroll_speed = 35


// Void Layers
/atom/movable/screen/parallax_render_source/void
	parallax_icon_state = "void"
	parallax_value = 0.1
	scroll_speed = 20
	scroll_angle = 150

/atom/movable/screen/parallax_render_source/void/clouds_1
	parallax_icon_state = "void_clouds_1"
	parallax_value = 0.4
	blend_mode = BLEND_ADD

/atom/movable/screen/parallax_render_source/void/clouds_2
	parallax_icon_state = "void_clouds_2"
	parallax_value = 0.7
	blend_mode = BLEND_ADD
