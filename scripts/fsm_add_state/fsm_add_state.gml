///@arg fsm
///@arg group
///@arg state
///@arg script
///@arg args?
///@arg sub?

var stateMap = ds_map_find_value(argument[0],argument[1]);
if( stateMap == undefined) stateMap = fsm_add_state_group(argument[0],argument[1]);

var state_obj = ds_map_create();
state_obj[?fsmData.stateScript] = argument[3];
if(argument_count > 4 && argument[4] != undefined) state_obj[?fsmData.stateArgs] = argument[4];
if(argument_count > 5) ds_map_add_map(state_obj,fsmData.subFSM,argument[5]);

ds_map_add_map(stateMap,argument[2],state_obj);
