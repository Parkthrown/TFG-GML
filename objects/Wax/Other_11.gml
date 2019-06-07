/// @description Vertical collision down
// You can write your code in this editor
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
Squash();
var nextState = groundStates.Regular;
switch(state){
	#region airborne
	case states.Airborne:
		switch(subState){
			#region default
				default:
					if(!movement_crouch_hold){
						sprite_index = WaxIdle;
					}else{
						sprite_index = WaxCrouch;
						nextState = groundStates.Crouch;
					}
				break;
			#endregion
			#region slash
				case airStates.Slash:
					nextState = groundStates.Slash;
				break;
			#endregion
			#region dive
				case airStates.Dive:
					if( abs(hsp) >1 ){
						image_index = (sprite_index == WaxDash && image_index > 2) ? 1: 0;
						sprite_index = waxDashEnd;
						animation = 1;
						
						nextState = groundStates.Walking;
						
						alarm_set(waxAlarms.particles,1);
						alarm_set(waxAlarms.dives,15);
						
					}else{
						alarm_set(1,(alarm[waxAlarms.dives] > 15) ? 15: alarm[waxAlarms.dives]);
					}
				break;
			#endregion
			#region knocked
				case airStates.Knocked:
					nextState = groundStates.Fallen;
					animate(WaxGroundSmack,0,1);
					alarm_set(waxAlarms.particles,1);
				break;
				case airStates.DownAir:
					nextState = groundStates.Fallen;
					animate(WaxGroundSmack,0,1);
				break;
			#endregion
		}
	break;
	#endregion
	#region wallLatch
	case states.WallLatch:
		alarm[waxAlarms.coyotte] = -1;
	break;
	#endregion
}
#region effects
if(vsp > 7){
	audio_play_sound(snd_land_low,1,0);
	shaker(0.5*vsp,3,obj_Cam);
}else if(vsp > 2){
	audio_play_sound(snd_land_low,1,0);
}
#endregion

setState(states.OnGround,nextState);
jumpCount = 0;
diveCount = 0;
hasLatched = 0;
autoWallRun = 0;
vsp = 0;

part_particles_create(global.part_system_front,x,bbox_bottom,obj_partManager.partWaxLanding,1);
y = round(y);