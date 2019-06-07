/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

	var cicle_speed_final = cicle_speed + random_range(-cicle_wobble,cicle_wobble);
	var distance_final = distance + random_range(-distance_wobble,distance_wobble);

	var dir = [
		target.x + cos((TIMER+cicle_offset)*cicle_speed_final)*distance_final,
		target.y + sin((TIMER+cicle_offset)*cicle_speed_final)*distance_final
	];

	var speeds = get_speed_from_vector(dir,7);
	hsp = lerp(hsp,speeds[0],approach_speed);
	vsp = lerp(vsp,speeds[1],approach_speed);
	x += hsp;
	y += vsp;
	