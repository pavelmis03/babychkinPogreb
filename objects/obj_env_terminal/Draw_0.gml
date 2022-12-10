/// @description 


draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnt_gm_hint);
draw_set_color(c_gray);

if (hp > 0) {
	if (terminal_saves == -1) {
		draw_text(x, y - sprite_get_height(sprite_index) / 2 - 5, "Памяти хватит\nещё надолго!");
	} else {
		if (terminal_saves > 0) {
			draw_text(x, y - sprite_get_height(sprite_index) / 2 - 5, 
				"Памяти хватит на\n" + string(terminal_saves) + " " + 
				scr_str_defEnding("сохранени", terminal_saves));
		}
	}
}

draw_self();