if(sprite_index == WaxWaffleIdle){
	draw_self();
}else{
	fsm_execute_state(fsm_map,event_type,states.Default);
}