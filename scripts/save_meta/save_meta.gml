global.saveRooms = ds_map_create();
global.saveMap = ds_map_create();
global.saveMap[?obj_score] = ["x","y","depth"];
global.saveMap[?obj_keybox] = ["x","y","target","type","activated","perform"];
global.saveMap[?obj_ns_shdoor] =  ["x","y","sprite_index","image_index","image_speed"];
global.saveMap[?obj_tile_break_heavy] =  ["x","y"];
global.saveMap[?obj_checkPoint] = ["x","y","sprite_index","flameType","active"];

global.playerData = ds_map_create();
global.playerData[?Wax] = ["x","y","depth","HP","?weapon","?projectile","flameType"];

global.loadScripts = ds_map_create();
global.loadScripts[?obj_checkPoint] = checkpoint_check_save;
