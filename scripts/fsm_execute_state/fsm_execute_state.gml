///@arg fsm
///@arg group
///@arg state

var state_map = argument0[?argument1];
if(state_map == undefined){
	return -1;
}
var state_object = state_map[?argument2];
if(state_object == undefined){
	if(state_map[?states.Default] != undefined){
		return fsm_execute_state(argument0,argument1,states.Default);
	}
	return -1;
}

return script_execute(state_object[?fsmData.stateScript],state_object);

