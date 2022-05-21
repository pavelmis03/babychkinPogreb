/// @description выполнение действий

switch (action) {
	//очистка подсказки
	case "cleareHint":
		draw_txt = "";
	break;
	//
	case "set_hint":
		var newH = ctrl_hint_hint_map[?ctrl_hint_newHint];
		var curr = ctrl_hint_hint_map[?ctrl_hint_currHint];
		//если сейчас подсказки нет или приоритет новой выше, назначаем, иначе ждем, пока сотрется предыдущая
		if ((ctrl_hint_currHint == "") or (newH[1] > curr[1])) {
			//запоминаю последнюю подсказку, чтобы по ней можно было вычислить приоритет позже
			ctrl_hint_currHint = ctrl_hint_newHint;
			ctrl_hint_newHint = "";
			//время жизни подсказки
			alarm[0] = newH[2] * room_speed;
			draw_txt = newH[0];
		}
	break;
}
