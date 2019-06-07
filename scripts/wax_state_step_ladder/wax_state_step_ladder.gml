#region inputs
if(global.IO[0] == id){
	var movement_horizontal = global.input_movementHorizontal;
	var movement_vertical = global.input_movementVertical;
	var request_interact = global.input_interact;
	var movement_crouch_hold = global.input_crouchHold;
	var request_jump = global.input_jump;
	var movement_jump_hold =  global.input_jumpHold;
	var request_attack =  global.input_shoot;
	var request_roll =  global.input_roll;
	var request_grab = global.input_grab;
}else {
	var movement_horizontal = 0;
	var movement_vertical = 0;
	var request_interact = 0;
	var movement_crouch_hold = 0;
	var request_jump = 0;
	var movement_jump_hold =  0;
	var request_attack =  0;
	var request_roll =  0;
	var request_grab = 0;
}
#endregion
#region magnetise
	if(!place_meeting(x,y,obj_ladder)){
		state = states.Airborne;
		fsm_execute_state(fsm_map,ev_step,states.Airborne);
		return;
	}else{
		var _ladder = instance_place(x,y,obj_ladder);
		x = _ladder.bbox_right-(abs(_ladder.bbox_right-_ladder.bbox_left)/2-1);
	};
#endregion
#region vertical movement
	vsp = movement_vertical;
#endregion
#region dives
	if(request_roll && diveCount < maxJumps && alarm[1] < 0){
		wax_dive(movement_horizontal,4.25,-2,20);
		return;
	}
#endregion
#region collision
	collideV();
	y+=vsp;
#endregion
#region sprite direction
	image_xscale = (sign(movement_horizontal)!=0) ? sign(movement_horizontal): image_xscale;
#endregion