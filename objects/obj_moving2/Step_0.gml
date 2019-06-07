/// @description Insert description here
// You can write your code in this editor
if(global.transition || global.paused)exit;
image_alpha = 1;
if (type == 1 || type == 3){
	if (collide_at(x+hsp,y) || place_meeting_tiles(x+hsp,y,MBOUNDS)){
		hsp = -hsp;
	}
	switch(sign(hsp)){
		case(1):
			with(obj_collisionable){
				var bellow = bbox_bottom>other.bbox_top;
				if(collision_rectangle(other.bbox_left,other.bbox_top-1,other.bbox_right,other.bbox_top,id,1,0) && !bellow){
					if(!collide_at(x+other.hsp+hsp,y) && !place_meeting_tiles(x,y+1,CMAP) && !bellow){
						x+=other.hsp;
					}
				}else if(bellow){
					if(collision_rectangle(other.bbox_left,other.bbox_top-1,other.bbox_right+other.hsp,other.bbox_bottom,id,1,0)){
						x+=other.hsp;
						//hsp = 0;
					}
				}
			}
		break;
		case(-1):
			with(obj_collisionable){
				var bellow = bbox_bottom>other.bbox_top;
				if(collision_rectangle(other.bbox_left,other.bbox_top-1,other.bbox_right,other.bbox_top,id,1,0) && !bellow){
					if(!collide_at(x+other.hsp+hsp,y) && !place_meeting_tiles(x,y+1,CMAP)  && !bellow ){
					x+=other.hsp;
					}
				}else if(bellow){
					if(collision_rectangle(other.bbox_left+other.hsp,other.bbox_top-1,other.bbox_right+other.hsp,other.bbox_bottom,id,1,0)){
						x+=other.hsp;
						//hsp = 0;
					}
				}
			}
		break;
	}
	
	x+=hsp;
}
if (type == 2 || type == 3){
	if (collide_at(x,y+vsp) || place_meeting_tiles(x,y+vsp,MBOUNDS)){
		vsp = -vsp;
	}
	switch(sign(vsp)){
		case(1):
			with(obj_collisionable){
				if(!(object_index == Wax && HP <= 0))
				if(collision_rectangle(other.bbox_left,other.bbox_top-abs(other.vsp),other.bbox_right,other.bbox_bottom+other.vsp,id,1,0)){
					if(y>other.y) vsp += other.vsp;
					y+=other.vsp;
				}
			}
		break;
		case(-1):
			with(obj_collisionable){
				if(!(object_index == Wax && HP <= 0))
				if(collision_rectangle(other.bbox_left,other.bbox_top-abs(other.vsp),other.bbox_right,other.bbox_bottom,id,1,0)){
					if(place_meeting(x,y,other)){
						while(place_meeting(x,y,other)){
							y+=-1;
						}
					}
					y+=other.vsp;
				}
			}
}
	y+=vsp;
}