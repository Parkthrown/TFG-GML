/// @description Insert description here
// You can write your code in this editor
//draw_sprite(spr_blast,current_time,x,y);
draw_self();
if(current_time%2){
	draw_sprite(spr_falling_effect,TIMER*16,x,y);
}
//part_starts_create(5);