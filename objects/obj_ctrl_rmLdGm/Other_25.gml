/// @description выполнение действия action


switch (action) {
	//загрузить выбранное сохранени
	case "ldSv": 
		//сообщаем всем, кому нужно, что надо загрузить игру
		obj_ctrl_gm_sv.action = "ldGm";
		obj_ctrl_gm.action = "ldGm";
		//передаем путь для загрузки
		obj_ctrl_gm_sv.ctrl_sv_ldDir = ctrl_ldGm_sv_currPath;	//папка выбранного сохранения
		obj_ctrl_gm_sv.ctrl_sv_gmDir = ctrl_ldGm_gm_currPath;	//папка игры
		//записываем текущую игру, как последнюю, в которую играли,
		//чтобы потом автоматически подставить в меню загрузок
		ini_open("gameInfo.ini");
		ini_write_string("GAMEINFO", "lastGame", ctrl_ldGm_gm_currPath);
		ini_write_string("GAMEINFO", "lastSave", ctrl_ldGm_sv_currPath);
		ini_close();
		action = "";
	break;
	//удалить выбранное сохранение
	case "delSv": 
		//удаляем выбранное сохранение 
		scr_ld_delSv(ctrl_ldGm_sv_currPath);
		action = "selectLoaderBtn";	//обновляем инфо о кнопке в фокусе
	break;
	//удалить текущую игру
	case "delGm": //если игрок согласился с тем, что хочет удалить текущую игру, что ж, его выбор
		//удаляем папку игры
		scr_ld_delGm(ctrl_ldGm_gm_currPath);
		action = "selectLoaderBtn";	//обновляем инфо о кнопке в фокусе
		
		//выбирать другую директорию
		//перезагружать кнопки
		//обновлять количество игр и страниц и т.д.
		//если это была единственная/последняя игра, выводить диалог о начале новой игры
	break;
	//Следующее сохранение
	case "nextSv": 
		if (ctrl_ldGm_sv_curr + 1 < ctrl_ldGm_sv) {
			ctrl_ldGm_sv_curr++;
			//переход на следующую страницу
			if ((ctrl_ldGm_sv_curr + 1) / ctrl_ldGm_svOnPage > ctrl_ldGm_page_curr) {
				ctrl_ldGm_page_curr++;
				//получаю путь следующего сохранения (по сути костыль, чтобы сработало получение btn_loaderId нормально)
				ctrl_ldGm_sv_currPath = ctrl_ldGm_svPaths[ctrl_ldGm_sv_curr];
				//обновляю кнопки
				scr_ld_createLdBtn();
			} else {	//если действия происходят на этой странице
				//беру в фокус следующую кнопку-загрузчик
				btn_loaderNum++;
			}
			//обновляем информацию о сохранении
			action = "selectLoaderBtn";
		}
	break;
	//предыдущее сохранение
	case "preSv": 
		if (ctrl_ldGm_sv_curr + 1 > 1) {
			ctrl_ldGm_sv_curr--;
			//переход на предыдущую страницу
			if ((ctrl_ldGm_sv_curr + 1) / ctrl_ldGm_svOnPage <= ctrl_ldGm_page_curr - 1) {
				//получаю путь следующего сохранения (по сути костыль, чтобы сработало получение btn_loaderId нормально)
				ctrl_ldGm_sv_currPath = ctrl_ldGm_svPaths[ctrl_ldGm_sv_curr];
				ctrl_ldGm_page_curr--;
				//обновляю кнопки
				scr_ld_createLdBtn();
			} else {	//если действия происходят на этой странице
				//беру в фокус предыдущую кнопку-загрузчик
				btn_loaderNum--;
			}
			//обновляем информацию о сохранении
			action = "selectLoaderBtn";
		}
	break;
	//Следующая страница
	case "ldNextPage": 
		if (ctrl_ldGm_page_curr < ctrl_ldGm_page) {
			//изменяю текущее сохранение - первое сохранение на новой странице
			ctrl_ldGm_sv_curr = ctrl_ldGm_page_curr * ctrl_ldGm_svOnPage - 1;
			ctrl_ldGm_page_curr++;
			//получаю путь следующего сохранения (по сути костыль, чтобы сработало получение btn_loaderId нормально)
			ctrl_ldGm_sv_currPath = ctrl_ldGm_svPaths[ctrl_ldGm_sv_curr];
			//обновляю кнопки
			scr_ld_createLdBtn();
		}
		//обновляем информацию о сохранении
		action = "selectLoaderBtn";
	break;
	//предыдущая страница
	case "ldPrePage": 
		if (ctrl_ldGm_page_curr > 1) {
			ctrl_ldGm_page_curr--;
			//изменяю текущее сохранение - последнее сохранение на новой странице
			ctrl_ldGm_sv_curr = ctrl_ldGm_page_curr * ctrl_ldGm_svOnPage - 1;
			//получаю путь следующего сохранения (по сути костыль, чтобы сработало получение btn_loaderId нормально)
			ctrl_ldGm_sv_currPath = ctrl_ldGm_svPaths[ctrl_ldGm_sv_curr];
			//обновляю кнопки
			scr_ld_createLdBtn();
		}
		//обновляем информацию о сохранении
		action = "selectLoaderBtn";
	break;
	//следующая игровая сессия 
	case "nextGm": 
		if (ctrl_ldGm_gm_curr + 1 < ctrl_ldGm_gm) {
			ctrl_ldGm_gm_curr++;
			ctrl_ldGm_svPaths = [];	//обнуляем список сохранений
			//получаю новый путь игры
			ctrl_ldGm_gm_currPath = ctrl_ldGm_gmPaths[ctrl_ldGm_gm_curr];
			//нахожу все папки сохранений в папке игры
			scr_ld_findSvPaths(ctrl_ldGm_gm_currPath);
			//общее количество сохранений
			ctrl_ldGm_sv = array_length(ctrl_ldGm_svPaths);
			ctrl_ldGm_sv_currPath = ctrl_ldGm_svPaths[0]; //путь до первого сохранения
			ctrl_ldGm_page_curr = 1;	//номер страницы (начинаем с начала)
			//количество страниц считаем после того, как посчитали количество сохранений
			ctrl_ldGm_page = ceil(ctrl_ldGm_sv / ctrl_ldGm_svOnPage);

			scr_ld_createLdBtn();	//создание кнопок-загрузчиков
			action = "selectLoaderBtn";
		}
	break;
	//предыдущая игровая сессия
	case "preGm": 
		if (ctrl_ldGm_gm_curr + 1 > 1) {
			ctrl_ldGm_gm_curr--;
			ctrl_ldGm_svPaths = [];	//обнуляем список сохранений
			//получаю новый путь игры
			ctrl_ldGm_gm_currPath = ctrl_ldGm_gmPaths[ctrl_ldGm_gm_curr];
			//нахожу все папки сохранений в папке игры
			scr_ld_findSvPaths(ctrl_ldGm_gm_currPath);
			//общее количество сохранений
			ctrl_ldGm_sv = array_length(ctrl_ldGm_svPaths);
			ctrl_ldGm_sv_currPath = ctrl_ldGm_svPaths[0]; //путь до первого сохранения
			ctrl_ldGm_page_curr = 1;	//номер страницы (начинаем с начала)
			//количество страниц считаем после того, как посчитали количество сохранений
			ctrl_ldGm_page = ceil(ctrl_ldGm_sv / ctrl_ldGm_svOnPage);

			scr_ld_createLdBtn();	//создание кнопок-загрузчиков
			action = "selectLoaderBtn";
		}
	break;
	//выбрано сохранение
	case "selectLoaderBtn": 	
		var tid = btn_loaderId[btn_loaderNum];	//id кнопки в фокусе
		ctrl_ldGm_sv_currPath = tid.btn_infoStruct[$"path"];	//обновляю информацию
		ctrl_ldGm_sv_curr = tid.btn_infoStruct[$"number"];	
		//обновляю скриншот
		sprite_delete(draw_img);	//удаляю старый спрайт и создаю новый
		draw_img = sprite_add(ctrl_ldGm_sv_currPath + "/svScreenShot.png", 1, true, true, 0, 0);
		action = "";
	break;
}