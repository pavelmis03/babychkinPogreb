/// @description 

draw_set_color(c_dkgrey);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_cmn_smallB);
var txc, tyc, ysc, xsc, t;
var th = sprite_get_height(sprite_index);
var tw = sprite_get_width(sprite_index);
var ctrl = obj_ctrl_gm_rmInv;

if (init) {
	// координаты для количества предметов
	txc = tw - string_width(string(cell_cnt));
	tyc = th - string_height("0");

	// если на ячейку нажали, она меняет цвет
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, cl_subl, 1);

	if (btn_enter) {	// спрайт выделенной ячейки. Рисуем в х у, потому что точка привязки так установлена
		draw_sprite(spr_inv_cellSelect, image_index, x, y);
	}

	if ((cell_obj != "") or ((ctrl.cellId == id))) {	// если в этой ячейке что-то лежит или это наша ячейка, поднятая в руки
	
		if (cell_obj != "") {	// иконка предмета в ячейке только если предмет в ней лежит (не в руках)
			var tcl = c_white;
			if (!btn_enable) {	// если кнопка недоступна, спрайт иконки тоже рисуем темным
				tcl = c_dkgray;
			}
			draw_sprite_ext(spr_inv_ico, inv_ico_num, x, y, 1, 1, 0, tcl, 1);	
		}
	
		// отображаем количество предметов в ячейке в правом нижнем углу
		ysc = (string_height(cell_cnt) + 5) / sprite_get_height(spr_inv_hintBg);	
		xsc = (string_width(cell_cnt) + 5) / sprite_get_width(spr_inv_hintBg);
		draw_sprite_ext(spr_inv_hintBg, 1, x + txc, y + tyc, xsc, ysc, 0, c_white, 1);	// фон
		draw_text(x + txc + 2.5, y + tyc + 2.5, string(cell_cnt));
	
		if (btn_enter) {	// рисуем текст названия предмета
			 // рисуем подсказку только если мышкой навели на данный предмет и в руках ничего нет
			if ((ctrl.mouseOnCellId == id) and (ctrl.cellId == -1)) {
				// спрайт фона текста-подсказки названия предмета
				// расчитываю коэффициенты длины и ширины спрайта в зависимости от длины названия
				// (+10 и +20 - это чтобы строка была не вплотную к границам фона
				var ysc = (string_height(inv_name) + 5) / sprite_get_height(spr_inv_hintBg);	
				var xsc = (string_width(inv_name) + 10) / sprite_get_width(spr_inv_hintBg);
				
				draw_sprite_ext(spr_inv_hintBg, 0, x, y + th, xsc, ysc, 0, c_white, 1);	// фон
				draw_text(x + 5, y + th + 2.5, inv_name);	// текст подсказки - имени предмета
			}
			
			var t_cell_obj;
			var tx = room_width * 0.08, ty = room_height * 0.8;	// координаты начала доп. информации
			var tx1 = tx + sprite_get_width(spr_inv_cellSelect) * 2, ty1 = ty - 20;
			
			// получение информации о предмете
			if (cell_owner == "ctrl") {
				t_cell_obj = ctrl.inv_items[cell_numR][cell_numC][0];	// если предмет в руках, cell_obj = "", чтобы всегда работало
				inv_otherInfo = ctrl.inv_items[cell_numR][cell_numC][2];	// доп информация о предмете
			} else {
				t_cell_obj = ctrl.inv_items_other[cell_numR][cell_numC][0];	// если предмет в руках, cell_obj = "", чтобы всегда работало
				inv_otherInfo = ctrl.inv_items_other[cell_numR][cell_numC][2];	// доп информация о предмете
			}
		
			// вывод подробной информации о предмете
			draw_set_color(c_white);
			draw_set_font(fnt_set);
			draw_sprite_ext(spr_inv_ico, inv_ico_num, tx, ty, 2, 2, 0, c_white, 1);	// картинка
			
			draw_text(tx1, ty1, "Название: " + inv_name);	// имя предмета
			draw_text(tx1, ty1 + string_height(inv_name) + 2, "Тип предмета: " + inv_type);		// тип предмета
			if ((!ctrl.mouseXSide) or (ctrl.inv_type != "normalInv")) {	// если наводим на предмет слева, обычная инфа
				draw_text(tx1, ty1 + (string_height(inv_name) + 2) * 2, "Описание: " + inv_discription);		// описание
				draw_text(tx1, ty1 + (string_height(inv_name) + 2) * 3, "Предмет может быть использован для: " + inv_use);		// использование
				draw_text(tx1, ty1 + (string_height(inv_name) + 2) * 4, "Редкость предмета: " + inv_rarity);	// редкость
				draw_text(tx1, ty1 + (string_height(inv_name) + 2) * 5, "Стоимость предмета у продавца: " + string(inv_buyCost) + "₽");	// стоимость 
				draw_text(tx1, ty1 + (string_height(inv_name) + 2) * 6, "Вес предмета: " + string(inv_weight) + "кг");	// вес
			} else {	// если в инвентаре-контрагенте (в инвентаре снаряжения), специфическая
				draw_text(tx1, ty1 + (string_height(inv_name) + 2) * 2, "Вес предмета: " + string(inv_weight) + "кг");	// вес
				draw_text(tx1, ty1 + (string_height(inv_name) + 2) * 3, inv_otherInfo[0][0] + string(inv_otherInfo[0][1]));		// доп информация
				draw_text(tx1, ty1 + (string_height(inv_name) + 2) * 4, inv_otherInfo[1][0] + string(inv_otherInfo[1][1]));		// доп информация
				draw_text(tx1, ty1 + (string_height(inv_name) + 2) * 5, inv_otherInfo[2][0] + string(inv_otherInfo[2][1]));		// доп информация
				draw_text(tx1, ty1 + (string_height(inv_name) + 2) * 6, inv_otherInfo[3][0] + string(inv_otherInfo[3][1]));		// доп информация
			}
			if (ds_map_exists(obj_ctrl_gm_inv.inv_map_items, t_cell_obj)) {
				t = string(obj_ctrl_gm_inv.inv_map_items[?t_cell_obj]);
			} else {
				t = "0";
			}
				
			draw_text(tx1, ty1 + (string_height(inv_name) + 2) * 7, "Всего таких предметов в рюкзаке: " + t);	// количество в инвентаре
		}
	}
}












