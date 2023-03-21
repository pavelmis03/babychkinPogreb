/// @description 

draw_set_font(fnt_russian);

//если спрайт есть, рисуем его
if (sprite_index != spr_sys_none) {
	draw_sprite(sprite_index, image_index, x, y);
}
//если текст есть, рисуем текст 
if (draw_txt != "") {
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(draw_txt_cl);
	//растягиваю текст под диалог
	var tScale = (sprite_get_width(spr_dlg_bg) - 120) / string_width(draw_txt);
	if (string_width(draw_txt) < string_height(draw_txt)) {
		var tScale = (sprite_get_height(spr_dlg_bg) - 120) / string_height(draw_txt);
	}
	//только по х, потому что это будет меньшим значением, а я должен сохранить пропорцию текста
	draw_text_transformed(draw_txt_x, draw_txt_y, draw_txt, tScale, tScale, 0);
}
