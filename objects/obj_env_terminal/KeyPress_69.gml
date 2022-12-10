/// @description проверяется нажатие кнопки взаимодействия игроком

//если игрок поблизости и смотрит на терминал 
if (can_interact) {
	if (hp > 0) {	//если у него есть жизни и остались сохранения
		if (terminal_saves > 0) {
			//уменьшаю количество сохранений
			terminal_saves--;
			//инициирую протокол сохранения
			obj_ctrl_gm_sv.action = "saveGm";
		}
	}
}

// Inherit the parent event
event_inherited();

