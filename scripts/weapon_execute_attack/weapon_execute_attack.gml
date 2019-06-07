if(argument1 != attackState.None){
	var attacks = argument0[?weaponData.attacks];
	return script_execute(attacks[argument1]);
}

return FAILURE_CODE;