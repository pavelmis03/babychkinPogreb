/// @description 

var x1 = x + sprite_get_bbox_left(sprite_index);
var x2 = x + sprite_get_bbox_right(sprite_index);
var y1 = y + sprite_get_bbox_top(sprite_index);
var y2 = y + sprite_get_bbox_bottom(sprite_index);

//проверка на наведении курсора на кнопку
//при диалоге остальные кнопки не активны
if (!obj_ctrl_dlg.ctrl_dlg_exist) {
	if (point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2)) {
		//действия один раз выполняются (запустили спрайт)
		if (!btn_enter) {
			////воспроизводим звук наведения
			obj_ctrl_snd.action = "playSnd";
			array_push(obj_ctrl_snd.sound, sound[0], sound[1]);
			btn_enter = true;
		}
	} else {
		//снимаем наведение, если курсор ушел
		if (btn_enter) {
			btn_enter = false;
		}
	}
}
//перетаскивание
if (btn_pressed) {
	//правая граница перетаскивания
	if ((mouse_x <= btn_slider_right_x) and (mouse_x >= btn_slider_left_x)) {
		//вычитание нужно для красивого перетаскивания, чтобы курсор был посередине ползунка
		x = mouse_x - sprite_width / 2;
		val = x - btn_slider_left_x + sprite_width / 2;
		event_user(14);
	}
}
/*
if (action != "") {
	event_user(15);
	action = "";
}

















