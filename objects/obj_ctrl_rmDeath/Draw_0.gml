/// @description 

//для смерти в первой и второй частях разные меню 
if (room == rm_menu_deathFP) {
	var s1 = "Признай, ты облажался, и  нажми \"пробел\", чтобы попробовать снова";
	var s2 = "ТЕБЯ ПОИМЕЛИ ПОДРОСТКИ!";
	
	draw_set_halign(fa_center);
	
	draw_set_font(fnt_gm_cmn);
	draw_set_color(c_white);
	draw_text(room_width - string_width(s1) / 2 - 20, room_height - 40, s1);
	
	draw_set_font(fnt_gm_rmDeathFP);
	var t_x = room_width / 2;
	var t_y = room_height / 2;
	//поворачивающийся посередине экрана текст
	//создаю эффект поворота текста по оси у
	txt_angle -= 6 / room_speed * ctrl_rmDeath_multiplier;
	if (txt_angle >= 15 or txt_angle <= -15) {
		ctrl_rmDeath_multiplier *= -1;
	}
	draw_set_color(c_purple);
	draw_text_transformed(t_x, t_y, s2, 1, 1, txt_angle);
} else {
	
}