var subFsm = argument0[?fsmData.subFSM];
if(subFsm != undefined){
	fsm_group_execute_state(subFsm,subState);
	return;
}else wax_draw_default();


