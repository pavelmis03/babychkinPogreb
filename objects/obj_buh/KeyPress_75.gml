/// @description пнуть буханку, если не заводится

if (can_interact == 3) {	//если персонаж стоит перед капотом, можно пнуть 
	buh_startTurn = 0;
	buh_status = 0;
	scr_snd_requestPlaySnd(snd_buh_kick, snd_buh_kick, 20, true);	//
	obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaKick";	
}
