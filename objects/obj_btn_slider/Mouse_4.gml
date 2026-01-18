/// @description проверка нажатия на кнопка

// при диалоге остальные кнопки не активны
if (!obj_ctrl_dlg.ctrl_dlg_exist) {
	
	// воспроизводим звук клика
	scr_snd_requestPlaySnd(sound[0], sound[2], sound[2], true);	// звук 
	
	btn_pressed = true;
}