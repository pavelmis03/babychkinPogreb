/// @description ручник

if (buh_playerIn) {	//если игрок внутри
	if (speed == 0) { //если не едем
		buh_handbrake = !buh_handbrake;
		scr_snd_requestPlaySnd(snd_buh_handbrake, snd_buh_handbrake, 20, true);	//звук 
	} else {
		obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaHandbrakeSpd";	
		scr_snd_requestPlaySnd(snd_buh_handbrakeSpd, snd_buh_handbrakeSpd, 20, true);	//звук 
		obj_ctrl_gm_buh.hp -= 5000 * 0.015; //мгновенный разовый износ 1.5%
	}
}