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
#region horizontal movement
	hsp = lerp(hsp,((maxSpeed * movement_horizontal)/(alarm[2] ? 2: 1 )), 0.065);
#endregion
#region request_jump
	if(request_jump){
		wax_jump_squat();
		return SUCCESS_CODE;
	}
#endregion
#region dives
	if(request_roll && diveCount < maxJumps && alarm[1] < 0){
		wax_dive(movement_horizontal,2.75,-1.5,15);
		return FAILURE_CODE;
	}
#endregion
#region attacks
	if (request_attack) wax_attack_start(attackState.Slash);
#endregion
#region throwing / shooting
	if(request_grab && (holding || !wax_grab())){
		animate(WaxThrow,0,true);
		setState(states.OnGround,groundStates.Throwing);
	}
#endregion
#region sprites and subStates
	if(!animation){
		if (movement_crouch_hold){
			if(holding) wax_drop();
			sprite_index = WaxCrouch;
			setState(state,groundStates.Crouch);
			alarm_set(7,1);
			return SUCCESS_CODE;
		}
		if(abs(hsp) > 0 && movement_horizontal != 0){

			if(!holding){
				if(movement_horizontal != image_xscale){
					image_xscale = movement_horizontal;
					animate(WaxGroundDash,0,true);
		
					wax_part_groundDash(image_xscale);
		
					hsp = image_xscale * maxSpeed/2;
				}else sprite_index = WaxWalk;
			}else{
				sprite_index = WaxWalkHolding;
			}	
		}else{
			setState(state,groundStates.Regular);
		}
	}
#endregion
#region sprite direction
	image_xscale = (sign(movement_horizontal)!=0 && !animation) ? sign(movement_horizontal): image_xscale;
#endregion
return SUCCESS_CODE;