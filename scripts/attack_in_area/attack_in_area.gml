///@argument obj
///@argument x1
///@argument y1
///@argument x2
///@argument y2
///@argument damage
///@argument iframes
///@argument knockback
///@argument knockback_direction
///@argument knockback_angle

var success = 0;

if(collision_rectangle(argument1,argument2,argument3,argument4,argument0,1,1)){
	var list = ds_list_create();
	collision_rectangle_list(argument1,argument2,argument3,argument4,argument0,1,1,list,0);
	for (var i = 0; i < ds_list_size(list); i++ ){
		if(deal_damage(list[|i],argument5)){
			with(list[|i]){
				var angle = (argument9 != 0) ? argument9: -Direction(other);
				knock_back_angle(list[|i],argument8,angle,argument7);
				alarm_set(2,argument6);
			}
			success = 1;
		}
	}
}

return success;