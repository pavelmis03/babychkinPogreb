/// @description руль вправо

if (scr_arr_fingEl([1, 3], buh_status, 1) != -1) {	//если заведена или едет
	if (obj_ctrl_set.ctrl_set_map_curr[?"buhankaMvJL"]) {	//если управление через l/j
		buh_rotAngle = clamp(buh_rotAngle - 540 / room_speed, -540, buh_rotAngle);
	}
}