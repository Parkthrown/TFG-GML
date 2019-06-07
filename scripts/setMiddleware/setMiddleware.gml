with(argument0){
	if(middleware && middleware != argument1){
		setMiddleware(middleware,argument1);
	}else{
		middleware = argument1;
		argument1.actor = id;
	}
}