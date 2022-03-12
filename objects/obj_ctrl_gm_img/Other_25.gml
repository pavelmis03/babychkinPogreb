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
		while (file_exists("screenshots//ScreenShot" + string(i) + ".png")) {
			i++;
		}
		screen_save("screenshots//ScreenShot" + string(i) + ".png");
	break;
}
