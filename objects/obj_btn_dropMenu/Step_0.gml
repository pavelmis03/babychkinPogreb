/// @description 

/*
var x1 = x + sprite_get_bbox_left(sprite_index);
var x2 = x + sprite_get_bbox_right(sprite_index);
var y1 = y + sprite_get_bbox_top(sprite_index);
var y2 = y + sprite_get_bbox_bottom(sprite_index);
*/
var x1 = bbox_left;
var x2 = bbox_right;
var y1 = bbox_top;
var y2 = bbox_bottom;

//проверка на наведении курсора на кнопку
//при диалоге остальные кнопки не активны
if (!obj_ctrl_dlg.ctrl_dlg_exist) {
	if (point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2)) {
		//действия один раз выполняются (запустили спрайт)
		if (!btn_enter) {
			image_index = 0;
			//проигрываем изображение наведения
			//image_speed = sprite_get_speed(sprite_index);
			image_speed = 1;
			//воспроизводим звук наведения
			obj_ctrl_snd.action = "playSnd";
			array_push(obj_ctrl_snd.sound, sound[0], sound[1]);
			btn_enter = true;
		}
	} else {
		//если открыты подэлементы, то не надо возвращать спрайт в начало, короче, ничего не надо делать
		if (ds_list_size(btn_list_dropEl) == 0) {
			//запустили обратный спрайт
			if (btn_enter) {
				//если кнопка после нажатия, надо вернуть ей первый из двух спрайтов 
				if (btn_pressed) {
					var str = sprite_get_name(sprite_index);
					var str1 = string_copy(str, 0, string_length(str) - 1); 
					sprite_index = asset_get_index(str1 + "1");
				}
				image_speed = -1;
				btn_enter = false;
				btn_pressed = false;
			}
		}
	}
}
