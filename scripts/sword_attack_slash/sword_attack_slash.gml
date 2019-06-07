#region inputs
if(global.IO[0] == id){
	var movement_horizontal = global.input_movementHorizontal;
}else {
	var movement_horizontal = 0;
}
#endregion
#region main Slash
		var frame = floor(image_index);
		if(frame >= 3 && frame <= 4){
			if(abs(hsp)<1) hsp = image_xscale/2;
			var hbox = hitbox(x+4*image_xscale,y-4,x+22*image_xscale,y+4,TARGETEABLE);
			var hStun = 0;
			for(var i = 0; i<ds_list_size(hbox); i++){
				if(attack_instance(hbox[|i],weapon[?weaponData.damage],10,weapon[?weaponData.knockback],0,45)){
					shaker(1.2,15,obj_Cam);
					approach(shots,5,1);
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
			if(movement_horizontal != 0){
				image_xscale = movement_horizontal;
			}
		}
#endregion