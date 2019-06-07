if(time >0){
	
	if(coins >0){
		draw_set_color(c_black);
		draw_text(x-5+v_shake,y-25-v_shake,time);
		draw_set_color(color);
		draw_text(x-4-v_shake,y-24+v_shake,time);
	}
draw_self();

}