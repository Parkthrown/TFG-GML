/// @description Shooting
// You can write your code in this editor
if(shots <5){
	shots++;
	cdMult/=1.2;
	if(shots == 5) cdMult = 50;
	alarm_set(0,cdMult);
}