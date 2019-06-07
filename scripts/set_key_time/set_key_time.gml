///@param time

key_previous = min(floor(argument0 * number_of_key_times), number_of_key_times -1);
key_next = (key_previous + 1) % number_of_key_times;
	
var lerp_amt = (argument0 - key_previous/number_of_key_times) * number_of_key_times;
	
color_mix = vector_lerp(color[key_previous],color[key_next],lerp_amt);			
con_sat_brt_mix = vector_lerp(con_sat_brt[key_previous],con_sat_brt[key_next],lerp_amt);

alpha = clamp(cos((2 * argument0) * 3.14) * 1.6 - 0.1, 0, 1);
	