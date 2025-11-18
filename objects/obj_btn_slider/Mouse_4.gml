/// @description проверка нажатия на кнопка

// при диалоге остальные кнопки не активны
if (!obj_ctrl_dlg.ctrl_dlg_exist) {
	
	// воспроизводим звук клика
	scr_snd_requestPlaySnd(sound[0], sound[2], sound[2], true);	// звук 
	// obj_ctrl_snd.action = "playSnd";
	// array_push(obj_ctrl_snd.sound, sound[0], sound[2]);
	btn_pressed = true;
}