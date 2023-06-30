/// @description отображение подсказки, вывод надписи об обновлении задания

/// отображение подсказки

player_obj = scr_player_type();

var view_x = camera_get_view_x(view_camera[0]);
var view_y = camera_get_view_y(view_camera[0]);
var view_w = camera_get_view_width(view_camera[0]);
var view_h = camera_get_view_height(view_camera[0]);

draw_set_font(fnt_gm_hint);
draw_set_color(c_white);
//текст будет рисоваться нижней координатой над играком (не нужно вычитать из У высоту строки)
draw_set_valign(fa_bottom);
draw_set_halign(fa_center);

//если сущестсует перс. текст подсказки не пустой и в настройках подсказки включены
if ((player_obj != -1) and (draw_txt != "") and (obj_ctrl_set.ctrl_set_map_curr[?"hints"]) and (obj_ctrl_gm.ctrl_gm_phase == 1)) {
	if (player_obj.player_buhIn) {	//если перс в буханке, отображать подсказки удабнее снизу
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_txt_x = view_x + view_w * (0.23);
		draw_txt_y = view_y + view_h * (0.75);
		draw_sprite_ext(spr_people_ico_Leonid, 0, draw_txt_x - 60, draw_txt_y - 36, 0.5, 0.5, 0, c_white, 1);
	} else {
		draw_txt_x = player_obj.x;
		//по У отступаю длины проекций высоты и ширины спрайта на ось У
		//draw_txt_y = player_obj.y - abs(lengthdir_y((player_obj.sprite_height + player_obj.sprite_width) / 2, player_obj.image_angle));
		//беру максимальный отступ и не парюсь)
		draw_txt_y = player_obj.y - player_obj.sprite_width / 2 - string_height(draw_txt) - 3;
	}
	draw_text_transformed(draw_txt_x, draw_txt_y, string_hash_to_newline(draw_txt), image_xscale, image_yscale, image_angle);
}