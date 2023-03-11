/// @description вывод надписи об обновлении задания

//картинка текста ,,Задание обновлено,,
if (draw_caption != 0) {	
	var tx = room_width / 2;
	//если игрок существует, вывожу подсказку об обновлении задания над ним, так красивее
	if (scr_player_type() != -1) {
		tx = scr_player_type();
		tx = tx.x;
	}
	
	draw_set_valign(fa_center);
	draw_set_halign(fa_top);
	draw_sprite(draw_caption, depth - 10000, tx, draw_caption_y);
	
	//если текст ушел за пределы экрана
	if (draw_caption_y <= 0) {
		draw_caption = 0;
	}
}


