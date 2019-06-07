/// @description alignment and bugged grabbables
// You can write your code in this editor
#region inputs
if(global.IO[0] == id){
	var movement_horizontal = global.input_movementHorizontal;
}else {
	var movement_horizontal = 0;
}
#endregion
#region Holding
if(!instance_exists(holding)){
	holding = noone;
}else with(holding){
	x = other.x;
	y = other.y - 4 - BBOX_BOTTOM_DISTANCE;
}
#endregion