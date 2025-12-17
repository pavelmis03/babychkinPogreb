/// @description 

draw_sprite(draw_spr, 0, x, y);

// если сейчас не проигрывается перелистывание
if (sprite_index == spr_sys_none) {
	// отрисовка текста
	var t = ctrl_jrn_map_btn[?ctrl_jrn_btn_active];		// информация по разделу [btn_id, open/not, curr_page] фактически важна только страница
	var t2 = ctrl_jrn_map_txt[?ctrl_jrn_btn_active];	// массив строк в разделе
	var str_cnt = array_length(t2);							// строк всего в разделе
	var page = string(ceil(str_cnt / ctrl_jrn_txt_str));	// количество страниц
	var start_str = (t[2] - 1) * ctrl_jrn_txt_str;		// начальная строка (номер) для вывода текста
	var end_str = start_str + ctrl_jrn_txt_str;			// конечная строка (номер) 
	// если страница первая, добавляет в цикле к start_str, чтобы учитывался заголовок
	var inc = 0;	
	draw_set_color(c_black);
	// если страница первая, заголовок рисуется другим шрифтом,
	// поэтому вывод не в цикле, поэтому и start_str надо подвинуть 
	if (t[2] == 1) {	
		inc = 1;
		draw_set_font(fnt_menu_jrn_h1);
		draw_text(draw_txt_x + room_width * 0.089, draw_txt_y - 36, t2[0]);	// заголовок раздела
	}
	// если страница заполнена не до конца, т.е. кол-во строк не делится нацело на ctrl_jrn_txt_str
	if (end_str > str_cnt) {	
		end_str = str_cnt;
	}
	
	// отрисовка основного текста
	if (ctrl_jrn_btn_active == "quest") {
		// скрипт для отрисовки задач в журнале
		scr_draw_quests(t, t2, page, start_str, end_str, inc, str_cnt);
	} else {
		// скрипт для отрисовки остальных разделов в журнале (возможно, будет нужна другая функция)
		scr_draw_quests(t, t2, page, start_str, end_str, inc, str_cnt);
	}
	
	// страницы
	// страница слева
	draw_text(room_width * 0.42, room_height * 0.8, string(t[2]) + "/" + page);
	// страница справа, но ее может и не быть
	if (real(t[2]) + 1 <= real(page)) {
		draw_text(room_width * 0.58, room_height * 0.8, string(t[2] + 1) + "/" + page);
	}
} else {
	draw_sprite(sprite_index, image_index, x, y);	
}