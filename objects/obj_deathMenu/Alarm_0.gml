/// @description Insert description here
// You can write your code in this editor
if(global.checkPointData) checkPoint_load(global.checkPointData);

with(global.player){
	
	persistent = 1;
	
	HP = MAXHP;
		
	hsp = 0;
	vsp = 0;
	state = states.Cutscene;
	
}

with(instance_create_depth(x,y,0,obj_transition)){
	
	tTime = pi/2;
	ammount = 0.0035;
	warping = 0;
	
}

u_Time = TIMER*mult;
alarm_set(1,((duration)/mult)/2.05);