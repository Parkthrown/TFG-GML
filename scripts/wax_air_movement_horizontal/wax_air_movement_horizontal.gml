///@argument direction

if(argument0 != 0){
	var rate = (argument0 == image_xscale) ? 0.02: 0.01;
	hsp = (alarm[2]) ? 
	lerp(hsp,(maxSpeed * argument0)/2, rate):
	lerp(hsp,(maxSpeed * argument0), rate*2);
}else{
	hsp = (alarm[2] > 0) ?
	lerp(hsp,0,0.025):
	lerp(hsp,0,0.05);
}