/// @description проверка нажатия на кнопка

//при диалоге остальные кнопки не активны. если кнопка еще не была нажата (зачем дважды-то)
if ((!obj_ctrl_dlg.ctrl_dlg_exist or type == "dlg_btn") and (!btn_pressed)) {
	//если кнопка нажата, запускаем спрайт нажатия кнопки
	var str = sprite_get_name(sprite_index);
	var str1 = string_copy(str, 0, string_length(str) - 1); 
	sprite_index = asset_get_index(str1 + "2");
	image_index = 0;
	//включаем скорость проигрывания 
	image_speed = 1;
	//image_speed = sprite_get_speed(sprite_index);
	//воспроизводим звук клика
	obj_ctrl_snd.action = "playSnd";
	array_push(obj_ctrl_snd.sound, sound[0], sound[2]);
	btn_pressed = true;
}
