/// @description 

// Inherit the parent event
event_inherited();

//если наша кнопка выбрана, то назначаем ей фокус, пока она в фокусе, она нажата
if (obj_ctrl_rmLdGm.btn_loaderId[obj_ctrl_rmLdGm.btn_loaderNum] == id) {
	//если кнопке назначили фокус, нажимаем ее 
	if (!btn_focus) {
		//запускаем спрайт нажатия кнопки
		var str = sprite_get_name(sprite_index);
		var str1 = string_copy(str, 0, string_length(str) - 1); 
		sprite_index = asset_get_index(str1 + "2");
		image_index = 0;
		//включаем скорость проигрывания 
		image_speed = 1;
	}
	btn_focus = true;
} else {
	//если мы снимаем фокус, то надо выключить нажатие
	if (btn_focus) {
		//если кнопка нажалась и проиграла спрайт, возвращаем последнюю картинку спрайта наведения
		var str = sprite_get_name(sprite_index);
		var str1 = string_copy(str, 0, string_length(str) - 1); 
		sprite_index = asset_get_index(str1 + "1");
		btn_pressed = false; 
	} 
	btn_focus = false;
}