/// @description Insert description here
// You can write your code in this editor

saveRoom = 0;
saveInstances = ds_list_create();
saveInstances[|0] = save_character(Wax.id);
surface_clear(global.uiSurf);