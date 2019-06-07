///@arg data
///@arg equivalences...
var eq = false;
for(var i = 1; i < argument_count; i++){
	eq = eq || (argument[0] == argument[i]);
	if(eq) return eq;
}
return eq;