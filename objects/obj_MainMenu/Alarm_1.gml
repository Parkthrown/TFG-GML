/// @description effects
// You can write your code in this editor
var width = GAME_WIDTH;
var height = GAME_HEIGHT;
var hMid = width/2;
var vMid = height/2;
with(obj_Cam){
	vMid = y - dist;
	hMid = x;
}


switch(actual){
	
	default:
		var text = ds_list_find_value(menus[?actual],selected);
		if(is_string(text)){
			var tLen = string_length(text);
			var spacing = max(((tLen*8)/2)+8,48);
			part_particles_create(obj_partManager.emberSystems[|(selected%5)+1],hMid-spacing-16,vMid+42+selected*16,obj_partManager.flamePart,1);
			part_particles_create(obj_partManager.emberSystems[|(selected%5)+1],hMid+spacing+16,vMid+42+selected*16,obj_partManager.flamePart,1);
		}
	break;
	
	case MENU_INITIAL:
	break;
	
	case MENU_SINGLE_PLAYER:
	break;
	
	case MENU_FILE_OPTIONS:
	break;

}

alarm_set(1,12);