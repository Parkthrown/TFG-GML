///@arg group
///@arg state
///@arg script
///@arg args?
///@arg sub?

var state_obj = ds_map_create();
state_obj[?fsmData.stateScript] = argument[2];
if(argument_count > 3 && argument[3] != undefined) state_obj[?fsmData.stateArgs] = argument[3];
if(argument_count > 4) ds_map_add_map(state_obj,fsmData.subFSM,argument[4]);

ds_map_add_map(argument[0],argument[1],state_obj);

