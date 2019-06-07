/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

radius_list(flares,5,flares_origin,distance);
for(var i = 0; i < ds_list_size(flares); i++){
	var arr = flares[|i];
	var px = x+arr[0];
	var py = y+arr[1];
	part_emitter_region(part_system,part_emitter,px,px+size,py,py+size,ps_shape_ellipse,ps_distr_gaussian);
	part_emitter_burst(part_system,part_emitter,part_type,ammount);
}
ds_list_clear(flares);

x+=hsp;
y+=vsp;
