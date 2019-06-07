/// @description generate colors
// You can write your code in this editor

// get key times:
enum mixData{
	con,
	sat,
	brt,
	popS,
	popT,
}

switch(state){
	
	case ambientState.cycle:
	
		key_previous = min(floor(global.time * number_of_key_times), number_of_key_times -1);
		key_next = (key_previous + 1) % number_of_key_times;
	
		var lerp_amt = stretch((global.time - key_previous/number_of_key_times) * number_of_key_times,1/stretchs_per_key_time);
	
		color_mix = vector_lerp(color[key_previous],color[key_next],lerp_amt);			
		con_sat_brt_mix = vector_lerp(con_sat_brt[key_previous],con_sat_brt[key_next],lerp_amt);

		alpha = clamp(cos((2 * global.time) * pi) * pi/2 - 0.1, 0, 1);
	
	break;
	
	case ambientState.prebaked:
		if(ambientCallBack){
				script_execute(ambientCallBack,callbackData);
			}
	break;
	
	case ambientState.fading:
		color_mix = vector_lerp(color_mix,color_target,fade_speed);			
		con_sat_brt_mix = vector_lerp(con_sat_brt_mix,con_sat_brt_target,fade_speed);
		if(vector_all(vector_equals(color_mix,color_target)) && vector_all(vector_equals(con_sat_brt_mix,con_sat_brt_target))){
			if(ambientCallBack) script_execute(ambientCallBack,callbackData);
			else state = ambientState.prebaked;
		}

	break;
}

global.brightness = con_sat_brt_mix[mixData.brt];