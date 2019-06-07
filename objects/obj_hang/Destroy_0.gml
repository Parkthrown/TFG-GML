/// @description Insert description here
// You can write your code in this editor
ParticleSpawner_Localized(x+8,y+8,Tile_break_exp,0,0,0,0);

var part_system = obj_partManager.emberSystems[|1];
part_particles_create(part_system,CENTERX,CENTERY,obj_partManager.flamePartSpeed,15);
part_lights_tinted_area(obj_partManager.partLight16px,25,color,bbox_left,bbox_top,bbox_right,bbox_bottom);
for(var i = 0; i<random_range(1,3); i++){
	instance_create_depth(CENTERX,CENTERY,depth,obj_debris);
}