/// @description 

//если игрок зашел в меню статистики
if (ctrl_stat_menu) {
	var t_y = room_height * 0.7;
	var m = 0;
	//рисуем текст 
	for (var i = 0; i < array_length(ctrl_stat_arr_draw); i++) {
		var t = ctrl_stat_arr_draw[i];
		//нужно, чтобы правильно учитывались заголовки они-то вручную созданы, поэтому расстояние между ними другое
		//одно слагаемое отвечает за закрытые заголовки, другое за открытые
		if (i == 0 or i == 10 or i == 19 or i == 23) {
			m += (1 - t[1]) * 2.3 + t[1] * 1.3;
		}
		if (t[1]) {
			//ВАЖНО: ЕСЛИ МЕНЯТЬ ЗДЕСЬ КОЭФФИЦИЕНТ, МЕНЯТЬ И В scr_stat_changeFlag
			//25 - ширина текста заголовка, m - количество заголовков свеху 
			t_y = draw_txt_y + 25 * m - 10;
			//заголовок
			draw_text(draw_txt_x, t_y, t[0]);
			//значение
			draw_text(draw_txt_x + room_width * 0.3, t_y, string(t[3] + t[4]));
			m++;
		}
	}
	//если текст приблизился к нижней границе комнаты, подаем сигнал на увеличение последней
	if (t_y > room_height * 0.75) {
		ctrl_stat_enlarging = 2;
	}
	//если текста намного меньше, чем места для него, уменьшаем комнату
	if (t_y < room_height * 0.6) {
		ctrl_stat_enlarging = 1;
	}
}
