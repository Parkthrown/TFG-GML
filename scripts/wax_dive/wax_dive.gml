///@argument direction
///@argument hsp
///@argument vsp
///@argument iframes

if(holding) wax_drop();

sprite_index = WaxDash;
image_index = 0;
image_xscale = (argument0 != 0) ? argument0: image_xscale;


alarm_set(waxAlarms.iframes,(alarm[2] <= 0) ? argument3: (alarm[2]/2));
alarm_set(waxAlarms.dives,75);

wax_part_dash(image_xscale);
part_starts_create(3);

audio_play_sound(snd_dash,1,0);

hsp = argument1*image_xscale;
vsp = argument2;

animation = 1;	
diveCount++;

setState(states.Airborne,airStates.Dive);

fsm_execute_state(fsm_map,ev_step,states.Airborne);