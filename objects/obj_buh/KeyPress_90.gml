/// @description ручник

if (buh_playerIn) {	//если игрок внутри
	if ((buh_status != 3) and (speed == 0)) { //если не едем
		buh_handbrake = !buh_handbrake;
		//воспроизводим звук
		obj_ctrl_snd.action = "playSnd";
		array_push(obj_ctrl_snd.sound, 20, "snd_buh_handbrake");
	} else {
		obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaHandbreakSpd";	
		//ИЗНОС
	}
}