/// @description отображение подсказки

player_obj = scr_player_type();

draw_set_font(fnt_gm_hint);
draw_set_color(c_grey);

if ((player_obj != -1) and (draw_txt != "")) {
	draw_txt_x = player_obj.x - string_width(draw_txt) / 2;
	draw_txt_y = player_obj.y - player_obj.sprite_height / 2 - string_height(draw_txt) / 2 - 20;
	draw_text_transformed(draw_txt_x, draw_txt_y, draw_txt, image_xscale, image_yscale, image_angle);
}
