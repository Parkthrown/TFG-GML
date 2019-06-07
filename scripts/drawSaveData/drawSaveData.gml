///@argument0 map
///@argument1 x
///@argument2 y

var map = argument0;
var xx = argument1;
var yy = argument2;
var file = argument3;
var selected = argument4;
var vesselList = map[?"vessels"];
var filename = map[?"fileName"];
var vessels = ds_list_size(vesselList);
draw_nineSlice(spr_9slice_menu,xx,yy,xx+SAVE_FILE_WIDTH,yy+SAVE_FILE_HEIGHT);

shader_set(sh_flameType);
flameType_set_palette((selected) ? file+1: 0);
drawSaveFile(xx,yy,vessels,filename);
shader_reset();