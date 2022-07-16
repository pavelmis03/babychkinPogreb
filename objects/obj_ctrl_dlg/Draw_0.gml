/// @description 

draw_set_font(fnt_russian);

//если спрайт есть, рисуем его
if (sprite_index != spr_sys_none) {
	draw_sprite(sprite_index, image_index, x, y);
}
//если текст есть, рисуем текст 
if (draw_txt != "") {
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_set_color(draw_txt_cl);
	draw_text(draw_txt_x, draw_txt_y, draw_txt);
}
