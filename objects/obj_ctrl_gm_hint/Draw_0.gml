/// @description отображение подсказки

player_obj = scr_player_type();

draw_set_font(fnt_gm_hint);
draw_set_color(c_grey);
//текст будет рисоваться нижней координатой над играком (не нужно вычитать из У высоту строки)
draw_set_valign(fa_bottom);
draw_set_halign(fa_center);

//если сущестсует перс. текст подсказки не пустой и в настройках подсказки включены
if ((player_obj != -1) and (draw_txt != "") and (obj_ctrl_set.ctrl_set_map_curr[?"hints"]) and (obj_ctrl_gm.ctrl_gm_phase == 1)) {
	draw_txt_x = player_obj.x;
	//по У отступаю длины проекций высоты и ширины спрайта на ось У
	//draw_txt_y = player_obj.y - abs(lengthdir_y((player_obj.sprite_height + player_obj.sprite_width) / 2, player_obj.image_angle));
	//беру максимальный отступ и не парюсь)
	draw_txt_y = player_obj.y - player_obj.sprite_width / 2 - 10;
	draw_text_transformed(draw_txt_x, draw_txt_y, draw_txt, image_xscale, image_yscale, image_angle);
}
