/// @description Insert description here
// You can write your code in this editor
event_inherited();

x+=hsp;
y+=vsp;

if(collide_at(x+hsp,y+vsp)){
	instance_destroy();
}

if(HP <= 0){
	instance_destroy();
}

part_particles_create_color(global.part_system_front,x,y,obj_partManager.partBubble,
choose(make_color_rgb(235,211,32),make_color_rgb(138,138,0),make_color_rgb(255,255,255)),1);