wax_part_jump();
audio_play_sound(snd_jump,1,0);
		
vsp = -uniformly_accelerated_speed_for(TILE_SIZE*2.5,FALLING_SPEED);
image_index = 0;
sprite_index = (holding) ?  WaxJumpHolding: WaxJump;
setState(states.Airborne, airStates.Regular);
animation = 1;

fsm_execute_state(fsm_map,ev_step,states.Airborne);