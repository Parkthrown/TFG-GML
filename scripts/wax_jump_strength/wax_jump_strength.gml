///@argument0 strength
wax_part_jump();
audio_play_sound(snd_jump,1,0);
		
vsp = argument0;
image_index = 0;
sprite_index = (holding) ?  WaxJumpHolding: WaxJump;
setState(states.Airborne, airStates.Regular);
animation = 1;

fsm_execute_state(fsm_map,ev_step,states.Airborne);