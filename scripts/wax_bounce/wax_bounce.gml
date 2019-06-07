///@argument0 vsp

if(place_meeting(x,y+vsp,obj_collisionable)){
	var bounceMe = instance_place(x,y+vsp,obj_collisionable);
	if(bounceMe.bbox_top > bbox_bottom && bounceMe.bouncy){
		vsp = argument0;
		diveCount = 0;
		jumpCount = 0;
		alarm[1] = 2;
		audio_play_sound(snd_stolen,1,0);
	}
}