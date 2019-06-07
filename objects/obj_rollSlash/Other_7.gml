/// @description Insert description here
// You can write your code in this editor
HP--;
part_flames_area(6,flameType,bbox_left,bbox_top,bbox_right,bbox_bottom);
var col = global.palettes[|flameType];
part_lights_tinted_area(obj_partManager.partLight16px,2,col[1],bbox_left,bbox_top,bbox_right,bbox_bottom);