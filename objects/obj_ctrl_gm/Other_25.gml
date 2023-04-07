/// @description выполнение действий

switch (action) {
	//начало новой игры
	case "startNewGm":
		alarm[1] = 2 * room_speed;	//время пребывания в комнате псевдо загрузки игры
		ds_list_add(obj_ctrl_mv.next_rm_list_, rm_gm_fp_office);
		ctrl_gm_pixel_time = 3;		//время пребывания в комнате пикселей
		ctrl_gm_histStatus = 1;	//говорим, что после пикселей надо идти в историю 
		ctrl_gm_historyInd = "1_1";	//индекс истории 
		//если это самая первая игра, нужно создать общий файл информации по игре
		if (!file_exists("gameInfo.ini")) {
			ini_open("gameInfo.ini");
			ini_close();
		}
		event_user(13);				//создание контроллеров
	break;
	//загрузка игры
	case "ldGm":
		alarm[1] = 4;	//таймер запуска комнаты пикселей
		//получаем информацию о последней сохраненной комнате 
		//т.к. событие контроллера сохранений происходит раньше, папка фиктивного сохранения 
		//создается раньше, поэтому в ctrl_sv_ldDir хранится путь до фиктивного сохранения, поэтому
		//получаем нужную папку и комнату через родителя фиктивного сохранения
		ini_open(obj_ctrl_gm_sv.ctrl_sv_ldDir + "/saveInfo.ini");
		var tparent = ini_read_string("SAVE_INFO", "parent", "saves/game_0/save_1");
		ini_close();
		//папка загрузки сохранения 
		ini_open(tparent + "/saveInfo.ini");
		//комната, куда надо отправиться
		var tRm = ini_read_string("MAIN", "lastRoom", "rm_gm_fp_office");
		ini_close();
		//и отправляемся в эту комнату после пикселей
		ds_list_add(obj_ctrl_mv.next_rm_list_, asset_get_index(tRm));
		//отправляемся в комнату пикселей
		ctrl_gm_pixel_time = 3;		//время пребывания в комнате пикселей
		ctrl_gm_histStatus = 0;	//история не нужна
		event_user(13);				//создание контроллеров
	break;
	//выход из игры (удаление контроллеров игры и т.д.)
	case "exitToMM":
		//сохранение игры, если нужно
		event_user(12);	//действия при выходе из игры в главное меню
	break;
	//диалоги
	//вызывается из контроллера триггеров
	case "dlg1_1":	//диалог ,,Леня зайди,,
		scr_gm_goToDlgRm(rm_gm_fp_office, 2);
	break;
	//вызывается из контроллера триггеров
	case "dlg1_2":  //диалог ,,ну, открывай,,
		scr_gm_goToDlgRm(rm_gm_fp_office, 2);
	break;
	//вызывается из контроллера триггеров
	case "dlg1_3":
		scr_gm_goToDlgRm(rm_gm_fp_bossFloor, 2);
	break;
	//действия при смерти игрока в первой части 
	case "player_death_FP":
		alarm[1] = 2 * room_speed;	//время на проигрывание спрайта смерти
		//сохраняем комнату, куда нас отправит контроллер истории после просмотра истории
		ds_list_add(obj_ctrl_mv.next_rm_list_, rm_menu_deathFP); 
		ctrl_gm_histStatus = 0;	//говорим, что после пикселей не надо идти в историю 
		//ctrl_gm_goDlg = false;		//никаких дилогов тоже не будет
		ctrl_gm_pixel_time = 3;//время пребывания в комнате пикселей 
	break;
	/*
	//отправиться в комнату пикселей
	case "goTo_rmPixel":
		alarm[1] = 0.05 * room_speed;	//время на загрузку пикселей
		ds_list_add(obj_ctrl_mv.next_rm_list_, room); //после возвращаемся в текущую комнату
		ctrl_gm_histStatus = 0;	//говорим, что после пикселей не надо идти в историю 
		ctrl_gm_goDlg = false;		//никаких дилогов тоже не будет
		ctrl_gm_pixel_time = 3;//время пребывания в комнате пикселей 
	break;
	*/
}
