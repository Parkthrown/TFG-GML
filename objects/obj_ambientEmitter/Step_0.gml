/// @description Insert description here
// You can write your code in this editor
switch(type){
	case ambientTypes.top:
		if(instance_exists(obj_Cam)){
			part_emitter_region(
				system,emitter,
				obj_Cam.x-obj_Cam.width,
				obj_Cam.x+obj_Cam.width,
				obj_Cam.y-obj_Cam.height*2,
				obj_Cam.y-obj_Cam.height/2,
				ps_shape_rectangle,ps_distr_linear
			);
		}
	break;
	case ambientTypes.bottom:
		if(instance_exists(obj_Cam)){
			part_emitter_region(
				system,emitter,
				obj_Cam.x-obj_Cam.width,
				obj_Cam.x+obj_Cam.width,
				obj_Cam.y+obj_Cam.height/2,
				obj_Cam.y+obj_Cam.height*2,
				ps_shape_rectangle,ps_distr_linear,
			);
		}
	break;
	case ambientTypes.screen:
		if(instance_exists(obj_Cam)){
			part_emitter_region(
				system,emitter,
				obj_Cam.x-obj_Cam.width,
				obj_Cam.x+obj_Cam.width,
				obj_Cam.y-obj_Cam.height,
				obj_Cam.y+obj_Cam.height,
				ps_shape_rectangle,ps_distr_linear,
			);
		}
	break;
}