alarm_set(0,15);
var sz = ds_list_size(prev);
if(sz>=1){
	actual = prev[|sz-1];
	ds_list_pop(prev);
	selected = 0;
}else{
	return 0;
}
