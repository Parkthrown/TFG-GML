///@description Fireball
event_inherited();

image_xscale = abs(hsp) ? sign(hsp) : image_xscale;

collideH();
x += hsp;
 
var hbox = hitbox(bbox_left,bbox_top,bbox_right,bbox_bottom,TARGETEABLE);

for(var i = 0; i< ds_list_size(hbox); i++){
	var hit = hbox[|i];
	if( hit.id != creator && deal_damage(hit,damage)){
		with(hit){
			if(instance_exists(other)){
				knock_back_angle(other.hbox[|i],direction_x(other),45,other.knockback);
				alarm_set(2,other.iFrames);
			}
		}
		HP-=self_Damage;
		event_user(3);
		if(HP<=0){
			exit;
		}
	}
}

ds_list_destroy(hbox);





