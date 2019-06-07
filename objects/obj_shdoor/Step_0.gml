/// @description Insert description here
// You can write your code in this editor
switch(floor(image_index)){
	case 0:
		if(instance_exists(obj_key)){
			with(obj_key){
				if(other.lock == lock){
					other.open = 1;
					var arr = global.shortcuts[|global.level];
					arr[lock] = 1;
					global.shortcuts[|global.level] = arr;
					with(obj_overlayUI){
						waxUi_update(uiData.Keys);
					}
					show_debug_message(string(global.level) + " key " + string(lock) + " is " + string(arr[lock]));
					shaker(18,30,obj_Cam);
					instance_destroy();
				}
			}
		}
	break;
}