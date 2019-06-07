///@argument dir

if(abs(hsp)>2){
	if(argument0 == image_xscale){
		part_starts_create(10);
		setState(states.WallLatch,latchStates.WallKick)
		sprite_index = WaxLatched;
		hsp = 0;
		vsp = 0;
		alarm[2] = -1;
		alarm_set(waxAlarms.coyotte,10);
		sleep(1);
	}else{
		part_starts_create(10);
		setState(states.Airborne,airStates.Knocked);
		sprite_index = WaxHurt;
		image_index = 0;
		hsp = -sign(hsp)*1.75;
		vsp = -1.75;
		jumpCount++;
		shaker(4,7,obj_Cam);
		audio_play_sound(snd_land_low,1,0);
	}
}else hsp = 0;