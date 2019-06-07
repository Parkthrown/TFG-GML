/// @description Insert description here
// You can write your code in this editor
if(instance_exists(target)){
	if(HP != target.HP){
		event_user(0);
	}
	if(flameType != target.flameType){
		flameType = target.flameType;
		event_user(0);
	}
	if(shots != target.shots){
		shots = target.shots;
		event_user(0);
	}
	if(targetWeapon != target.weapon){
		ds_map_clear(weapon);
		ds_map_copy(weapon,target.weapon);
		targetWeapon = target.weapon;
		event_user(0);
	}
	if(targetWeapon != target.weapon){
		ds_map_clear(weapon);
		ds_map_copy(weapon,target.weapon);
		targetWeapon = target.weapon;
		event_user(0);
	}
	hasResetted = 0;
}else if(!instance_exists(obj_screenFreeze) && !global.paused && !hasResetted){
	flameType = 0;
	HP = 0;
	shots = 0;
	hasResetted = 1;
	event_user(0);
}