/// @description 

draw_sprite(draw_spr, 0, x, y);

//если сейчас не проигрывается перелистывание
if (sprite_index == spr_sys_none) {
	//отрисовка текста
	var t = ctrl_jrn_btn_map[?ctrl_jrn_btn_active];		//информация по разделу [btn_id, open/not, curr_page] фактически важна только страница
	var t2 = ctrl_jrn_txt_map[?ctrl_jrn_btn_active];	//массив строк в разделе
	var str = array_length(t2);							//строк всего в разделе
	var page = string(ceil(str / ctrl_jrn_txt_str));	//количество страниц
	var start_str = (t[2] - 1) * ctrl_jrn_txt_str;		//начальная строка (номер) для вывода текста
	var end_str = start_str + ctrl_jrn_txt_str;			//конечная строка (номер) 
	var inc = 0;	//если страница первая, добавляет в цикле к start_str, чтобы учитывался заголовок
	draw_set_color(c_black);
	if (t[2] == 1) {	//если страница первая, заголовок рисуется другим шрифтом, поэтому вывод не в цикле, поэтому и start_str надо подвинуть 
		inc = 1;
		draw_set_font(fnt_menu_jrn_header);
		draw_text(draw_txt_x + room_width * 0.09, draw_txt_y - string_height(t2[0]) * 2, t2[0]);	//заголовок раздела
	}
	if (end_str > str) {	//если страница заполнена не до конца, т.е. кол-во строк не делится нацело на ctrl_jrn_txt_str
		end_str = str;
	}
	draw_set_font(fnt_menu_jrn_txt);
	//текст на левой странице
	for (var i = start_str + inc; i < end_str; i++) {
		//i mod 7, чтобы не зависимо от страницы первая строка начиналась в начале листа
		draw_text(draw_txt_x, draw_txt_y + (10 * i/*между строками*/) + (i mod 7) * string_height(t2[i]), t2[i]);
	}
	//текст на правой странице
	if (real(t[2]) + 1 <= real(page)) {	//если эта страница есть 
		//аналогичная проверка последней строки
		end_str += ctrl_jrn_txt_str;
		if (end_str > str) {
			end_str = str;
		}
		//вывод текста со сдвигом вправо 
		for (var i = start_str + ctrl_jrn_txt_str; i < end_str; i++) {
			draw_text(draw_txt_x + room_width * 0.22, draw_txt_y +
													(10 * (i - ctrl_jrn_txt_str)/*между строками*/)
													+ (i mod 7) * string_height(t2[i]) 
													 - string_height(t2[0]) * 2, t2[i]);
		}
	}
	//страница
	//страница слева
	draw_text(room_width * 0.45, room_height * 0.8, string(t[2]) + "/" + page);
	//страница справа, но ее может и не быть
	if (real(t[2]) + 1 <= real(page)) {
		draw_text(room_width * 0.55, room_height * 0.8, string(t[2] + 1) + "/" + page);
	}
} else {
	draw_sprite(sprite_index, image_index, x, y);	
}