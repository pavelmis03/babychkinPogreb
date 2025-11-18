/// @function scr_interface_mileageCalc();
/// @description меняет массив цифр (к которым привязаны картинки пробега)
function scr_interface_mileageCalc() {
	// пробег
	var t = round(obj_ctrl_gm_buh.buh_mileage);
	if (abs(draw_buh_mileageLast - t) > 0.1) {	// если пробег увеличился, то меняем наш, пока: ...
		var tt = [];	// временный массив
		for (var i = 0; i < 6; i++) {	// разбиваем новое значение пробега на цифры
			array_push(tt, t % 10);
			t = floor(t / 10);
		}	
		for (var i = 0; i < 6; i++) {	
			if (abs(draw_buh_mileage[i] - tt[i]) > 0.1) {
				// (4 кадра нужно поменять со скоростью 5 кадров / сек)
				// прибавляем к нашим цифрам, пока не достигнем примерно нового пробега
				draw_buh_mileage[i] += 1 / fps * 5;	
			}
		}
		draw_buh_mileageLast += 1 / fps * 5;	// параллельно массиву обновляем и переменную пробега интерфейса
	} else {
		if (draw_buh_mileageLast != t) {	// если мы уже почти дошли до нового значения пробега
			draw_buh_mileageLast = t;		// назначаем точное значение
			for (var i = 0; i < 6; i++) {	// обновляем массив
				draw_buh_mileage[i] = t % 10;
				t = floor(t / 10);
			}
		}
	}
}

/// @function scr_interface_drawWpn(vw, cx, cy, str, wpn, wpn_act, p, w);
/// @param vw структура параметров вида { x: view_x, w: view_w, y: view_y, h: view_h }
/// @param cx коэффициенты, которые позиционируют данный параметр
/// @param cy коэффициенты, которые позиционируют данный параметр
/// @param str название типа оружия (заголовок)
/// @param wpn название оружия, которое на данной ячейке лежит
/// @param wpn_act тип активного оружия
/// @param p патроны данного оружия
/// @param w прочность данного оружия
/// @description выводит информацию об оружии: заголовок, иконка, патроны и прочность в разных цветах в зависимости от параметров. Если нет оружия в ячейке сняряжения, не выводит
function scr_interface_drawWpn(vw, cx, cy, str, wpn, wpn_act, p, w) {
	var temp_spr = spr_ico_AK;	// иконка оружия
	var cl = c_blue;
	var l0 = sprite_get_width(temp_spr), l1 = string_width("Боеприпасы: ");
	
	draw_set_color(c_white);
	// заголовок (основное оружие...)
	draw_text(vw[$"x"] + vw[$"w"] * (cx), vw[$"y"] + vw[$"h"] * (cy), str + ":");
	// если у нас вообще есть какое-то оружие в руках
	if (wpn[0] != "") {
		// если данный вид снаряжения выбран, подсвечиваем желтым
		if (wpn_act == str) {
			cl = c_yellow;
		}
		draw_set_color(cl);	// обычный цвет - синий
		draw_text(vw[$"x"] + vw[$"w"] * (cx) + l0, vw[$"y"] + vw[$"h"] * (cy + 0.019), "Боеприпасы: ");
		if (p <= global.CONST_MAP_WEAPON[?wpn[0]][1]) {	// если патронов осталась одна обойма
			draw_set_color(c_orange);	// предупреждаем оранжевым цветом
		}
		if (p == 0) {		// если патроны кончились - красный
			draw_set_color(c_red);
		}
		// количество патронов
		draw_text(vw[$"x"] + vw[$"w"] * (cx + 0.001) + l1 + l0, vw[$"y"] + vw[$"h"] * (cy + 0.019), string(p));
	
		draw_set_color(cl);
		draw_text(vw[$"x"] + vw[$"w"] * (cx + 0.001) + l0, vw[$"y"] + vw[$"h"] * (cy + 0.036), "Прочность: ");
		// ЕСЛИ ПРОЧНОСТЬ МЕНЬШЕ 50%
		if (w < 80) {
			draw_set_color(c_red);
		}
		if (w < 50) {
			draw_set_color(c_orange);
		}
		// прочность
		draw_text(vw[$"x"] + vw[$"w"] * (cx + 0.001) + string_width("Прочность: ") + l0, vw[$"y"] + vw[$"h"] * (cy + 0.036), string(w) + "%");
		// иконка оружия
		temp_spr = global.CONST_MAP_WEAPON[?wpn[0]][7];
		draw_sprite(temp_spr, image_index, vw[$"x"] + vw[$"w"] * (cx + 0.001), vw[$"y"] + vw[$"h"] * (cy + 0.024));
	} else {	// пустая иконка
		draw_sprite(spr_ico_wpnEmpty, image_index, vw[$"x"] + vw[$"w"] * (cx + 0.001), vw[$"y"] + vw[$"h"] * (cy + 0.024));
	}
}

