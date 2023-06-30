/// @description сцепление

buh_coupling = false;

if (buh_status != 2) {
	if (((buh_transmission == 1) or (buh_transmission == 5)) and (speed == 0)) {
		var t = clamp(buh_transmission - 2, -1, 1);	//в зависимости от передачи едем вперед или назад
		if (speed == 0) {	//если мы до этого стояли
			speed = -4.5 / 3.6 * t;	//на первой передаче мы едем на холостых
		}	
	}
}