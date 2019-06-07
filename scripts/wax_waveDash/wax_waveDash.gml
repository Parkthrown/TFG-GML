///@argument direction

sprite_index = WaxWaveDash;
image_index = 0;

setState(state,groundStates.WaveDash);
animation = 0;

hsp = ((image_xscale == argument0) ? maxSpeed * 1.75: maxSpeed * 1.75)*argument0;

alarm_set(7,1);
alarm_set(5,1);