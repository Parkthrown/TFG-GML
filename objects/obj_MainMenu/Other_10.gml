/// @description Action
// You can write your code in this editor
load_game(files[|file]);
ds_map_destroy(menus);
instance_create_depth(0,0,0,obj_gameManager);
instance_create_depth(0,0,0,obj_console);
global.time = 0.5;
show_debug_message(global.fileName);
room_goto((is_string(global.fileName) && string_length(global.fileName)) ?  L0Cutscene1: L0Cutscene1);