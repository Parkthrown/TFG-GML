///@desc Switch to a different menu with or without animations
///@argument0 New Menu;
///@argument1 coolDown
///@argument2 animated?
///@argument3 animation


ds_list_add(prev,actual);

alarm_set(uiAlarms.effects,1);

alarm_set(uiAlarms.cooldown,(argument_count > 1) ? argument[1]: MENU_BASE_COOLDOWN);

if(argument_count > 2){
	if(argument[2]) actual = argument[0];
	else next = argument[0];
}else{
	actual = argument[0];
	selected = 0;
}

if(argument_count > 3){
	timer = argument[3]
	alarm_set(uiAlarms.animations,timer);
}

//switchEffect();
