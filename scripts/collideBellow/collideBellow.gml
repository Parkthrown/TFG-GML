
var list = ds_list_create();
instance_place_list(argument0,argument1,argument2,list,0);
var ss = noone;
var yy = INTEGER_MAX_VALUE;
for(var i = 0; i<ds_list_size(list);i++){
	var actual = list[|i];
	if(actual.y < yy && actual.bbox_top>y){
		ss = actual;
		yy = actual.y;
	}
}
ds_list_destroy(list);
list = undefined;
return ss;