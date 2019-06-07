/// @description Insert description here
// You can write your code in this editor
width = GAME_WIDTH;
height = GAME_HEIGHT;
bWidth = GAME_WIDTH;
bHeight = GAME_HEIGHT;

lock_x = 0;
lock_y = 0;
sway = 0;

vec = [0,0];
state = 0;
dist = floor(height * 0.135);
spd = 10;
hsp = 0;
vsp = 0;
ratio = width/16;

xReal = 0;
yReal = 0;

follow = 0;

if(instance_exists(global.player)){
	follow = global.player;
}

camera = camera_create();
camera_set_view_size(camera,width,height);
camera_set_view_pos(camera,x-width/2,(y-height/2)-dist);

view_camera[0] = camera;
view_visible[0] = 1;
view_enabled = 1;