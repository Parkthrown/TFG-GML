/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hsp = 0;
vsp = 0;

target = Wax;

spd = 10;

size = 10;

ammount = 1;

part_type = obj_partManager.partDust;

part_system = global.part_system_front;

part_emitter = part_emitter_create(part_system);
flares_origin = 0;
distance = 0;
_approach = 0;

flares = ds_list_create();