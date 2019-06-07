/// @description Insert description here
// You can write your code in this editor
var centerx = x+(sprite_width/2)*image_xscale;
var centery = y+(sprite_height/2)*image_yscale;
if(perform){
	shaker(5,10,obj_Cam)
	part_embers_area_colored(centerx-16,centerx+16,centery-16,centery+16,40,type);
	alarm_set(0,10);
	alarm_set(2,40);
	perform = 0;
	for(var i = 0; i<ds_list_size(target);i++){
		with(ds_list_find_value(target,i)){
			open = 1;
		}
	}
}

if(activated){
	image_index = 1;
}else{
	image_index = 0;
}
