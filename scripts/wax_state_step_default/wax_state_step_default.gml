var stateData = argument0;
var stateArgs = argument0[?fsmData.stateArgs];
var stateScript = argument0[?fsmData.stateScript];
var subFsm = argument0[?fsmData.subFSM];
if(subFsm != undefined) fsm_group_execute_state(subFsm,subState);