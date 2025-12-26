/// @function scr_draw_quests_record(t2, start_str, end_str, inc, page_pos);
/// @param t2 массив строк в разделе
/// @param start_str начальная строка (номер) для вывода текста
/// @param end_str конечная строка (номер) 
/// @param inc если страница первая, добавляет в цикле к start_str, чтобы учитывался заголовок
/// @param page_pos для какой страницы выводим текст: для левой или правой
/// @description выводит непосредственно пункты заданий на левой или правой страницах
function scr_draw_quests_record(t2, start_str, end_str, inc, page_pos) {
	// словарь задач, по которому строим вывод
	//var tmap = obj_ctrl_gm_iss.ctrl_iss_list_iss;
	// Z - маркер заголовков, P - подзаголовки, M - маркированный список (точечки слева (порядок неважен),
	// N - нумерованный (1, 2, 3 (порядок важен - последовательное выполнение)
	// O - открыта/C - закрыта
	// пример: OP_Разобраться, OZ_ВСПОМНИТЬ
	
	// откуда начинаем перебирать текст
	var start_i = 0;
	// для левой и правой страниц циклы тоже отличаются 
	if (page_pos == "left") {
		start_i = inc;
	} else {
		start_i = ctrl_jrn_txt_str;
	}
	
	// номер подзадачи
	var num = 0;
	for (var i = start_str + start_i; i < end_str; i++) {
		// разбираем текст 
		var status = string_copy(t2[i], 1, 1);	// открыта или закрыта задача
		var marker = string_copy(t2[i], 2, 1);	// какой вариант текста: заголовок, подзаголовок и т.д.
		// строка без маркера
		var str = string_copy(t2[i], 4, string_length(t2[i]));
		draw_set_font(fnt_menu_jrn_txt);
		if (marker == "Z") {
			draw_set_font(fnt_menu_jrn_h2);
			num = 0;	// сбрасываем счетчик
		}
		if (marker == "P") {
			draw_set_font(fnt_menu_jrn_h3);
			num = 0;	// сбрасываем счетчик
			str = "  " + str;
		}
		// увеличиваем номер подзадачи
		if (marker == "N") {
			num++;
			str = "      " + string(num) + ") " + str;
		}
		if (marker == "M") {
			num = 0;	// сбрасываем счетчик
			str = "      *  " + str;
		}
		
		var txt_y = 0, txt_x = 0;
		// для левой и правой страниц разные координаты вывода
		if (page_pos == "left") {
			// i mod 7, чтобы не зависимо от страницы первая строка начиналась в начале листа
			// взял высоту шрифта за 36, чтобы для всех строк была одинаковая
			txt_y = draw_txt_y + (10 * i/*между строками*/) + (i mod ctrl_jrn_txt_str) * /*string_height(str)*/ 36;
		} else {
			// взял высоту шрифта за 36, чтобы для всех строк была одинаковая
			txt_y = draw_txt_y + (10 * (i - ctrl_jrn_txt_str)/*между строками*/)
							+ (i mod ctrl_jrn_txt_str) * /*string_height(str)*/ 36;
			 txt_x = room_width * 0.22;
		}
		
		// сам вывод текста
		draw_text(draw_txt_x + txt_x, txt_y, str);
		
		// зачеркиваем задачу, если она выполнена
		if (status == "C") {
			var endX = draw_txt_x + txt_x + 10 + string_width(str);
			draw_line_width(draw_txt_x + txt_x - 10, txt_y - 10, endX, txt_y - 10, 2);	
		}
	}
}


/// @function scr_draw_quests(t, t2, page, start_str, end_str, inc, str_cnt);
/// @param t информация по разделу [btn_id, open/not, curr_page] фактически важна только страница
/// @param t2 массив строк в разделе
/// @param page количество страниц
/// @param start_str начальная строка (номер) для вывода текста
/// @param end_str конечная строка (номер) 
/// @param inc если страница первая, добавляет в цикле к start_str, чтобы учитывался заголовок
/// @param str_cnt количество строк в раделе
/// @description скрипт для отображения красивой структуры квестов 
function scr_draw_quests(t, t2, page, start_str, end_str, inc, str_cnt) {
	// словарь задач, по которому строим вывод
	//var tmap = obj_ctrl_gm_iss.ctrl_iss_list_iss;
	
	// вывод от левого края
	draw_set_halign(fa_left);
	
	// текст на левой странице
	scr_draw_quests_record(t2, start_str, end_str, inc, "left");
	// текст на правой странице
	if (real(t[2]) + 1 <= real(page)) {	// если эта страница есть 
		// аналогичная проверка последней строки
		end_str += ctrl_jrn_txt_str;
		if (end_str > str_cnt) {
			end_str = str_cnt;
		}
		
		scr_draw_quests_record(t2, start_str, end_str, inc, "right");
	}
	
}