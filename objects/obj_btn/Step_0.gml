/// @description 

var x1 = x + sprite_get_bbox_left(sprite_index);
var x2 = x + sprite_get_bbox_right(sprite_index);
var y1 = y + sprite_get_bbox_top(sprite_index);
var y2 = y + sprite_get_bbox_bottom(sprite_index);

//проверка на наведении курсора на кнопку
//при диалоге остальные кнопки не активны
if (!obj_ctrl_dlg.ctrl_dlg_exist or type == "dlg_btn") {
	if (point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2)) {
		//действия один раз выполняются (запустили спрайт)
		if (!btn_enter) {
			image_index = 0;
			//проигрываем изображение наведения
			image_speed = 1;
			//воспроизводим звук наведения
			obj_ctrl_snd.action = "playSnd";
			array_push(obj_ctrl_snd.sound, sound[0], sound[1]);
			btn_enter = true;
		}
	} else {
		//запустили обратный спрайт, если с кнопки убрали мышку
		//диалоговые кнопки после нажатия не должны останавливаться и, тем более, проигрывать обратный спрайт
		if ((btn_enter) and ((type != "dlg_btn") or (!btn_pressed))) {
			//если кнопка после нажатия, надо вернуть ей первый из двух спрайтов 
			//if (btn_pressed) {
			//	var str = sprite_get_name(sprite_index);
			//	var str1 = string_copy(str, 0, string_length(str) - 1); 
			//	sprite_index = asset_get_index(str1 + "1");
			//}
			if (!btn_pressed) {
				btn_enter = false;
				image_speed = -1;
			}
			//btn_pressed = false; 
		}
	}
}
