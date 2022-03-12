/// @description проверка нажатия на кнопка

//при диалоге остальные кнопки не активны
if (!obj_ctrl_dlg.ctrl_dlg_exist) {
	//если кнопка нажата, меняем спрайт на нажатый (там всего две картинки)
	image_index = !image_index;
	////воспроизводим звук клика
	obj_ctrl_snd.action = "playSnd";
	array_push(obj_ctrl_snd.sound, sound[0], sound[2]);
	//кнопка булевая: два значения 
	btn_pressed = !btn_pressed;
	event_user(15);
}