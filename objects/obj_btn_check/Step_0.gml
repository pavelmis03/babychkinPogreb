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
			scr_snd_requestPlaySnd(asset_get_index(sound[1]), asset_get_index(sound[1]), sound[0], true);	//звук наведения
			btn_enter = true;
		}
	} else {
		//запустили обратный спрайт
		if (btn_enter) {
			//image_speed = -sprite_get_speed(sprite_index);
			btn_enter = false;
			//btn_pressed = false;
		}
	}
}

//если кнопка нажата, меняем спрайт на нажатый (там всего две картинки)
btn_pressed = bool(obj_ctrl_set.ctrl_set_map_curr[?action]);
image_index = btn_pressed;