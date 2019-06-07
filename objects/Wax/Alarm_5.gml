/// @description Trail
// You can write your code in this editor
switch(state){
	#region default
	default:
		trail_trim();
	break;
	#endregion
	#region ground
	case states.OnGround:
		switch(subState){
			#region default
			default:
				trail_trim();
			break;
			#endregion
			#region waveDash
			case groundStates.WaveDash:
				trail_extend();
			break;
			case groundStates.DashSlash:
				trail_extend();
			break;
			#endregion
		}
	break;
	#endregion
	#region airBorne
	case states.Airborne:
		switch(subState){
			#region default
				default:
					trail_trim();
				break;
			#endregion
			#region waveJump
				case airStates.WaveJump:
					trail_extend();
				break;
			#endregion
		}
		break;
	#endregion
}
