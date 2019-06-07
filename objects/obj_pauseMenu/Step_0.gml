/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
//show_debug_message("aaaaaaaaa")

var rollback = 0;
var sides = 0;
var pause = 0;
var commit = 0;
downUp = 0;
#region controls
if!(actual == MENU_CONTROLLER_BINDINGS || actual == MENU_KEYBOARD){
	sides = global.input_movementHorizontal;
	downUp = global.input_movementVertical;
	commit = global.input_jump;
	rollback = global.input_shoot;
	pause = global.input_pause;
}

#endregion
if(pause){
	switch_pause();
	instance_destroy();
	exit;
}
if(alarm[0] <= 0 && downUp != 0){
	if(ds_exists(menus[?actual],ds_type_list)){
		selected = (selected+downUp > ds_list_size(menus[?actual])-1) ? 0: 
		((selected+downUp < 0) ? ds_list_size(menus[?actual])-1: selected+downUp);
		alarm_set(0,10);
	}
}
switch(actual){
#region main
	case MENU_MAIN:
		switch(selected){
			default:
				if((alarm[0] <= 0) && commit){
					menuSwitch(ds_list_find_value(menus[?actual],selected));
				}
			break;
			case 0:
				if((alarm[0] <= 0) && commit){
					switch_pause();
					instance_destroy();
				}
			break;
		}
	break;
	#endregion
#region settings
	case MENU_SETTINGS:
		if((alarm[0] <= 0) && commit){
			switch(selected){
				case 0:
					menuSwitch(ds_list_find_value(menus[?actual],selected));
				break;
				
				case 1:
				break;
			}
		}
	break;
#endregion
#region controls
	case MENU_CONTROLS:
		if((alarm[0] <= 0) && commit){
			menuSwitch(ds_list_find_value(menus[?actual],selected));
		}
	break;
#endregion
#region exit
	case MENU_EXIT:
		if((alarm[0] <= 0) && commit){
			switch(selected){
				case 0:
					menuBack();
				break;
				
				case 1:
					game_end();
				break;
			}
		}
	break;
#endregion
#region sound
	case MENU_SOUND:
			if((alarm[0] <= 0) && sides){
			switch(selected){
				
				case 0:
				break;
				
				case 1:
					menuSwitch(ds_list_find_value(menus[?actual],selected));
				break;
			}
		}
	break;
#endregion
#region controller
	case MENU_CONTROLLER:
		if((alarm[0] <= 0) && commit){
			switch(selected){
				case 0:
					global.contMap[?CONTROLS_MODE] = !global.contMap[?CONTROLS_MODE];
					controller_save();
				break;
				
				case 1:
					menuSwitch(ds_list_find_value(menus[?actual],selected));
				break;
			}
		}
	break;
#endregion
#region controller bindings
	case MENU_CONTROLLER_BINDINGS:
	if(!gamepad_is_connected(0)){
		menuBack();
	}
		if((alarm[0] <= 0)){
			var i = padcheck_anyButton(0);
			var isset = 0;
			if(i){
				for(var j = ds_map_find_first(global.contMap);
					j != ds_map_find_last(global.contMap);
					j = ds_map_find_next(global.contMap,j)){
					if(i == global.contMap[?j]){
						if(j!= selected){
							global.contMap[?j] = global.contMap[?ds_list_find_value(menus[?actual],selected)];
							global.contMap[?ds_list_find_value(menus[?actual],selected)] = i;
							selected++;
						}
						isset = 1;
						if(selected >= ds_list_size(menus[?actual])){
							controller_save();
							menuBack();
						}
						break;
					}
				}
				if(!isset){
					global.contMap[?ds_list_find_value(menus[?actual],selected)] = i;
					selected++;
					if(selected >= ds_list_size(menus[?actual])){
						controller_save();
						menuBack();
					}
				}
			}
		}
	break;
#endregion
#region keyboard
	case MENU_KEYBOARD:
		if((alarm[0] <= 0)){
			var i = keyboard_check_pressed(vk_anykey);
			var isset = 0;
			if(i){
				i = keyboard_lastkey;
				for(var j = ds_map_find_first(global.kMap);
					j != undefined;
					j = ds_map_find_next(global.kMap,j)){
					if(i == global.kMap[?j]){
						if(j!= selected){
							global.kMap[?j] = global.kMap[?ds_list_find_value(menus[?actual],selected)];
							global.kMap[?ds_list_find_value(menus[?actual],selected)] = i;
						}
						selected++;
						isset = 1;
						if(selected >= ds_list_size(menus[?actual])){
							keyboard_save();
							menuBack();
						}
						break;
					}
				}
				if(!isset){
					global.kMap[?ds_list_find_value(menus[?actual],selected)] = i;
					selected++;
					if(selected >= ds_list_size(menus[?actual])){
						keyboard_save();
						menuBack();
					}
				}
			}
		}
	break;
	#endregion
}
if((alarm[0] <= 0) && rollback){
	menuBack();
}