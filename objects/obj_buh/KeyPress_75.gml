/// @description пнуть буханку, если не заводится

if (can_interact == 3) {	//если персонаж стоит перед капотом, можно пнуть 
							//пинать можно всегда
	scr_snd_requestPlaySnd(snd_buh_kick, snd_buh_kick, 20, true);	//
	if (buh_startTurn == 3) {
		if (obj_ctrl_gm_buh.buh_broke != 2) {	
			//но подсказку выводим только если реально заглохли и не сломались
			obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaKick";				
		} else {	//если сломались
			obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaBrokeKick";
		} 
	} else {
		obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaKickNotNeed";	
	}
	buh_startTurn = 0;
	buh_status = 0;
}
