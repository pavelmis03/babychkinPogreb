/// @description руль влево

if (scr_arr_fingEl([1, 3], buh_status, 1) != -1) {	//если заведена или едет
	if (!obj_ctrl_set.ctrl_set_map_curr[?"buhankaMvJL"]) {	//если управление через стрелки
		buh_rotAngle = clamp(buh_rotAngle + 540 / room_speed, buh_rotAngle, 540);
	}
}