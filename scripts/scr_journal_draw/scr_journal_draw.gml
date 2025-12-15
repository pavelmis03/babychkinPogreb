/// @function scr_draw_quests(t, t2, page, start_str, end_str, inc);
/// @param t информация по разделу [btn_id, open/not, curr_page] фактически важна только страница
/// @param t2 массив строк в разделе
/// @param page количество страниц
/// @param start_str начальная строка (номер) для вывода текста
/// @param end_str конечная строка (номер) 
/// @param inc если страница первая, добавляет в цикле к start_str, чтобы учитывался заголовок
/// @description скрипт для отображения остальных глав
/// @description скрипт для отображения красивой структуры квестов 
function scr_draw_quests(t, t2, page, start_str, end_str, inc) {
	// словарь задач, по которому строим вывод
	//var tmap = obj_ctrl_gm_iss.ctrl_iss_list_iss;
	// Z - маркер заголовков, P - подзаголовки, M - маркированный список (точечки слева (порядок неважен),
	// N - нумерованный (1, 2, 3 (порядок важен - последовательное выполнение)
	// id = номер задачи (две цифры: 01, 02...) + номер подзадачи (01) + номер пункта (01) 
	// пример: 010204 - первая задача, вторая подзадача, 4ый пункт, +1 - 5ый пункт, +100 - третья подзадача
	
	//УДАЛИТЬ ПОСЛЕ ОТЛАДКИ
	draw_set_font(fnt_menu_jrn_txt);
	// текст на левой странице
	for (var i = start_str + inc; i < end_str; i++) {
		// i mod 7, чтобы не зависимо от страницы первая строка начиналась в начале листа
		draw_text(draw_txt_x, draw_txt_y + (10 * i/*между строками*/) + (i mod 7) * string_height(t2[i]), t2[i]);
	}
	// текст на правой странице
	if (real(t[2]) + 1 <= real(page)) {	// если эта страница есть 
		// аналогичная проверка последней строки
		end_str += ctrl_jrn_txt_str;
		if (end_str > str) {
			end_str = str;
		}
		// вывод текста со сдвигом вправо 
		for (var i = start_str + ctrl_jrn_txt_str; i < end_str; i++) {
			draw_text(draw_txt_x + room_width * 0.22, 
						draw_txt_y + (10 * (i - ctrl_jrn_txt_str)/*между строками*/)
							+ (i mod 7) * string_height(t2[i]) - string_height(t2[0]) * 2,
						t2[i]);
		}
	}
	
}
	
/// @function scr_draw_chapters(t, t2, page, start_str, end_str, inc);
/// @param t информация по разделу [btn_id, open/not, curr_page] фактически важна только страница
/// @param t2 массив строк в разделе
/// @param page количество страниц
/// @param start_str начальная строка (номер) для вывода текста
/// @param end_str конечная строка (номер) 
/// @param inc если страница первая, добавляет в цикле к start_str, чтобы учитывался заголовок
/// @description скрипт для отображения остальных глав
function scr_draw_chapters(t, t2, page, start_str, end_str, inc) {
	draw_set_font(fnt_menu_jrn_txt);
	// текст на левой странице
	for (var i = start_str + inc; i < end_str; i++) {
		// i mod 7, чтобы не зависимо от страницы первая строка начиналась в начале листа
		draw_text(draw_txt_x, draw_txt_y + (10 * i/*между строками*/) + (i mod 7) * string_height(t2[i]), t2[i]);
	}
	// текст на правой странице
	if (real(t[2]) + 1 <= real(page)) {	// если эта страница есть 
		// аналогичная проверка последней строки
		end_str += ctrl_jrn_txt_str;
		if (end_str > str) {
			end_str = str;
		}
		// вывод текста со сдвигом вправо 
		for (var i = start_str + ctrl_jrn_txt_str; i < end_str; i++) {
			draw_text(draw_txt_x + room_width * 0.22, 
						draw_txt_y + (10 * (i - ctrl_jrn_txt_str)/*между строками*/)
							+ (i mod 7) * string_height(t2[i]) - string_height(t2[0]) * 2,
						t2[i]);
		}
	}
}