/// @description Insert description here
// You can write your code in this editor
if(global.transition || global.paused)exit;
if(!grabber){
	persistent = false;
	Squash();
	switch(state){
		case 0:
			if(!isGrounded()){
				state = 1;
				break;
			}
			hsp = lerp(hsp,0,weight*0.25);
			collideH();
			x+=hsp;
		break;
		case 1:
			if(vsp <= 5){
				vsp += (global.grav*weight/6);
			}
			hsp = lerp(hsp,0,weight*0.05);
			collideH();
			x+=hsp;
			collideV();
			y+=vsp;
		break;
	}
}
if(global.align){
	if(abs(hsp) < 0.5 && alarm[2] <= 0){
		if(!collide_at(round(x),y)){
			hsp = 0;
			x = round(x);
		}
	}
}