/// @description Insert description here
// You can write your code in this editor

if(color == make_color_rgb(178,16,48)){
	
	color = c_white;
	
}else{
	
	color = make_color_rgb(178,16,48);
	
}
if(time<=5){ 
	v_shake = choose(1,-1);
}
alarm_set(0,abs(time*2));