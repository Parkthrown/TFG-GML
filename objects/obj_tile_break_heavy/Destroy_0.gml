/// @description Insert description here
// You can write your code in this editor
var sw = sprite_width/2;
var sh = sprite_height/2;
for(var i = 0; i<random_range(3,5);i++){
	instance_create_depth(x+8*image_xscale,y+8*image_yscale,depth,obj_debris);
}
part_particles_create(global.part_system_front,x+sw,y+sh,obj_partManager.partSmokeBlastSmall,1);
shaker(1.8,7,obj_Cam);
var layer_id = layer_get_id(target);
if(layer_exists(layer_id)){
	var map_id = layer_tilemap_get_id(layer_id);
	if(layer_tilemap_exists(layer_id,map_id)){
		var data = tilemap_get_at_pixel(map_id, x, y);
		data = tile_set_empty(data);
		tilemap_set_at_pixel(map_id, data, x, y)
	}
}