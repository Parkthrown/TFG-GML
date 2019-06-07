/// @description Insert description here
// You can write your code in this editor
if(global.transition || global.paused)exit;
event_inherited();
sprite_index = regSprite;
if(thrown != 0){
	if(attack_instance(obj_enemy,0,0,4,0,45)){
		hsp= -(hsp/5);
		vsp = -1;
	}
}else{
}
if((hsp <= 1 && hsp >= -1)&&(vsp <= 1 && hsp >=-1)){
	thrown = 0;
}
if (boil != 0){
	damage= 0;
	sprite_index = cookSprite;
}