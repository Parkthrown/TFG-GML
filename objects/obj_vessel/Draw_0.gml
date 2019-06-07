/// @description Insert description here
// You can write your code in this editor
var xMult = sin(TIMER)*2;
var yMult = cos(TIMER)*2
var coloring = (instance_exists(Wax)) ? Wax.flameType: 0;
shader_set(sh_flameType);
flameType_set_palette(coloring);
draw_sprite(sprite_index,image_index,round(x+xMult),round(y+yMult));
shader_reset();
part_flames_area(1,coloring,bbox_left+xMult,bbox_top+yMult,bbox_right+xMult,bbox_bottom+yMult);
part_lights_area(obj_partManager.partLight16px,1,bbox_left,bbox_top,bbox_right,bbox_bottom);

