/// @description задний ход

//если нажато сцепление (оно не может быть нажато, если игрок не в машине и она не заведена)
if ((buh_coupling) and (buh_transmission != 5)) {
	if (speed <= 0) {	//если не едем вперед (меньше нуля может быть, если мы разогнались задом, потом включили N, потом снова R)
		if (buh_handbrake) {	//если мы стояли на ручнике, когда включили заднюю
			scr_buh_stallAction(false);	//заглушение движка
			obj_ctrl_gm_buh.hp -= 5000 * 0.03; //мгновенный разовый износ 3%
		} else {
			scr_snd_requestPlaySnd(snd_buh_transmissionChange, snd_buh_transmissionChange, 20, true);	//звук 
			if (speed == 0) {	//если мы до этого стояли
				speed = -4.5 / 3.6;	//едем на холостых
			}	
		}
		buh_transmission = 5;	//включаем задний ход
	} else {	//если попытаться включить заднюю, когда едем вперед
		obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaRSpd";
		scr_snd_requestPlaySnd(snd_buh_RSpd, snd_buh_RSpd, 20, true);	//звук хрустящей коробки
		obj_ctrl_gm_buh.hp -= 5000 * 0.02; //мгновенный разовый износ 2%
	}
}