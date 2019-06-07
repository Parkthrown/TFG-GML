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
#region throwing / shooting
	if(request_grab && (holding || !wax_grab())){
		animate(WaxThrow,0,true);
		setState(states.Airborne,airStates.Throwing);
	}
#endregion
#region holding
	if(movement_crouch_hold && holding) wax_drop();
#endregion
#region horizontal movement
	wax_air_movement_horizontal(movement_horizontal);
#endregion
#region vertical movent
if (vsp <= MAXFALLINGSPEED*weight){
	if(!movement_jump_hold || vsp >= 0){
		vsp += (global.grav*weight/(floatyness/1.5));
	}else if(vsp < 0){
		vsp += (global.grav*weight/floatyness);
	}
}
#endregion
#region doublejump
if((request_jump || (movement_jump_hold && autoWallRun)) && tilemap_get_at_pixel(WMAP,x,y)){
	wax_wallRun(movement_horizontal);
	autoWallRun = true;
}
#endregion
#region sprite changes
if(!animation){
	if(!holding){
		if(vsp > 0) sprite_index = WaxFall;
		if(vsp < 0) sprite_index = WaxRise;
	}else{
		sprite_index = WaxFallHolding;
	}
}
#endregion
#region sprite direction
	image_xscale = (sign(movement_horizontal)==sign(hsp) && abs(movement_horizontal) && !animation) ? sign(movement_horizontal): image_xscale;
#endregion
#region attacks
	if (request_attack) wax_attack_start((movement_crouch_hold) ? attackState.DownAir: attackState.AirSlash);
#endregion
#region modulation cutoff
if(sprite_index == WaxJump && !movement_jump_hold){
	if(round(image_index) == 2){
		sprite_index = WaxRise;
		animation = 0;
	}
}
#endregion

return  SUCCESS_CODE;