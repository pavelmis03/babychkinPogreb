/// @description показания буханки

if (instance_exists(obj_buh)) {//если буханка существует и заведена
	if (scr_arr_fingEl([1, 3], obj_buh.buh_status, 1) != -1) {	
		draw_buh_battery = draw_buh_battery + irandom_range(-1, 1);
		draw_buh_battery = clamp(draw_buh_battery, -2, 3);
		draw_buh_oil = 4 + random_range(-0.07, 0.07);
		draw_buh_oil = clamp(draw_buh_oil, 3.8, 4.2);
		draw_buh_temp = clamp(draw_buh_temp + 0.002, 0, 40);
	} else {
		draw_buh_battery = -12.4;	//аккмулятор
		draw_buh_oil = 0;		//масло
		draw_buh_temp = 0;		//температура	
	}
}

alarm[3] = random_range(0.05, 0.5) * room_speed;
