/// @description Insert description here
// You can write your code in this editor

if(hsp!= 0) image_xscale = sign(hsp);
if(vsp!= 0) image_yscale = -sign(vsp);
if(round(hsp) == 0) sprite_index = spr_thorn;
if(round(vsp) == 0) sprite_index = spr_thorn_sideways;

collideH();
x+=hsp;
collideV();
y+=vsp;

if(HP <= 0){
	instance_destroy();
}

part_particles_create_color(global.part_system_front,x,y,obj_partManager.partBubble,
choose(make_color_rgb(178,16,40),make_color_rgb(219,65,97),make_color_rgb(0,0,0)),1);