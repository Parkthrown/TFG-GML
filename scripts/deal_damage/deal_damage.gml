///@argument0 target
///@argument1 damage
var target = argument0;
var damage = argument1;

with(target){
	if(!alarm[2] && HP>0){
		if(!inmune) HP -= damage;
		event_user(events.hit);
		return !inmune;
	}
}

return 0;