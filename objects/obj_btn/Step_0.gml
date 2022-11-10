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

//если был сигнал на деактивацию кнопок 
if ((obj_ctrl_dlg.ctrl_dlg_disable_btn == 1) and (type != "dlg_btn")) {
	btn_enable = false;
}

if (obj_ctrl_dlg.ctrl_dlg_disable_btn == 2) {
	btn_enable = true;
}

var str = sprite_get_name(sprite_index);
var str1 = string_copy(str, 0, string_length(str) - 1); 
//настройка спрайта недоступности
if (!btn_enable) {
	//image_speed = 0;
	//спрайт деактивации кнопки
	sprite_index = asset_get_index(str1 + "0");
	image_index = 0;
}

//если кнопка стала доступна, а спрайт является спрайтом недоступности, меняем на первый
var num_spr = string_copy(str, string_length(str), 1);
if ((btn_enable) and (num_spr == "0")) {
	image_speed = 0;
	//спрайт активации кнопки
	sprite_index = asset_get_index(str1 + "1");	
	image_index = 0;
}

//деактивируются, например, при диалогах
if (btn_enable) {
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