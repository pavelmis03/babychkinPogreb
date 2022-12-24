/// @description проверка нажатия на кнопку


//есть отличия от стандартной реализации кнопки 
//сравниваем комнату назначения с комнатой из которой пришли
var rm = obj_ctrl_mv.ctrl_mv_arr_mv[array_length(obj_ctrl_mv.ctrl_mv_arr_mv) - 2];

if (btn_enable) {
	//при диалоге остальные кнопки не активны. если кнопка еще не была нажата (зачем дважды-то)
	if ((!obj_ctrl_dlg.ctrl_dlg_exist or type == "dlg_btn") and (!btn_pressed)) {
		//если кнопка нажата, запускаем спрайт нажатия кнопки
		var str = sprite_get_name(sprite_index);
		var str1 = string_copy(str, 0, string_length(str) - 1); 
		sprite_index = asset_get_index(str1 + "2");
		image_index = 0;
		//включаем скорость проигрывания 
		image_speed = 1;
		//проверяем, что еще не было нажато ни одной кнопки, иначе мы только меняем ей спрайт и все
		//НАХНАЧЕНИЕ НАШЕГО ID ПРОИСХОДИТ В ANIMeND. ПОЭТОМУ СПРАЙТ ДОЛЖЕН БЫТЬ БЫСТРЫМ 
		if (obj_ctrl_rmElevator.ctrl_elevator_id_btn_pressed == 0) {
			//воспроизводим звук клика
			obj_ctrl_snd.action = "playSnd";
			//!!!!!добавлено следующее условие:!!!!
			if (btn_lift_floor[?action] == rm) { //если этаж тот же самый, то звук другой
				array_push(obj_ctrl_snd.sound, sound[0], "snd_gm_lift_currFloor");
				btn_transitionDelay = 3;
			} else {
				array_push(obj_ctrl_snd.sound, sound[0], sound[2]);
				btn_transitionDelay = 6;
			}
		} else {
			//если мы нажимаем на кнопки диспетчера и выжженную, то звук надо воспроизвести
			if ((action == "scaryVoice") or (action == "none")) {
				//воспроизводим звук клика
				obj_ctrl_snd.action = "playSnd";
				array_push(obj_ctrl_snd.sound, sound[0], sound[2]);
			}
		}
		//назначаем нажатие, чтобы поменялся спрайт
		btn_pressed = true;
	}
}