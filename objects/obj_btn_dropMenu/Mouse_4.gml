/// @description проверка нажатия на кнопка

//при диалоге остальные кнопки не активны
if (!obj_ctrl_dlg.ctrl_dlg_exist) {
	//если кнопка нажата, запускаем спрайт нажатия кнопки
	var str = sprite_get_name(sprite_index);
	var str1 = string_copy(str, 0, string_length(str) - 1); 
	sprite_index = asset_get_index(str1 + "2");
	image_index = 0;
	//включаем скорость проигрывания 
	image_speed = sprite_get_speed(sprite_index);
	//воспроизводим звук клика
	obj_ctrl_snd.action = "playSnd";
	array_push(obj_ctrl_snd.sound, sound[0], sound[2]);
	//эту кнопку можно включить и выключить вторым щелчком
	btn_pressed = !btn_pressed;
	//если кнопка была выключена, меняем спрайт на наеведенный 
	if (!btn_pressed) {
		var str = sprite_get_name(sprite_index);
		var str1 = string_copy(str, 0, string_length(str) - 1); 
		sprite_index = asset_get_index(str1 + "1");
		image_index = image_number - 0.1;
	}
}