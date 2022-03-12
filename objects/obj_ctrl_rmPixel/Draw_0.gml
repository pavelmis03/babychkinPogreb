/// @description 


//пиксели
//если заполнение включено
if (ctrl_pixelRm_on) {
	//проходим по всем пикселям
	for (var i = 0; i < ctrl_pixelRm_row; i++) {
		for (var j = 0; j < ctrl_pixelRm_col; j++) {
			//если пиксель уже был создан
			if (ctrl_pixelRm_arr_cl[i, j] != -1) {
				//меняю цвет 
				//ctrl_pixelRm_arr_cl[i, j] = (ctrl_pixelRm_arr_cl[i, j] + 80 / room_speed) mod 255;
				ctrl_pixelRm_arr_cl[i, j] = irandom_range(0, 255);
				var x1 = j * ctrl_pixelRm_cell_w;
				var y1 = i * ctrl_pixelRm_cell_h;
				var x2 = x1 + ctrl_pixelRm_cell_w;
				var y2 = y1 + ctrl_pixelRm_cell_h;
				var cl = make_color_rgb(ctrl_pixelRm_arr_cl[i, j], ctrl_pixelRm_arr_cl[i, j], ctrl_pixelRm_arr_cl[i, j]);
				draw_rectangle_color(x1, y1, x2, y2, cl, cl, cl, cl, false);
			}
		}
	}
}

//настройки текста
draw_set_font(fnt_set);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
/* поворачивающийся посередине экрана текст
//создаю эффект поворота текста по оси у
draw_txt_xscale -= 0.5 / room_speed * ctrl_pixelRm_multiplier;
if (draw_txt_xscale == -3 or draw_txt_xscale == 3) {
	ctrl_pixelRm_multiplier *= -1;
}
*/
//меняю цвет
draw_txt_cl = draw_txt_cl + 31 / room_speed * ctrl_pixelRm_multiplier_cl;
if (draw_txt_cl >= 255 or draw_txt_cl <= 1) {
	ctrl_pixelRm_multiplier_cl *= -1;
}
draw_set_color(make_color_rgb(draw_txt_cl, draw_txt_cl, draw_txt_cl));
//если писели включены, предлагаем выключить их и наоборот (выводим надпись)
var txt = "ЧТОБЫ ВЫКЛЮЧИТЬ ЭФФЕКТЫ, НАЖМИТЕ ПРОБЕЛ:/";
if (!ctrl_pixelRm_on) {
	txt = "ЧТОБЫ ВКЛЮЧИТЬ ЭФФЕКТЫ, НАЖМИТЕ ПРОБЕЛ;)";	
}
draw_text_ext_transformed(room_width / 2, room_height * 0.1, txt, 10, -1, draw_txt_xscale, 8, image_angle);
