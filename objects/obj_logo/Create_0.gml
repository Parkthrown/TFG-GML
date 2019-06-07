/// @description Insert description here
// You can write your code in this editor
event_inherited();
flameType = irandom((current_second)%5)+1;
part_system = obj_partManager.emberSystems[|flameType]
part_emitter = part_emitter_create(part_system);
part_emitter_region(part_system,part_emitter,x-12,x+12,y-12,y+8,ps_shape_ellipse,ps_distr_gaussian);
part_emitter_stream(part_system,part_emitter,obj_partManager.flamePart,2);