/// @function scr_interface_playerParam(vw, cx, cy, str, cl, val);
/// @param vw структура параметров вида { x: view_x, w: view_w, y: view_y, h: view_h }
/// @param cx коэффициенты, которые позиционируют данный параметр
/// @param cy коэффициенты, которые позиционируют данный параметр
/// @param str название параметра
/// @param cl цвет, которым заполнять шкалу
/// @param val сам параметр, который мы отображаем в шкале
/// @description выводит надпись и шкалу в виде прямоугольника о параметрах игрока (голод, жажда и т.д.)
function scr_interface_playerParam(vw, cx, cy, str, cl, val) {
	
	draw_set_color(c_white);
	draw_text(vw[$"x"] + vw[$"w"] * (cx), vw[$"y"] + vw[$"h"] * (cy), str);
	draw_rectangle(vw[$"x"] + vw[$"w"] * (cx), vw[$"y"] + vw[$"h"] * (cy + 0.026), vw[$"x"] + vw[$"w"] * (cx + 0.056), vw[$"y"] + vw[$"h"] * (cy + 0.041), true);
	draw_set_color(cl);
	draw_rectangle(vw[$"x"] + vw[$"w"] * (cx + 0.0015), vw[$"y"] + vw[$"h"] * (cy + 0.029), vw[$"x"] + vw[$"w"] * (cx + 0.002) + string(val), vw[$"y"] + vw[$"h"] * (cy + 0.038), false);	
}

/// @function scr_interface_drawEqu(vw, cx, cy, str, wpn, wpn_act);
/// @param vw структура параметров вида { x: view_x, w: view_w, y: view_y, h: view_h }
/// @param cx коэффициенты, которые позиционируют данный параметр
/// @param cy коэффициенты, которые позиционируют данный параметр
/// @param str название типа оружия (заголовок)
/// @param wpn название предмета, который на данной ячейке лежит
/// @param wpn_act тип активной ячейки (снаряжение 1 или 2)
/// @param icoEmpty иконка пустой ячейки 
/// @description выводит информацию о ячейке сняряжения
function scr_interface_drawEqu(vw, cx, cy, str, wpn, wpn_act, icoEmpty) {

	// спрайт пустой ячейки
	draw_sprite(icoEmpty, image_index, vw[$"x"] + vw[$"w"] * (cx), vw[$"y"] + vw[$"h"] * (cy));
	if (wpn_act == str) {	// если название типа активной ячейки совпадает с названием нашей, выделяем ее
		draw_sprite(spr_ico_select, image_index, vw[$"x"] + vw[$"w"] * (cx), vw[$"y"] + vw[$"h"] * (cy));
	}
	if (wpn[0] != "") {	// если вообще ячейка заполнена
		if (ds_map_exists(global.CONST_MAP_WEAPON, wpn[0])) {	// если это оружие (гранаты)
			// иконка предмета
			draw_sprite(global.CONST_MAP_WEAPON[?wpn[0]][7], image_index, vw[$"x"] + vw[$"w"] * (cx), vw[$"y"] + vw[$"h"] * (cy));
		}
		if (ds_map_exists(global.CONST_MAP_CLOTHES, wpn[0])) {	// если это снаряжение
			// иконка предмета
			draw_sprite(global.CONST_MAP_CLOTHES[?wpn[0]][7], image_index, vw[$"x"] + vw[$"w"] * (cx), vw[$"y"] + vw[$"h"] * (cy));
		}
		// количество предметов в ячейке
		// координаты для количества предметов
		var txc = sprite_get_width(sprite_index) - string_width(string(wpn[1]));
		var tyc = sprite_get_height(sprite_index) - string_height("0");
		// отображаем количество предметов в ячейке в правом нижнем углу
		var ysc = (string_height(wpn[1]) + 5) / sprite_get_height(spr_inv_hintBg);	
		var xsc = (string_width(wpn[1]) + 5) / sprite_get_width(spr_inv_hintBg);
		draw_sprite_ext(spr_inv_hintBg, 1, vw[$"x"] + vw[$"w"] * (cx) + txc, vw[$"y"] + vw[$"h"] * (cy) + tyc, xsc, ysc, 0, c_white, 1);	// фон
		draw_text(vw[$"x"] + vw[$"w"] * (cx) + txc + 2.5, vw[$"y"] + vw[$"h"] * (cy) + tyc + 2.5, string(wpn[1]));
	}
}





