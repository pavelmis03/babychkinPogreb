/// @description тормоз
if (scr_arr_fingEl([1, 3], buh_status, 1) != -1) {	//если заведена или едет
	speed -= CONST_BUH_DEBOOST / room_speed;
	speed = clamp(speed, 0, 120);
}