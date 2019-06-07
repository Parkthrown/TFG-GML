gml_pragma("global","pragma();");

#region aux variables
	global.collision_list = ds_list_create();
#endregion
#region directory setup

if(!directory_exists(CONFIG_DIRECTORY)){
	directory_create(CONFIG_DIRECTORY);
}

if(!directory_exists(SAVE_DIRECTORY)){
	directory_create(SAVE_DIRECTORY);
}
#endregion
#region controls
	global.input_movementHorizontal = 0;
	global.input_movementVertical = 0;
	global.input_interact = 0;
	global.input_crouchHold = 0;
	global.input_jump = 0;
	global.input_jumpHold=  0;
	global.input_shootHold = 0;
	global.input_roll =  0;
	global.input_rollHold = 0;
	global.input_grab = 0;
	global.input_grabHold = 0;
	global.input_pause = 0;
#endregion
#region controller data
global.controls_gamepad = 0;
global.contMap = ds_map_create();
if(!controls_load(global.contMap,CONTROLLER_FILE)){
	 
global.contMap[?CONTROLS_INTERACT] = gp_padu;
global.contMap[?CONTROLS_CROUCH] = gp_padd;
global.contMap[?CONTROLS_JUMP] = gp_face1;
global.contMap[?CONTROLS_ATTACK] = gp_face3;
global.contMap[?CONTROLS_ROLL] = gp_face2;
global.contMap[?CONTROLS_GRAB] = gp_face4;
global.contMap[?CONTROLS_PAUSE] = gp_start;
global.contMap[?CONTROLS_MODE] = 0;

}

#endregion
#region keyboard data
global.kMap = ds_map_create();
if(!controls_load(global.kMap,KEYBOARD_FILE)){
	
	global.kMap[?CONTROLS_JUMP] = vk_space;
	global.kMap[?CONTROLS_RIGHT] = ord("D");
	global.kMap[?CONTROLS_LEFT] = ord("A");
	global.kMap[?CONTROLS_INTERACT] = ord("W");
	global.kMap[?CONTROLS_CROUCH] = ord("S");
	global.kMap[?CONTROLS_ATTACK] = ord("K");
	global.kMap[?CONTROLS_ROLL] = ord("L");
	global.kMap[?CONTROLS_GRAB] = ord("P");
	global.kMap[?CONTROLS_PAUSE] = vk_escape;

}

#endregion
#region metadata
files_meta();
save_meta();
depth_meta();
death_meta();
interface_meta();
global.cape = sprite_add(CAPE_FILE,3,1,0,0,0);
#endregion
#region world/progression
global.player = Wax;
global.time = 0;
global.door = 0;
global.coins = 0;
global.level = 1;
global.vessels = ds_list_create();
global.shortcuts = ds_list_create();
global.navigator = ds_map_create();
navigation_create_navigator(global.navigator);
for(var i = 0; i<11; i++){
	global.shortcuts[|i] = [0,0,0,0];
}
#endregion
#region save data
	global.fileName = "";
#endregion
#region gameManager
global.saveZone = 0;
global.checkPointData = 0;
global.paused = 0;
global.debug = 0;
global.IO[0] = 0;
#endregion
#region physics
global.grav = 1;
#endregion
#region Layers/visual
global.part_system_front = part_system_create();
global.part_system_light = part_system_create();
global.part_system_gui = part_system_create();
part_system_depth(global.part_system_front,0);
part_system_automatic_draw(global.part_system_front,0);
part_system_automatic_update(global.part_system_front,0);
part_system_depth(global.part_system_light,0);
part_system_automatic_draw(global.part_system_light,0);
part_system_automatic_update(global.part_system_light,0);
part_system_depth(global.part_system_gui,0);
part_system_automatic_draw(global.part_system_gui,0);
part_system_automatic_update(global.part_system_gui,0);

global.palettes = ds_list_create();
global.palettes[|0]= [make_color_rgb(235,235,235),make_color_rgb(178,178,178),make_color_rgb(121,121,121)];
global.palettes[|1]= [make_color_rgb(255,162,0),make_color_rgb(227,81,0),make_color_rgb(178,16,48)];
global.palettes[|2]= [make_color_rgb(97,162,255),make_color_rgb(65,65,255),make_color_rgb(32,0,178)];
global.palettes[|3]= [make_color_rgb(255,211,32),make_color_rgb(73,170,16),make_color_rgb(48,97,65)];
global.palettes[|4]= [make_color_rgb(243,97,255),make_color_rgb(146,65,243),make_color_rgb(97,16,162)];
global.palettes[|5]= [make_color_rgb(255,255,255),make_color_rgb(178,16,48),make_color_rgb(60,60,60)];

global.glPalettes = ds_list_create();
for(var i = 0 ; i < ds_list_size(global.palettes); i++ ){
	ds_list_add(global.glPalettes,flameType_get_palette(i));
}

global.brightness = 0;
global.transition = 0;
global.align = 1;
global.shake = 1;
global.parallax_list = ds_list_create();
global.complexParallaxMap = ds_map_create();
global.cubeMap = sprite_get_texture(spr_pal,0);
global.gameSizeSurf = surface_create(GAME_WIDTH,GAME_HEIGHT);
#endregion
#region settings
global.game_xscale = 1;
global.game_yscale = 1;
#endregion
#region UI
global.uiSurf = surface_create(GAME_WIDTH,GAME_HEIGHT);
#endregion