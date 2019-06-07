/// @description switcher
// You can write your code in this editor

switch(actual){
	#region default
	default:
		var nextMenu = ds_list_find_value(menus[?actual],selected);
		if(ds_map_find_value(menus,nextMenu)){
			menuSwitch(nextMenu,MENU_BASE_COOLDOWN,0,8);
		}else{
			menuAnimate(8,MENU_BASE_COOLDOWN);
		}
	break;
	#endregion
	#region initial
	case MENU_INITIAL:
		menuSwitch(MENU_MAIN);
		ds_list_pop(prev);
	break;
	#endregion
	#region start game
	case MENU_START_GAME:
			switch(selected){
				case 0:
					ds_list_clear(files);
					load_saveFiles(files);
					if(!instance_exists(global.player)){
						global.IO[0] = undefined;
						var engineSpawner = instance_create_depth(room_width/4.,GAME_HEIGHT/2.,100,obj_mainMenuEngineSpawner);
						var waxSpawner = instance_create_depth(room_width/2.,GAME_HEIGHT/2.,100,obj_mainMenuWaxSpawner);
						with(waxSpawner){
							alarm_set(0,35);
							vsp = 6;
						}
						with(engineSpawner){
							alarm_set(0,35);
						}
						with(obj_Cam){
							follow = waxSpawner;
							state = 0;
						}
					}else{
						global.IO[0] = global.player;
						with(obj_Cam){
							vec = [room_width/2.,MENU_SCENE_Y];
							state = 1;
							spd = 12;
						}
					}
					screenFlash(8);
					menuSwitch(ds_list_find_value(menus[?actual],selected),MENU_BASE_COOLDOWN,0,8);
					sleep(10);
				break;
			}
	break;
	#endregion
	#region singlePlayer
	case MENU_SINGLE_PLAYER:
	
	break;
	#endregion 
	#region File Options
	#endregion
	#region Exit
	case MENU_EXIT:
		switch(selected){
			case 0:
				menuBack();
			break;
				
			case 1:
				game_end();
			break;
		}
	break;
	#endregion
	#region Controller
	case MENU_CONTROLLER:
		switch(selected){
			case 0:
				global.contMap[?CONTROLS_MODE] = !global.contMap[?CONTROLS_MODE];
				controller_save();
			break;
				
			case 1:
				menuSwitch(ds_list_find_value(menus[?actual],selected),MENU_BASE_COOLDOWN,0,8);
			break;
		}
	break;
	#endregion
}

