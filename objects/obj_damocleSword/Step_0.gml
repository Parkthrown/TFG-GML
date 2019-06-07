/// @description Insert description here
// You can write your code in this editor
if(last != current_second){
	last = current_second;
	time--;
}

x = lerp(x,target.x,0.25);
y = lerp(y,target.y-16-time,0.1);
if(time <= 10 && alarm[0] <= 0) alarm_set(0,10);
if(time<=0 && coins >0){ 
	target.HP = 0;
}

if(coins <= 0){
	with(obj_redScore){
		instance_destroy();
	}
	if(alarm[2] <=0)alarm_set(2,125);
	part_type_speed(obj_partManager.partStar,2,3,-0.075,0);
	part_type_life(obj_partManager.partStar,25,35);
	part_particles_create_color(global.part_system_front,x,y,obj_partManager.partStar,choose(
	make_color_rgb(178,16,48),
	make_color_rgb(154,32,121),
	c_black),
	24);
	part_type_life(obj_partManager.partStar,16,24);
	part_type_speed(obj_partManager.partStar,0.75,0.75,-0.01,0);
	if(alarm[2] < 80 && alarm[2]%4 == 0){
		var rnd = random_range(-16,16);
		part_particles_create(global.part_system_front,x+rnd,y-rnd,obj_partManager.partSmokeBlast,1);
	}
	shaker(1,25,obj_Cam);
}