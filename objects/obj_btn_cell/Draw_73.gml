/// @description предмет в руках и количество предметов в ячейке

if (init) {
	var txc = sprite_get_width(sprite_index) - string_width(string(cell_cnt));	// координаты для количества предметов
	var tyc = sprite_get_height(sprite_index) - string_height("0");
	draw_set_color(c_dkgrey);
	draw_set_font(fnt_cmn_smallB);

	if (obj_ctrl_gm_rmInv.cellId == id) {	// если предмет из нашей ячейки сейчас в руках
		// отображаем иконку предмета в координатах мыши
		draw_sprite(spr_inv_ico, inv_ico_num, mouse_x, mouse_y);
		txc += mouse_x - x;	// координаты для количества предметов
		tyc += mouse_y - y;	// вычитаю х и у, потому что потом в функции рисования прибавляю их
	}

	if ((obj_ctrl_gm_rmInv.cellId == id)) {	// если в этой ячейке что-то лежит или это наша ячейка, поднятая в руки
		// отображаем количество предметов в ячейке в правом нижнем углу
		var ysc = (string_height(cell_cnt) + 5) / sprite_get_height(spr_inv_hintBg);	
		var xsc = (string_width(cell_cnt) + 5) / sprite_get_width(spr_inv_hintBg);
		draw_sprite_ext(spr_inv_hintBg, 1, x + txc, y + tyc, xsc, ysc, 0, c_white, 1);	// фон
		draw_text(x + txc + 2.5, y + tyc + 2.5, string(cell_cnt));
	}
}









