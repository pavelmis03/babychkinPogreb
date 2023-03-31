/// @description заполняет фон пикселями и очищает, может их отключать

//main
ctrl_pixelRm_on = obj_ctrl_set.ctrl_set_map_curr[?"pixels"];
time = obj_ctrl_gm.ctrl_gm_pixel_time;	 //время заполнения экрана, время очистки в два раза меньше
ctrl_pixelRm_full = false;
//action = "";

//надпись посередине
draw_txt_xscale = 3;
//-1/1 если текст уменьшается/увеличивается
//ctrl_pixelRm_multiplier = 1;
//-1/1 если текст темнеет/светлеет
ctrl_pixelRm_multiplier_cl = 1;
draw_txt_cl = 1;

//пиксели
ctrl_pixelRm_cell_w = 16;	//размеры ячеек
ctrl_pixelRm_cell_h = 16;
//количество столбцов и строк в массиве пикселей, где 32 - размер пикселя
ctrl_pixelRm_col = ceil(room_width / ctrl_pixelRm_cell_w);
ctrl_pixelRm_row = ceil(room_height / ctrl_pixelRm_cell_h);
//свободные клетки (для рандомного заполнения)
ctrl_pixelRm_list_free = ds_list_create();
//массив цветов пикселей (если цвет == 0, значит, пикселя не существует)
ctrl_pixelRm_arr_cl = [];
for (var i = 0; i < ctrl_pixelRm_row; i++) {
	ctrl_pixelRm_arr_cl[i] = array_create(ctrl_pixelRm_col, -1);
	for (var j = 0; j < ctrl_pixelRm_col; j++) {
		ds_list_add(ctrl_pixelRm_list_free, i * ctrl_pixelRm_col + j);
	}
}
//перемешиваем значения
ds_list_shuffle(ctrl_pixelRm_list_free);

alarm[1] = 1;	//заполнение пикселями

