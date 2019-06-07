//@argument0 xmin
//@argument1 xmax
//@argument2 ymin
//@argument3 ymax
//@argument4 ammount
//@argument5 color


var xx = argument0;
var xx2 = argument1;
var yy = argument2;
var yy2 = argument3;
//Fireball particle emitter
var fireEmitter = part_emitter_create(obj_partManager.emberSystems[|argument5]);
part_emitter_region(obj_partManager.emberSystems[|argument5],fireEmitter,xx,xx2,yy,yy2,ps_shape_ellipse,ps_distr_gaussian);
part_emitter_burst(obj_partManager.emberSystems[|argument5],fireEmitter,obj_partManager.coloredEmbers[|argument5],argument4);
part_emitter_destroy(obj_partManager.emberSystems[|argument5],fireEmitter);