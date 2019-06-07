/// @description animations
// You can write your code in this editor


switch(actual){
	default:
		timer = TIMER_BASE;
		if(next != undefined && next != 0){
			actual = next;
			next = undefined;
			selected = 0;
		}
	break;
	case MENU_START_GAME:
		timer = 8;
		if(next != undefined && next != 0){
			actual = next;
			next = undefined;
			selected = 0;
			alarm_set(uiAlarms.animations,timer);
		}
	break;
	case MENU_CONTROLLER_BINDINGS:
		selected++;
		if(selected >= ds_list_size(menus[?actual])){
			controller_save();
			menuBack();
		}
		timer = TIMER_BASE;
	break;
	case MENU_KEYBOARD:
		selected++;
		if(selected >= ds_list_size(menus[?actual])){
			keyboard_save();
			menuBack();
		}
		timer = TIMER_BASE;
	break;
}