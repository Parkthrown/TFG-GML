/// @description Insert description here
// You can write your code in this editor
var centerx = x+(sprite_width/2)*image_xscale;
var centery = y+(sprite_height/2)*image_yscale;
if(perform){
	for(var i = 0; i<12;i++){
		with(instance_create_depth(centerx,centery,depth,obj_debris)){
			get_speed_from_angle(irandom(360),irandom_range(2,5));
		}
	}
	shaker(2,12,obj_Cam)
	ParticleSpawner_Localized(centerx,centery-4,spr_blast,0,0,0,0);
	part_embers_area_colored(centerx-16,centerx+16,centery-16,centery+16,40,type);
	alarm_set(0,10);
	perform = 0;
}

if(activated){
	for(var i = 0; i<ds_list_size(target);i++){
		with(ds_list_find_value(target,i)){
			open = 1;
		}
	}
	sprite_index = spr_keybox_on;
	if(alarm[0]<=1)part_embers_area_colored(centerx-16,centerx+16,centery-16-16,centery+16-16,2,type);
	perform = 0;
}
