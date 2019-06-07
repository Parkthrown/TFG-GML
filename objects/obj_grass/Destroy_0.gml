/// @description Insert description here
// You can write your code in this editor
var sw = sprite_width/2;
var sh = sprite_height/2;

shaker(1.8,7,obj_Cam);
var layer_id = layer_get_id(target);
if(layer_exists(layer_id)){
	var map_id = layer_tilemap_get_id(layer_id);
	if(layer_tilemap_exists(layer_id, map_id))
		for(var i = 0; i<abs(bbox_left-bbox_right)/16;i++)
			for(var j = 0; j<abs(bbox_top-bbox_bottom)/16; j++){
				var xMult = i*16;
				var yMult = j*16
				var data = tilemap_get_at_pixel(map_id, x+xMult, y+yMult);
				data = tile_set_empty(data);
				tilemap_set_at_pixel(map_id, data, x+xMult, y+yMult);
				repeat(4)part_particles_create(global.part_system_front,x+xMult+8,y+yMult+8,obj_partManager.partDust,1);
			}
}