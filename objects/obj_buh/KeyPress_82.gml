/// @description задний ход

//если нажато сцепление (оно не может быть нажато, если игрок не в машине и она не заведена)
if (buh_coupling) {
	if ((buh_status != 3) and (speed == 0)) { //если не едем
		buh_transmission = 5;	//включаем задний ход
		//воспроизводим звук
		obj_ctrl_snd.action = "playSnd";
		array_push(obj_ctrl_snd.sound, 20, "snd_buh_transmissionChange");
	} else {
		obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaRSpd";	
		//ИЗНОС
	}
}