/// @description Init
event_inherited();
application_surface_draw_enable(0);

state = 0;
pal = global.cubeMap;

#region SPRITE & SHADER

shader = sh_lightEngine;

u_lights_offset = shader_get_uniform(shader, "u_vOffsetFix");
u_col = shader_get_uniform(shader, "col");
u_con_sat_brt = shader_get_uniform(shader, "con_sat_brt");
u_s_palette = shader_get_sampler_index(shader, "u_sPalette");
s_lights = shader_get_sampler_index(shader, "lights");

color = [];
con_sat_brt = [];

tex_lights = -1;
application_texture = surface_get_texture(application_surface);
application_texel_width = texture_get_texel_width(application_texture);
application_texel_height = texture_get_texel_height(application_texture);
surf_lights = -1;

cycle_speed = FRAME/2400;
//2400

color_mix = [];
color_target = [];

con_sat_brt_mix	= [];
con_sat_brt_target = [];
stretchs_per_key_time = 10;

fade_speed = 0;

ambientCallBack = 0;
callbackData = [];

key_previous = -1;
key_next = -1;

middleware = 0;

// arguments:R		G		  B			con		sat		brt		popS	popT
add_key_time(030,	125,	225,	0.60,	0.75,-0.20, 0.60,	0.65);	//00h
add_key_time(030,	125,	225,	0.60,	0.75,-0.20, 0.60,	0.65);	//01h
add_key_time(030,	125,	225,	0.60,	0.75,-0.20,	1.00,	0.65);	//02h
add_key_time(030,	125,	225,	0.60,	0.75,-0.20,	1.00,	0.65);	//03h
add_key_time(030,	125,	225,	0.60,	0.75,-0.20,	1.00,	0.65);	//04h
add_key_time(030,	125,	225,	0.60,	0.75,-0.20,	1.00,	0.65);	//06h
add_key_time(030,	125,	225,	0.60,	0.75,-0.20,	1.00,	0.65);	//07h
add_key_time(105,	100,	185,	0.70,	0.75,-0.15, 1.00,	0.60);	//08h
add_key_time(105,	100,	185,	0.70,	0.75,-0.10, 1.00,	0.60);	//09h
add_key_time(110,	115,	140,	1.00,	0.85,-0.05,	0.00,	0.00);	//10h
add_key_time(134,	136,	140,	1.00,	0.85,	0.00,	0.00,	0.00);	//11h
add_key_time(128,	128,	128,	1.00,	1.00,	0.00,	0.00,	0.00);	//12h
add_key_time(128,	128,	128,	1.00,	1.00,	0.00,	0.00,	0.00);	//13h
add_key_time(128,	128,	128,	1.00,	1.00,	0.00,	0.00,	0.00);	//14h
add_key_time(128,	128,	128,	1.00,	1.00,	0.00,	0.00,	0.00);	//15h
add_key_time(128,	128,	128,	1.00,	1.00,	0.00,	0.00,	0.00);	//16h
add_key_time(128,	128,	128,	1.00,	1.00,	0.00,	0.00,	0.00);	//17h
add_key_time(128,	128,	128,	1.00,	1.00,	0.00,	0.00,	0.00);	//18h
add_key_time(138,	113,	138,	1.00,	0.90,	0.00,	0.00,	0.00);	//19h
add_key_time(148,	098,	148,	1.00,	0.80,	0.00,	0.00,	0.00);	//20h
add_key_time(148,	098,	148,	1.00,	0.80,	0.00,	0.00,	0.00);	//21h
add_key_time(030,	125,	225,	0.60,	0.75,-0.20, 0.60,	0.65);	//22h
add_key_time(030,	125,	225,	0.60,	0.75,-0.20, 0.60,	0.65);	//23h

number_of_key_times = array_length_1d(color);

u_alpha	= shader_get_uniform(sh_alpha, "alpha");
alpha	= 0;

#endregion