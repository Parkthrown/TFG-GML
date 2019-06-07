
///@argument0 ammount
///@argument1 color
///@argument2 x1
///@argument3 y1
///@argument4 x2
///@argument5 y2


var fireEmitter = part_emitter_create(obj_partManager.emberSystems[|argument1%6]);
part_emitter_region(obj_partManager.emberSystems[|argument1%6],fireEmitter,argument2,argument4,argument3,argument5,ps_shape_rectangle,ps_distr_gaussian);
part_emitter_burst(obj_partManager.emberSystems[|argument1%6],fireEmitter,obj_partManager.flamePart,argument0);
part_emitter_destroy(obj_partManager.emberSystems[|argument1%6],fireEmitter);