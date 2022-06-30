/// @description выполнение действий

switch (action) {
	case "createTempScreenShot":
		screen_save("tempScreenShot.png");
		cursor_sprite = spr_sys_gm_cursor;
	break;
	case "drawTempScreenShot":
		draw_img = sprite_add("tempScreenShot.png", 1, true, true, 0, 0);
	break;
	case "delImg":
		draw_img = spr_sys_none;
	break;
	//создание пользовательского скрина 
	case "createScreenShot":
		var i = 1;
		//выбираем номер скриншота, проверяя существование файлов 
		while (file_exists("screenshots//ScreenShot" + string(i) + ".png")) {
			i++;
		}
		screen_save("screenshots//ScreenShot" + string(i) + ".png");
		draw_caption = spr_gm_caption_screen;
		draw_caption_y = room_height / 2;
		//обнуление текста
		alarm[0] = 2 * room_speed;
		//движение текста вверх
		alarm[1] = 0.1 * room_speed;
	break;
}
