///@arg group
///@arg state

var state_object = argument0[?argument1];
if(state_object == undefined){
	if(argument0[?states.Default] != undefined){
		return fsm_group_execute_state(argument0,states.Default);
	}
	return -1;
}


return script_execute(state_object[?fsmData.stateScript],state_object);


