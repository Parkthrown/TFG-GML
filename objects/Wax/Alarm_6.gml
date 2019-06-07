/// @description Sleepy alarm
// You can write your code in this editor
if(checkState(states.OnGround,groundStates.Regular) && hsp == 0){
	state = states.Sleepy
	sprite_index = WaxSit;
	image_index = 0;
	with(holding){
		grabber = 0;
	}
	holding = noone;
}

if(state == states.Sleepy && sprite_index == WaxSitIdle){
	sprite_index = WaxWaffle;
	image_index = 0;
}