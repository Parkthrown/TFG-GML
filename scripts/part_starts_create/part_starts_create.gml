///@argument0 number
//starball particle emitter
var starEmitter = part_emitter_create(global.part_system_front);
part_emitter_region(global.part_system_front,starEmitter,x-sprite_width/1.5,x+sprite_width/1.5,y-sprite_height/1.5,y+sprite_height/1.5,ps_shape_ellipse,ps_distr_gaussian);
part_emitter_burst(global.part_system_front,starEmitter,obj_partManager.partStar,argument0);
part_emitter_destroy(global.part_system_front,starEmitter);