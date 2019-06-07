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
#region request_jump
if(request_jump){
	setState(states.Airborne,airStates.Regular)
	sprite_index = waxDashEnd;
	image_index = 0;
	animation = 1;
	alarm[3] = -1;
	hsp = 2.5*-image_xscale;
	image_xscale = -image_xscale;
	vsp = -2;
	hasLatched = 0;
}
#endregion
#region dives
if(request_roll && diveCount < maxJumps && alarm[1] < 0){
	wax_dive(-image_xscale, 4.25, -2,20);
	return FAILURE_CODE;
}
#endregion
#region dropping
if(!collide_at(x+8*image_xscale,y)){
	alarm_set(3,1);
}
#endregion
#region vertical movement
	vsp = lerp(vsp,2,0.015);
#endregion
#region vertical collision
collideV();
y+=vsp;
#endregion

return SUCCESS_CODE;