/// @description пнуть буханку, если не заводится

if (can_interact == 3) {	//если персонаж стоит перед капотом, можно пнуть 
	buh_startTurn = 0;
	buh_status = 0;
	//воспроизводим звук
	obj_ctrl_snd.action = "playSnd";
	array_push(obj_ctrl_snd.sound, 20, "snd_buh_kick");
	obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaKick";	
}
