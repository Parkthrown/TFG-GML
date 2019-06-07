/// @description Insert description here
// You can write your code in this editor

var rollback = 0;
var pause = 0;
#region controls
if !(actual == MENU_CONTROLLER_BINDINGS || actual == MENU_KEYBOARD){
	if(!global.controls_gamepad){
		var sides = -keyboard_get(CONTROLS_LEFT)+keyboard_get(CONTROLS_RIGHT);
		downUp = -keyboard_get(CONTROLS_INTERACT) + keyboard_get(CONTROLS_CROUCH);
		var commit = keyboard_get_pressed(CONTROLS_JUMP);
		rollback = keyboard_get_pressed(CONTROLS_ATTACK);
		pause = keyboard_get_pressed(CONTROLS_PAUSE);
	}else{
		if(global.contMap[?CONTROLS_MODE] == 1){
			var sides = sign(gamepad_button_check(0,gp_padr) - gamepad_button_check(0,gp_padl));
			downUp = gamepad_button_check_pressed(0,gp_padu) - sign(gamepad_button_check(0,gp_padd));
		}else{
			var sides = sign(gamepad_axis_value(0,gp_axislh));
			downUp =  sign(gamepad_axis_value(0,gp_axislv));
		}
	var commit = controller_get_pressed(CONTROLS_JUMP,0);
	var rollback =  controller_get_pressed(CONTROLS_ATTACK,0);
	pause = controller_get_pressed(CONTROLS_PAUSE,0);
	}
}

#endregion
#region menu control
if(alarm[0] <= 0 && downUp != 0){

	if(ds_exists(menus[?actual],ds_type_list)){
		selected = (selected+downUp > ds_list_size(menus[?actual])-1) ? 0: 
		((selected+downUp < 0) ? ds_list_size(menus[?actual])-1: selected+downUp);
		alarm_set(0,10);
	}else if(ds_exists(menus[?actual],ds_type_map)){
		var f = ds_map_find_first(menus[?actual])
		repeat(selected) f  = ds_map_find_next(menus[?actual],f);
		selected = (selected+downUp > ds_map_size(menus[?actual])-1) ? 0: 
		((selected+downUp < 0) ? ds_map_size(menus[?actual])-1: selected+downUp);
		alarm_set(0,10);
	}
	
}
#endregion
#region data
switch(actual){
	#region main
	default:
		if(!alarm[0] && commit){
			event_user(menuEvents.switchAction);
		}
	break;
	#endregion
	#region Controller Bindings
	case MENU_CONTROLLER_BINDINGS:
	if(!gamepad_is_connected(0)){
		menuBack();
	}
		if(!alarm[0]){
			var i = padcheck_anyButton(0);
			var isset = 0;
			if(i){
				var current = ds_list_find_value(menus[?actual],selected);
				for(var j = ds_map_find_first(global.contMap);
					j != undefined;
					j = ds_map_find_next(global.contMap,j)){
					if(i == global.contMap[?j]){
						if(j!= selected){
							global.contMap[?j] = global.contMap[?current[1]];
							global.contMap[?current[1]] = i;
						}
						isset = 1;
						break;
					}
				}
				if(!isset){
					global.contMap[?current[1]] = i;
				}
				event_user(menuEvents.switchAction);
			}
		}
	break;
	#endregion
	#region Keyboard
	case MENU_KEYBOARD:
		if(!alarm[0]){
			var i = keyboard_check_pressed(vk_anykey);
			var isset = 0;
			if(i){
				var current = ds_list_find_value(menus[?actual],selected);
				i = keyboard_lastkey;
				for(var j = ds_map_find_first(global.kMap);
					j != undefined;
					j = ds_map_find_next(global.kMap,j)){
					if(i == global.kMap[?j]){
						if(j!= selected){
							global.kMap[?j] = global.kMap[?current[1]];
							global.kMap[?current[1]] = i;
						}
						isset = 1;
						break;
					}
				}
				if(!isset){
					global.kMap[?current[1]] = i;
					
				}
				event_user(menuEvents.switchAction);
			}
		}
	break;
	#endregion
}
#endregion
#region rollback
if((alarm[0] <= 0) && (rollback) && actual != MENU_SINGLE_PLAYER){
	event_user(menuEvents.menuBackAction);
}
#endregion
#region restart menu
if(pause){
		global.IO[0] = id;
		with(obj_Cam){
			vec = [GAME_WIDTH/2.,GAME_HEIGHT/2.+dist];
			spd = 8;
			state = 1;
			sway = 1;
		}
		ds_list_clear(prev);
		actual = MENU_MAIN;
}
#endregion