/// @description вывод сообщения о сохранении скриншота

//картинка текста ,,Скриншот сохранен,,
if (draw_caption != 0) {
	draw_sprite(draw_caption, depth - 10000, room_width / 2, draw_caption_y);
	//если тект ушел за пределы экрана
	if (draw_caption_y <= 0) {
		draw_caption = 0;
	}
}