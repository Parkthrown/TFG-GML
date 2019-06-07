/// @description Insert description here
// You can write your code in this editor
part_system = obj_partManager.emberSystems[|flameType%6];
part_particles_create(part_system,x,y-34,obj_partManager.flamePartSpeed,45);
part_particles_create(part_system,x,y-34,obj_partManager.partBlast,1);
part_emitter = part_emitter_create(part_system);
alarm_set(0,10);