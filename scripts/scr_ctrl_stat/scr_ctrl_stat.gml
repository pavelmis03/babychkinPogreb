/// @function scr_stat_changeFlag(ind);
/// @param {} ind индекс, с которого начинаются изменения
/// @description меняет флаг в разделе (открывает раздел) и подразделах массива, если нужно, создает заголовки
function scr_stat_changeFlag(ind) {
	//меняем флаг
	var t = ctrl_stat_arr_draw[ind];
	ctrl_stat_arr_draw[ind] = [t[0], !t[1], t[2], t[3], t[4]];
	var i = ind + 1;
	//меняем флаги у всех подэлементов
	for (; i < (ind + 1 + t[2]); i++) {
		var t2 = ctrl_stat_arr_draw[i];
		ctrl_stat_arr_draw[i] = [t2[0], !t2[1], t2[2], t2[3], t2[4]];
	}
	//двигаем кнопки вниз
	with (obj_btn_check) {
		//если номер кнопки (в строках статистики) (рассчитывается по массиву статистики)
		//больше, чем последняя из открытых, значит, кнопка лежит ниже по списку 
		if (btn_num >= i) {
			//подвинуть вверх или вниз, в зависимости от того, открылся список или закрылся
			if (!t[1]) {
				y += t[2] * 25;
				draw_txt_y += t[2] * 25;
			} else {
				y -= t[2] * 25;
				draw_txt_y -= t[2] * 25;
			}
		}
	}
}

