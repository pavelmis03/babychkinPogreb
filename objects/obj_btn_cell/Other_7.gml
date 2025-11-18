/// @description 

/*
// если кнопка была нажата, совершаем действие
if (btn_pressed) {
	event_user(15);
	// если кнопка нажалась и проиграла спрайт, возвращаем последнюю картинку спрайта наведения
	var str = sprite_get_name(sprite_index);
	var str1 = string_copy(str, 0, string_length(str) - 1); 
	sprite_index = asset_get_index(str1 + "1");
	btn_pressed = false; 
}
