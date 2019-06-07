/// @description Insert description here
// You can write your code in this editor

event_inherited();


switch(state){
	#region outwards
	case 0:
		distance = lerp(distance,distance_max,distance_ratio);

		flares_origin = TIMER+origin_offset;

		if(distance >= distance_max-end_deadzone) instance_destroy();
	break;
	#endregion
	#region inwards
	case 1:
		distance = (_approach) 
		? approach(distance,distance_min,distance_ratio) 
		: lerp(distance,distance_min,distance_ratio);

		flares_origin = TIMER-origin_offset;

		if(distance <= distance_min+end_deadzone) instance_destroy();
	break;
	#endregion
}