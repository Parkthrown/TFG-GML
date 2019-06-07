/// @description Insert description here
// You can write your code in this editor
var shake = choose(-_shake,_shake);
with(target){
	if(other.type & 0x1) x+=shake;
	if(other.type & 0x2) y+=shake;
}
_shake *= 1-(1/time);