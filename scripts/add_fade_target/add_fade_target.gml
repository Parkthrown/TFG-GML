///@descripton adds a key time (like key frames) to the day and night cycle
///@param R
///@param G
///@param B
///@param con
///@param sat
///@param brt
///@param pop_strength
///@param pop_threshold

for(var i = 0; i < 3; i++){
	color_target[i] = argument[i]/255;
}

for(var i = 3; i < 8; i++){
	con_sat_brt_target[i-3] = argument[i];
}
