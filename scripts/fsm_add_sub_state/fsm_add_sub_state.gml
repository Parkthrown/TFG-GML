///@arg fsm
///@arg group
///@arg state
///@arg sub

var stateMap = ds_map_find_value(argument0,argument1);
if( stateMap == undefined) return -1;

var state_obj = stateMap[?argument2];
if(state_obj == undefined) return -1;

ds_map_add_map(state_obj,fsmData.subFSM,argument3);