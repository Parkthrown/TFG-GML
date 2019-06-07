/// @description
// You can write your code in this editor
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
var nextAnim = 0;
switch(sprite_index){
	case WaxHurt:
		sprite_index = WaxFall;
	break;
	case WaxGrab:
		sprite_index = WaxIdle;
	break;
	#region attacks
	case WaxSlash:
		switch(state){
			case states.OnGround:
				setState(states.OnGround,groundStates.Walking);
				sprite_index = WaxIdle;
			break;
			case states.Airborne:
				setState(states.Airborne,airStates.Regular);
				sprite_index = WaxRise;
			break;
		}
	break;
	case WaxDashSlash:
		hsp = 5*image_xscale;
		sprite_index = WaxDashSlashIdle;
	break;
	case WaxDownAir:
		setState(states.Airborne,airStates.Regular);
		sprite_index = WaxRise;
	break;
	case WaxRollSlice:
		cdMult = 70;
		alarm_set(0,cdMult);
		shots-=2;
		with(projectile_create(x,y,depth-1,obj_rollSlash)){
			flameType = other.flameType;
		}
		sprite_index = WaxDive;
	break;
	#endregion
	#region idle
	case WaxSit:
		repeat(3)
		part_particles_create(global.part_system_front,x+random_range(-8,8),y+8,obj_partManager.partDust,1);
		sprite_index = WaxSitIdle;
		audio_play_sound(snd_land_low,0,0);
		alarm_set(6,260);
	break;
	case WaxWaffle:
		repeat(4)
		part_particles_create(global.part_system_front,x+random_range(-8,8),y+8,obj_partManager.partDust,1);
		sprite_index = WaxWaffleIdle;
		audio_play_sound(snd_land_low,0,0);
	break;
	#endregion
	#region movement
	case WaxJumpSquat:
		nextAnim = 1;
		switch(subState) {
			case groundStates.JumpSquat:
				wax_jump_strength(JUMP_MAX_STRENGTH);
			break;
			case groundStates.WaveSquat:
				wax_waveDash(movement_horizontal);
			break;
		}
	break;
	case WaxThrow:
		switch(state) {
			case states.Airborne:
				setState(states.Airborne,airStates.Regular);
			break;
			case states.OnGround:
				setState(states.OnGround,groundStates.Regular);
			break;
		}
	break;
	case WaxJump:
		sprite_index = WaxRise;
	break;
	case WaxJumpHolding:
		sprite_index = WaxFallHolding;
	break;
	case WaxWaveDash:
		sprite_index = WaxCrouch;
	break;
	case WaxDash:
		if(checkState(states.Airborne,airStates.Dive)){
			sprite_index = WaxDive;
		}
	break;
	case waxDashEnd:
		sprite_index = WaxWalk;
		alarm[1] = alarm[1] > 10 ? 10: alarm[1];
	break;
	case WaxGroundSmack:
		setState(states.OnGround,groundStates.Regular);
		sprite_index = WaxIdle;
	break;
	#endregion
}
animation = nextAnim;

