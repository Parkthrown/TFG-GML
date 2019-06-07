/// @description Insert description here
// You can write your code in this editor
var coloring = (instance_exists(Wax)) ? Wax.flameType: 0;
part_particles_create(obj_partManager.emberSystems[|coloring],CENTERX,CENTERY,obj_partManager.flamePartSpeed,1);
alarm_set(0,10)