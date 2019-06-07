/// @description Insert description here
// You can write your code in this editor
var actrad = 0.8;
if(instance_exists(global.player) && instance_exists(obj_Cam)){
	var tCamX = obj_Cam.x-obj_Cam.width/2;
	var tCamY = obj_Cam.y-obj_Cam.height/2;
	var _x = ((global.player.x - tCamX)/(obj_Cam.width/100))/100;
	var _y = ((global.player.y - tCamY)/(obj_Cam.height/100))/100;
	xx = _x;
	yy = _y;
	var tCamX = obj_Cam.x;
	var tCamY = obj_Cam.y;
	var _x = ((global.player.x - tCamX)/(obj_Cam.width/100))/100;
	var _y = ((global.player.y - tCamY)/(obj_Cam.height/100))/100;
	actrad += (abs(_y)+abs(_x));
	
}else{
	xx = 0.5;
	yy = 0.5;
}


if(tTime >= pi/2 && warping){
	if(instance_exists(door)){
		with(Wax){
			setState(states.OnGround,groundStates.Regular);
			warp(other.door);
		}
		warping = 0;
	}
}

display_set_gui_size(GAME_WIDTH,GAME_HEIGHT);
surface_set_target(sfc);
shader_set(sh_vignette);
shader_set_uniform_f(st,GAME_WIDTH,GAME_HEIGHT);
shader_set_uniform_f(u_time,tTime);
shader_set_uniform_f(rad,actrad);
shader_set_uniform_f(u_center,xx,yy);
draw_rectangle(0,0,GAME_WIDTH,GAME_HEIGHT,0);
shader_reset();
surface_reset_target();

draw_surface(sfc,0,0);

surface_set_target(sfc);
draw_clear_alpha(0,0);
surface_reset_target();

tTime = approach(tTime, pi, pi*ammount);
if(tTime == pi) instance_destroy();