///@argument obj
///@argument box
///@argument damage
///@argument iframes
///@argument knockback
///@argument knockback_direction
///@argument knockback_angle

var success = 0;

if(instance_in_box(argument0,argument1,1,1)){
	var list = instance_in_box_list(argument0,argument1,1,1);
	for (var i = 0; i < ds_list_size(list); i++ ){
		if(attack_instance(list[|i],argument2,argument3,argument4,argument5,argument6)){
			success = 1;
		}
	}
	ds_list_destroy(list);
}

return success; 