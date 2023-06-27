/// @description проверка нажатия на кнопка

//при диалоге остальные кнопки не активны
if (!obj_ctrl_dlg.ctrl_dlg_exist) {
	scr_snd_requestPlaySnd(asset_get_index(sound[2]), asset_get_index(sound[2]), sound[0], true);	//звук клика
	//кнопка булевая: два значения 
	btn_pressed = !btn_pressed;
	event_user(15);
}