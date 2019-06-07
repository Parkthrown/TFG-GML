
image_index = 0;
sprite_index = WaxFastRoll;	

vsp = -uniformly_accelerated_speed_for(TILE_SIZE*2,FALLING_SPEED);

setState(states.Airborne,airStates.WaveJump);
animations = 1;

wax_part_jump();
wax_part_dash(((sign(hsp) != 0) ? sign(hsp): image_xscale));
audio_play_sound(snd_jump,1,0);

shaker(2.5,8,obj_Cam);

alarm_set(waxAlarms.trail,1);