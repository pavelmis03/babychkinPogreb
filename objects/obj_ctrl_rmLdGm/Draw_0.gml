/// @description 

draw_set_font(fnt_gm_cmn);
draw_set_color(c_black);

//спрайт скриншота сохранения
image_xscale = 245 / room_width;	//скрины размером 1920х1080, уменьшаю их
image_yscale = 138 / room_height;
draw_sprite_ext(draw_img, image_index, draw_txt_x, draw_txt_y, image_xscale, image_yscale, 0, -1, 1);

draw_set_halign(fa_center);
//отображение номера сохранения
draw_text(room_width * 0.755, room_height * 0.66, "Сохранение " + string(ctrl_ldGm_sv_curr + 1) + "/" + string(ctrl_ldGm_sv));

//отображение страницы сохранений
draw_text(room_width * 0.755, room_height * 0.68, "Страница " + string(ctrl_ldGm_page_curr) + "/" + string(ctrl_ldGm_page));

//отображение номера игры
draw_text(room_width * 0.755, room_height * 0.70, "ИГРА " + string(ctrl_ldGm_gm_curr + 1) + "/" + string(ctrl_ldGm_gm));

draw_set_halign(fa_left);
var tid = btn_loaderId[btn_loaderNum];	//id кнопки в фокусе
//проверяю, что кнопка-загрузчик существует
if (instance_exists(tid)) {
	//отрисовка информации о сохранении	
	draw_set_font(fnt_menu_ld);
	var newStr1 = scr_str_spltStrOnSStrByLen(tid.btn_infoStruct[$"name"], 330 / (1920 / room_width));
	var newStr2 = scr_str_spltStrOnSStrByLen(tid.btn_infoStruct[$"parent"], 330 / (1920 / room_width));
	
	var ty = draw_txt_y + sprite_get_height(draw_img) * image_yscale;
	draw_text(draw_txt_x, ty + 10, "Сохранение: ");
	draw_text(draw_txt_x, ty + 30, "  " + newStr1);
	draw_text(draw_txt_x, ty + 80, "Сохранено: ");
	draw_text(draw_txt_x, ty + 100, "  " + tid.btn_infoStruct[$"dateTime"]);
	draw_text(draw_txt_x, ty + 120, "В Мурохино было: ");
	draw_text(draw_txt_x, ty + 140, "  " + tid.btn_infoStruct[$"dateTimeGm"]);
	draw_text(draw_txt_x, ty + 160, "Текущая задача: ");
	draw_text(draw_txt_x, ty + 180, "  " + tid.btn_infoStruct[$"quest"]);
	draw_text(draw_txt_x, ty + 200, "Территория сохранения: ");
	draw_text(draw_txt_x, ty + 220, "  " + tid.btn_infoStruct[$"location"]);
	draw_line_width(draw_txt_x, ty + 245, draw_txt_x + 250, ty + 245, 4);
	draw_text(draw_txt_x, ty + 260, "Сохранение-родитель: ");
	draw_text(draw_txt_x, ty + 280, "  " + newStr2);
}
