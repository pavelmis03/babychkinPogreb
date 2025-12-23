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
		// удаляю загруженный спрайт
		if (sprite_exists(draw_img)) {
			sprite_delete(draw_img);
		}
		draw_img = spr_sys_none;
	break;	
	// создание пользовательского скрина 
	case "createScreenShot":
		var i = 1;
		// выбираем номер скриншота, проверяя существование файлов 
		while (file_exists("screenshots/ScreenShot" + string(i) + ".png")) {
			i++;
		}
		screen_save("screenshots/ScreenShot" + string(i) + ".png");// всплывающая надпись
		draw_caption = spr_gm_caption_screen;
		draw_caption_y = room_height / 2;
		// движение текста вверх
		alarm[1] = 0.1 * fps;
	break;
	// новая задача добавлена
	case "newTaskAlert": 
		draw_caption = spr_gm_caption_newTask;
		draw_caption_y = room_height / 2;
		// движение текста вверх
		alarm[1] = 0.1 * fps;
	break;
	// задача выполнена
	case "completeTaskAlert": 
		draw_caption = spr_gm_caption_completeTask;
		draw_caption_y = room_height / 2;
		// движение текста вверх
		alarm[1] = 0.1 * fps;
	break;
	// список задач обновлен
	case "changeTaskAlert": 
		draw_caption = spr_gm_caption_changeTask;
		draw_caption_y = room_height / 2;
		// движение текста вверх
		alarm[1] = 0.1 * fps;
	break;
	case "gameSaveAlert": 
		draw_caption = spr_gm_caption_gameSave;
		draw_caption_y = room_height / 2;
		// движение текста вверх
		alarm[1] = 0.1 * fps;
	break;
}
