/// @description Insert description here
// You can write your code in this editor
var command = string_split(text," ");
var len = array_length_1d(command);
if(len){
	switch(command[0]){
		case "cape":
			var cape = (len > 1) ? command[1]: "-1";
			switch(cape){
				case "cobs":
					global.cape = spr_cobsCape
				break;
				case "pride":
					global.cape = spr_gayCape
				break;
				case "-1":
					global.cape = (global.cape) ? -1: spr_Cape;
				break;
				default:
					global.cape = spr_Cape
				break;
			}
		break;
		case "set":
			if(len > 1){
				var dgs = string_digits(command[1]);
				var obj = 0;
				if(command[1] != "global"){
					obj = ((string_length(dgs) && instance_exists(real(dgs))) && !asset_get_index(command[1])) ? real(dgs): asset_get_index(command[1]);
					if(len > 3 && instance_exists(obj) && variable_instance_exists(obj,command[2])){
						with(obj){
							variable_instance_set(id,command[2],(string_char_at(command[3],0) != "'") ? real(command[3]): command[3]);
						}
					}
				}else{
					if(len > 3 && variable_global_exists(command[2])){
						variable_global_set(command[2], (string_char_at(command[3],0) != "'") ? real(command[3]): command[3]);
					}
				}
			}
		break;
		case "goto":
			if(len > 1){
				var dgs = string_digits(command[1]);
				var _room = ((string_length(dgs) && room_exists(real(dgs))) && !asset_get_index(command[1])) ? real(dgs): asset_get_index(command[1]);
				if(room_exists(_room)){
					var door = instance_create_depth(0,0,0,obj_door);
					with(door){
						warpX = (len > 2) ? command[2]: 0;
						warpY = (len > 3) ? command[3]: 0;
						roomWarp = _room;
					}
					with(global.player){
						persistent = 1;
						setState(states.Cutscene,states.Default)
					}
					warp(door);
				}
			}
		break;
		case "ls":
			var arr = [];
			with(all){
				if(!object_is_ancestor(object_index,Interface)){
					arr[array_length_1d(arr)] = strcat(object_get_name(object_index),": ",id);
				}
				if(len > 1 && array_length_1d(arr) > real(command[1])){
					var deb = instance_create_depth(0,0,0,obj_debugWindowList);
					deb.vars = arr;
					arr = [];
				}
			}
			if(len == 1)
			with(instance_create_depth(0,0,0,obj_debugWindowList)){
				vars = arr;
			}
		break;
		case "cat":
			var dgs = string_digits(command[1]);
			var obj = 0;
			obj = ((string_length(dgs) && instance_exists(real(dgs))) && !asset_get_index(command[1])) ? real(dgs): asset_get_index(command[1]);
			if(len > 3 && instance_exists(obj)){
				with(instance_create_depth(0,0,0,obj_debugWindowVariables)){
					target = obj;
					for(var i = 2; i<len; i++){
						vars[i-2] = command[i];
					}
				}
			}
		break;
		case "create":
			if(len > 1){
				var obj = 0;
				if(asset_get_type(command[1]) == asset_object) obj = asset_get_index(command[1]);
				if(obj) with(instance_create_depth(0,0,0,obj)){
					get_depth_map();
					x = (len > 2) ? command[2] : 0;
					y = (len > 3) ? command[3] : 0;
				}
			}
		break;
		case "window":
			if(len > 2){
				var wreal = real(string_digits(command[1]));
				var hreal = real(string_digits(command[2]));
				if(len > 3){
					global.game_xscale = window_get_width()/wreal;
					global.game_yscale = window_get_height()/hreal;	
				}else{
					window_set_size(wreal, hreal);
				}
				application_resize(wreal,hreal);
				view_wport[view_current] = wreal;
				view_hport[view_current] = hreal;
				with(obj_Cam){
					event_user(0);
				}
			}
		break;
		case "center":
			window_center();
		break;
		case "save":
			save_game();
		break;
		case "partLookup":
			show_debug_message(part_particles_count(global.part_system_front));
		break;
		case "IO":
			global.IO[0] = (len > 1) ? real(command[1]): global.IO[0];
		break;
		case "kill":
			if(len > 1){
				var dgs = string_digits(command[1]);
				var toKill = ((string_length(dgs) && instance_exists(real(dgs))) && !asset_get_index(command[1])) ? real(dgs): asset_get_index(command[1]);
				with(toKill) instance_destroy();
			}
		break;
		case "ui":
			surface_clear(global.uiSurf);
			with(obj_overlayUI){
				doDraw = !doDraw;
			}
		break;
		case "switchPal":
			if(len > 1){
				var type = asset_get_type(command[1]);
				if(type == asset_sprite){
					global.cubeMap = sprite_get_texture(asset_get_index(command[1]),0);
					show_debug_message(command[1]);
				}else{
					show_debug_message(strcat(
					"----------------------\n",
					"ERROR; INCORRECT ASSET TYPE\n",
					"TYPE IS: ",
					type,
					" \nAND SHOULD BE asset_sprite\n",
					"----------------------"
					))
				}
			}
		break;
		case "exists":
			if(len > 1){
				var obj = 0;
				if(asset_get_type(command[1]) == asset_object) obj = asset_get_index(command[1]);
				if(obj) show_debug_message("exists");
			}
		break;
		case "count":
			if(len > 1){
				var obj = 0;
				var c = 0;
				if(asset_get_type(command[1]) == asset_object) obj = asset_get_index(command[1]);
				with(obj) {
					c++;
				}
				show_debug_message(c);
			}
		break;
	}
}

