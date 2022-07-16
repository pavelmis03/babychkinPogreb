/// @description проверка нажатия на кнопку

//есть отличия от стандартной реализации кнопки 
//сравниваем комнату назначения с комнатой из которой пришли
var rm = obj_ctrl_mv.ctrl_mv_arr_mv[array_length(obj_ctrl_mv.ctrl_mv_arr_mv) - 2];

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
	//!!!!!добавлено следующее условие:!!!!
	if (btn_lift_floor[?action] == rm) { //если этаж тот же самый, то звук другой
		array_push(obj_ctrl_snd.sound, sound[0], "snd_gm_lift_currFloor");
		btn_transitionDelay = 1.5;
	} else {
		array_push(obj_ctrl_snd.sound, sound[0], sound[2]);
	}
	btn_pressed = true;
}
