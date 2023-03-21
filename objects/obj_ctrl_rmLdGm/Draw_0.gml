/// @description 

draw_set_font(fnt_gm_cmn);
draw_set_color(c_black);

//спрайт скриншота сохранения
image_xscale = 245 / room_width;	//скрины размером 1920х1080, уменьшаю их
image_yscale = 138 / room_height;
draw_sprite_ext(draw_img, image_index, draw_txt_x, draw_txt_y, image_xscale, image_yscale, 0, -1, 1);

draw_set_halign(fa_center);
//отображение номера сохранения
draw_text(room_width * 0.755, room_height * 0.64, "Сохранение " + string(ctrl_ldGm_sv_curr + 1) + "/" + string(ctrl_ldGm_sv));

//отображение страницы сохранений
draw_text(room_width * 0.755, room_height * 0.67, "Страница " + string(ctrl_ldGm_page_curr) + "/" + string(ctrl_ldGm_page));

//отображение номера игры
draw_text(room_width * 0.755, room_height * 0.70, "ИГРА " + string(ctrl_ldGm_gm_curr + 1) + "/" + string(ctrl_ldGm_gm));

draw_set_halign(fa_left);
var tid = btn_loaderId[btn_loaderNum];	//id кнопки в фокусе
//проверяю, что кнопка-загрузчик существует
if (instance_exists(tid)) {
	//отрисовка информации о сохранении	
	var ty = draw_txt_y + sprite_get_height(draw_img) * image_yscale;
	draw_text(draw_txt_x, ty + 10, "Сохранение номер: ");
	draw_text(draw_txt_x, ty + 30, "    " + tid.btn_infoStruct[$"name"]);
	draw_text(draw_txt_x, ty + 50, "Сохранено: ");
	draw_text(draw_txt_x, ty + 70, "    " + tid.btn_infoStruct[$"dateTime"]);
	draw_text(draw_txt_x, ty + 90, "В Мурохино было: ");
	draw_text(draw_txt_x, ty + 110, "    " + tid.btn_infoStruct[$"dateTimeGm"]);
	draw_text(draw_txt_x, ty + 130, "Текущая задача: ");
	draw_text(draw_txt_x, ty + 150, "    " + tid.btn_infoStruct[$"quest"]);
	draw_text(draw_txt_x, ty + 170, "Территория сохранения: ");
	draw_text(draw_txt_x, ty + 190, "    " + tid.btn_infoStruct[$"location"]);
	draw_line_width(draw_txt_x, ty + 225, draw_txt_x + 250, ty + 225, 4);
	draw_text(draw_txt_x, ty + 235, "Сохранение-родитель: ");
	draw_text(draw_txt_x, ty + 255, "    " + tid.btn_infoStruct[$"parent"]);
}
