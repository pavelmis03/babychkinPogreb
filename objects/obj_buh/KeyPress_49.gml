/// @description 1ая передача

//если нажато сцепление (оно не может быть нажато, если игрок не в машине и она не заведена)
if ((buh_coupling) and (buh_transmission != 1)) {
	//если включить передачу, когда едем задом или стоим на ручнике
	if (((buh_transmission == 5) and (speed != 0)) or (buh_handbrake)) {
		scr_buh_stallAction(false);	//заглушение движка
		obj_ctrl_gm_buh.hp -= 5000 * 0.03; //мгновенный разовый износ 3%
	} else {
		scr_snd_requestPlaySnd(snd_buh_transmissionChange, snd_buh_transmissionChange, 20, true);	//звук включения передачи
		/*if (speed == 0) {	//если мы до этого стояли
			speed = 4.5 / 3.6;	//на первой передаче мы едем на холостых
		}*/
	}
	buh_transmission = 1;
}