var trigger = instance_place(x,y,obj_interactable)
if(instance_exists(trigger)){
	with(trigger){
		if(variable_instance_exists(trigger,"type")){
			if(type == other.flameType){
			perform = (activated == 0) ? 1: 0;
			activated = 1;
			return true;
			}
		}
	}
}
return false;
