/// @description Insert description here
// You can write your code in this editor


with(obj_player){
	if(variable_instance_exists(id,"state")){
		state = (state == states.Cutscene) ? 0: state;
	}else{
		state = (state == states.Cutscene) ? 0: state;
	}
}
ds_list_destroy(actions);
actions = undefined;
show_debug_message("cutscene over");