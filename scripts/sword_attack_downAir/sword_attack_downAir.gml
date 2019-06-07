var frame = floor(image_index);
if(frame >= 3 && frame <= 4){
	var hbox = hitbox(x-12*image_xscale,y-2,x+12*image_xscale,y+20,TARGETEABLE);
	var hStun = 0;
	for(var i = 0; i<ds_list_size(hbox); i++){
		if(attack_instance(hbox[|i],weapon[?weaponData.damage],10,weapon[?weaponData.knockback]*2,0,270)){
			shaker(1.2,15,obj_Cam);
			shots = approach(shots,5,1);
			vsp = min(vsp,-2.5);
			if(!hStun){
				sleep(2);
				hStun = 1;
			}
		}
	}
	ds_list_destroy(hbox);
}else if(frame < 3){
	if(frame_end(2)){
			audio_play_sound(snd_slash,1,0);
			if(abs(hsp) <= 1) hsp = image_xscale*1.25;
	}
}