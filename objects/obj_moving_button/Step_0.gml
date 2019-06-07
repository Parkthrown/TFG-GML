/// @description Insert description here
// You can write your code in this editor
if(global.transition || global.paused)exit;
image_alpha = 1;
if (type == 1 || type == 3){
	collideH();
	switch(sign(hsp)){
		case(1):
			with(obj_collisionable){
				var bellow = bbox_bottom>other.bbox_top;
				if(collision_rectangle(other.x,other.y-1,(other.x+other.sprite_width*other.image_xscale),other.y,id,1,0) && !bellow){
					if(!collide_at(x+other.hsp+hsp,y) && !place_meeting_tiles(x,y+1,CMAP) && !bellow){
						x+=other.hsp;
					}
				}else if(bellow){
					if(collision_rectangle(other.x,other.y,(other.x+other.sprite_width*other.image_xscale)+other.hsp,other.y+other.sprite_height,id,1,0)){
						x+=other.hsp;
						//hsp = 0;
					}
				}
			}
		break;
		case(-1):
			with(obj_collisionable){
				var bellow = bbox_bottom>other.bbox_top;
				if(collision_rectangle(other.x-1+other.hsp,other.y-1,(other.x+other.sprite_width*other.image_xscale)-1,other.y,id,1,0) && !bellow){
					if(!collide_at(x+other.hsp+hsp,y) && !place_meeting_tiles(x,y+1,CMAP)  && !bellow ){
					x+=other.hsp;
					}
				}else if(bellow){
					if(collision_rectangle(other.x-1+other.hsp,other.y,(other.x+other.sprite_width*other.image_xscale)-1,other.y+other.sprite_height,id,1,0)){
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
	collideV();
	switch(sign(vsp)){
		case(1):
			with(obj_collisionable){
				if(!(object_index == Wax && HP <= 0))
				if(collision_rectangle(other.x,other.y-abs(other.vsp),other.x+other.sprite_width*other.image_xscale,other.y+other.sprite_height+other.vsp,id,1,0)){
					if(y>other.y) vsp += other.vsp;
					y+=other.vsp;
				}
			}
		break;
		case(-1):
			with(obj_collisionable){
				if(!(object_index == Wax && HP <= 0))
				if(collision_rectangle(other.x,other.y-abs(other.vsp),other.x+other.sprite_width*other.image_xscale,other.y,id,1,0)){
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

if(open){
	vsp = (type == 2 || type == 3) ? realSp: 0;
	hsp = (type == 1 || type == 3) ? realSp: 0;
	realSp = -realSp;
	open = 0;
}