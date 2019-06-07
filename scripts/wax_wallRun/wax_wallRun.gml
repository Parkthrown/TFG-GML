///@arg direction

if(holding) wax_drop();

image_xscale = (argument[0] != 0) ? argument[0]: image_xscale;

if (!checkState(states.Airborne, airStates.WallRun) && argument[0] != 0){
	setState(states.Airborne, airStates.WallSquat);
	fsm_execute_state(fsm_map,ev_step,state);
	alarm_set(waxAlarms.coyotte,3);
	return;
}

if(argument[0] != 0) wax_wallRunHorizontal();
else wax_wallRunVertical();

