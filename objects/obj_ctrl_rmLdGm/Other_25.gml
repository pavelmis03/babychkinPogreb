/// @description выполнение действия action


switch (action) {
	//загрузить выбранное сохранени
	case "ldSv": 
	
		action = "";	
	break;
	//удалить выбранное сохранение
	case "delSv": 
		
		action = "";
	break;
	//удалить текущую игру
	case "delGm": 
		
		action = "";
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
			ctrl_ldGm_gm_currPath = string_copy(ctrl_ldGm_gm_currPath, 0, string_last_pos("_", ctrl_ldGm_gm_currPath)) + string(ctrl_ldGm_gm_curr);
			ctrl_ldGm_sv_currPath = ctrl_ldGm_gm_currPath + "/save_1";	//путь до первого сохранения
			//нахожу все папки сохранений, считаю количество сохранений
			scr_ld_findSvPaths(ctrl_ldGm_sv_currPath, 1);
			ctrl_ldGm_page_curr = 1;	//номер страницы (начинаем с начала)
			//количество страниц считаем после того, как посчитали количество сохранений
			ctrl_ldGm_page = ceil(ctrl_ldGm_sv / ctrl_ldGm_svOnPage);

			event_user(14);	//создание кнопок-загрузчиков
			action = "selectLoaderBtn";
		}
	break;
	//предыдущая игровая сессия
	case "preGm": 
		if (ctrl_ldGm_gm_curr + 1 > 1) {
			ctrl_ldGm_gm_curr--;
			ctrl_ldGm_svPaths = [];	//обнуляем список сохранений
			//получаю новый путь игры
			ctrl_ldGm_gm_currPath = string_copy(ctrl_ldGm_gm_currPath, 0, string_last_pos("_", ctrl_ldGm_gm_currPath)) + string(ctrl_ldGm_gm_curr);
			ctrl_ldGm_sv_currPath = ctrl_ldGm_gm_currPath + "/save_1";	//путь до первого сохранения
			//нахожу все папки сохранений, считаю количество сохранений
			scr_ld_findSvPaths(ctrl_ldGm_sv_currPath, 1);
			ctrl_ldGm_page_curr = 1;	//номер страницы (начинаем с начала)
			//количество страниц считаем после того, как посчитали количество сохранений
			ctrl_ldGm_page = ceil(ctrl_ldGm_sv / ctrl_ldGm_svOnPage);

			event_user(14);	//создание кнопок-загрузчиков
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