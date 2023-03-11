/// @description проверяется нажатие кнопки взаимодействия игроком

//если игрок поблизости и смотрит на терминал 
if (can_interact) {
	if (hp > 0) {	//если у него есть жизни и остались сохранения, а также он не перезагружается
		if ((terminal_saves > 0) and (terminal_state != "reload")) {
			//инициирую протокол сохранения
			obj_ctrl_gm_sv.action = "saveGm";
			alarm[4] = 60 * 5 * room_speed;	//5 минут до следующего сохранения
			//alarm[4] = 5 * room_speed;	//дебаг
			terminal_state = "reload";
			//уменьшаю количество сохранений
			terminal_saves--;
		}
	}
}

// Inherit the parent event
event_inherited();

