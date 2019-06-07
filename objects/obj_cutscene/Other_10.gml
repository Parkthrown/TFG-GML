/// @description Insert description here
// You can write your code in this editor
if(current >= ds_list_size(actions)){
	instance_destroy();
	exit;
}
var arr = ds_list_find_value(actions,current);
switch(arr[0]){
	#region case Scrpit
		case cutscenes.Script:
			arr = arr[1];
			script_execute(arr[0],arr[2]);
			current++;
			if(arr[1]) event_user(0);
		break;
	#endregion
	#region case object
		case cutscenes.CreateObject:
		//[1, [obj, 1, [script, data] ] ];
			arr = arr[1];
			var inst = instance_create_depth(0,0,0,arr[0]);
			switch(arr[1]){
				case 1:
					arr = arr[2];
					with(inst){
						script_execute(arr[0],arr[1]);
					}
				break;
			}
			current++;
			event_user(0);
		break;
	#endregion
	#region case Camera Movement
		case cutscenes.Camera:
			arr = arr[1]
			var camState = arr[0];
			if(instance_exists(obj_Cam)){
				with(obj_Cam){
					state = camState;
					show_debug_message("camera exists\n state is:" + string(state));
					switch(state){
						case 0:
							var params = arr[1];
							follow = params[0];
							spd = params[1];
						break;
						case 1:
							var params = arr[1];
							vec = params[0];
							spd = params[1];
						break;
						case 2:
							var params = arr[1];
							vec = params[0];
							spd = params[1];
						break;
					}
				}
				current++;
			}else{
				instance_create_depth(0,0,1,obj_Cam);
				event_user(0);
			}
			event_user(0);
		break;
	#endregion
	#region case Character Action
		case cutscenes.ObjectActions:
			arr = arr[1];
			if(instance_exists(arr[0])){
				with(arr[0]){
					switch(arr[1]){
						//case sprite swap
						case objectActions.SpriteSwap:
							sprite_index = arr[2];
							image_index = arr[3];
							if(variable_instance_exists(id,"state")) state = states.Cutscene;
							current = (arr[4]) ? current+1: current;
						break;
						//case overseer object
						case objectActions.Overseer:
							
						break;
						//case set variable
						case objectActions.SetVariables:
							variable_instance_set(id,arr[2],arr[3]);
						break;
						//case script
						case objectActions.Script:
						var arr = arr[2];
							script_execute(arr[0],arr[1]);
						break;
					}
				}
			}
			current++;
			event_user(0);
		break;
	#endregion
	#region case Alarm
		case cutscenes.Timer:
			arr = arr[1];
			alarm_set(arr[0],arr[1]);
			current++;
		break;
	#endregion
}