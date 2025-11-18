/// @description конечные действия кнопки


switch (action) {
	// ДИАЛОГОВЫЕ
	case "cansel": 
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	// перейти в предыдущее меню
	case "back": 
		obj_ctrl_mv.action = "goToRmPre";
		obj_ctrl_dlg.ctrl_dlg_del = true;
		obj_ctrl_stat.action = "goBackStatistic";
	break;
	// перейти в предыдущее меню с сохранением настроек
	case "backSaveSettings": 
		obj_ctrl_set.action = "saveSettings";
		obj_ctrl_mv.action = "goToRmPre";
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	// перейти в предыдущее меню без сохранения настроек
	case "backDelSettings": 
		obj_ctrl_set.action = "backDelSettings";
		obj_ctrl_mv.action = "goToRmPre";
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	// сброс до настроек по умолчанию
	case "defaultSettings": 
		obj_ctrl_set.action = "defaultSettings";
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	// оповещение о том, что настройки уже равны настройкам по умолчанию
	case "alreadYdefaultSet": 
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	// оповещение, что редктор карт пока не доступен
	case "noEditor": 
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	// оповещение, что режим бесконечной игры пока недоступен
	case "noEndless": 
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	
	// ГЛАВНОЕ МЕНЮ
	// пока только выход, возможно, понадобится сохранение
	case "exitGm": 
		game_end(); 
	break;
	// перейти в меню загрузки уровня
	case "goToLdGm": 
		room_goto(rm_menu_ldGm);
		obj_ctrl_mv.action = "addRm";
	break;
	// перейти в меню новой игры
	case "goToNewGm": 
		room_goto(rm_menu_newGm); 
		obj_ctrl_mv.action = "addRm";
	break;
	// перейти в меню информации 
	case "goToInfo":
		room_goto(rm_menu_info); 
		obj_ctrl_mv.action = "addRm";
	break;
	// перейти в меню настроек
	case "goToSet": 
		room_goto(rm_menu_settings); 
		obj_ctrl_mv.action = "addRm";
	break;
	// переход в меню редактирования 
	case "goToEditor": 
		room_goto(rm_menu_editor);
		obj_ctrl_mv.action = "addRm";
	break;
	// переход в справку
	case "goToReference": 
		room_goto(rm_menu_reference); 
		obj_ctrl_mv.action = "addRm";
	break;
	// ИНФОРМАЦИЯ
	// меню ,,о разработчиках,,
	case "goToDev&AboutGm": 
		room_goto(rm_menu_dev);
		obj_ctrl_mv.action = "addRm";
	break;
	// меню ,,журнал,,
	case "goToJournal": 
		room_goto(rm_menu_journal);
		obj_ctrl_mv.action = "addRm";
	break;
	// меню ,,статистика,,
	case "goToStatistic": 
		room_goto(rm_menu_stat);
		obj_ctrl_mv.action = "addRm";
		obj_ctrl_stat.action = "goToStatistic";
	break;
	
	// ФУНКЦИОНАЛЬНЫЕ
	// ЗАГРУЗКА ИГРЫ
	// если нет сохранений, начинаем новую игру после диалога
	case "nothingSv": 
		obj_ctrl_mv.action = "addRm";
		obj_ctrl_dlg.ctrl_dlg_del = true;
		scr_newGm(); // скрипт приготовлений к игре
	break;
	// загрузить выбранное сохранение
	case "ldSv": 
		obj_ctrl_rmLdGm.action = "ldSv";
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	// удалить выбранное сохранение
	case "delSv": 
		obj_ctrl_rmLdGm.action = "delSv";
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	// удалить выбранное сохранение (если найдены ветви). по сути делает сути то же, что и delSv
	case "delSv1": 
		obj_ctrl_rmLdGm.action = "delSv";
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	// удалить текущую игру
	case "delGm": 
		obj_ctrl_rmLdGm.action = "delGm";
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	// Следующее сохранение
	case "nextSv": 
		obj_ctrl_rmLdGm.action = "nextSv";
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	// предыдущее сохранение
	case "preSv": 
		obj_ctrl_rmLdGm.action = "preSv";
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	// следующая страница сохранений
	case "ldNextPage": 
		obj_ctrl_rmLdGm.action = "ldNextPage";
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	// предыдущая страница сохранений
	case "ldPrePage": 
		obj_ctrl_rmLdGm.action = "ldPrePage";
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	// следующая игровая сессия 
	case "nextGm": 
		obj_ctrl_rmLdGm.action = "nextGm";
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	// предыдущая игровая сессия
	case "preGm": 
		obj_ctrl_rmLdGm.action = "preGm";
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	// выбрать текущее сохранение
	case "selectLoaderBtn": 
		obj_ctrl_rmLdGm.action = "selectLoaderBtn";
		// передаю номер, под которым хранится мой id в массиве id кнопок (костыль)
		obj_ctrl_rmLdGm.btn_loaderNum = scr_arr_findEl(obj_ctrl_rmLdGm.btn_loaderId, id, 1);
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	// НАСТРОЙКИ
	// сохранение настроек
	case "saveSettings": 
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	// СПРАВКА
	// пролистывание справки
	case "refNextImg": 
		var lay_id = layer_get_id("Background");
		var back_id = layer_background_get_id(lay_id);
		var t_ind = layer_background_get_index(back_id) + 1;
		layer_background_index(back_id, t_ind);
	break;
	case "refPreImg": 
		var lay_id = layer_get_id("Background");
		var back_id = layer_background_get_id(lay_id);
		// var t_num = sprite_get_number(layer_background_get_sprite(lay_id));
		var t_ind = layer_background_get_index(back_id) - 1;
		layer_background_index(back_id, t_ind);
	break;
	// СТАТИСТИКА
	// пролистывание статистики
	case "arrowUp": 
		obj_ctrl_stat.action = "statUp";
	break;
	case "arrowDown": 
		obj_ctrl_stat.action = "statDown";
	break;
	// ЖУРНАЛ
	// открыть меню журнала 
	case "openJournal": 
		obj_ctrl_rmJournal.action = "openJournal";
		instance_destroy();
	break;
	// Перелистнуть страницу раздела в журнале
	case "journalNext": 
		obj_ctrl_rmJournal.action = "journalNext";
	break;
	// Перелистнуть страницу раздела в журнале
	case "journalPre": 
		obj_ctrl_rmJournal.action = "journalPre";
	break;
	// открыть раздел история
	case "journalHistory": 
		obj_ctrl_rmJournal.action = "journalHistory";
	break;
	// открыть раздел квесты
	case "journalQuest": 
		obj_ctrl_rmJournal.action = "journalQuest";
	break;
	// открыть раздел инфа о мобах
	case "journalMonsterInfo": 
		obj_ctrl_rmJournal.action = "journalMonsterInfo";
	break;
	// открыть раздел инфа об оружии
	case "journalWeaponInfo": 
		obj_ctrl_rmJournal.action = "journalWeaponInfo";
	break;
	// открыть раздел достижения
	case "journalAchiv": 
		obj_ctrl_rmJournal.action = "journalAchiv";
	break;
	
	// GAME
	// ПАУЗА
	case "goToMM_pause": 
		obj_ctrl_gm.action = "exitToMM";
		obj_ctrl_dlg.ctrl_dlg_del = true;
		// сам переход происходит в obj_ctrl_gm после всех необходимых действий
	break;
	// НОВАЯ ИГРА
	case "newGm": 
		obj_ctrl_mv.action = "addRm";
		obj_ctrl_dlg.ctrl_dlg_del = true;
		scr_newGm(); // скрипт приготовлений к игре
	break;
	// если невозможно начать новую игру, просто удаляем диалог
	case "newGmErr": 
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	// пропустить просмотр истории (для комнаты истории)
	case "skipHistory": 
		obj_ctrl_rmHistory.action = "skipHistory";
	break;
	// следующее изображение (для комнаты истории)
	case "historyNextImg": 
		obj_ctrl_rmHistory.action = "historyNextImg";
	break;
	// предыдущее изображение (для комнаты истории)
	case "historyPreImg": 
		obj_ctrl_rmHistory.action = "historyPreImg";
	break;
	// ИНВЕНТАРЬ
	// удаление всех предметов из ячейки-контрагента
	case "invDelCell_other": 
		obj_ctrl_gm_rmInv.action = "invDelCell_other";
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	// удаление всех предметов из ячейки
	case "invDelCell": 
		obj_ctrl_gm_rmInv.action = "invDelCell";
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	// оповещение о том, что сюжетные предметы нельзя удалять
	case "invPlotItem": 
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	// использование предмета в фокусе
	case "invUseItem": 
		var tid = obj_ctrl_gm_rmInv;
		if (!tid.mouseXSide) {	// использовать можно только предметы инвентаря обычного
				// поэтому проверяем, что курсор слева
			var cellId = tid.cells[(tid.row % tid.maxRow) * tid.maxCol + tid.col];
			scr_inv_useItem(cellId);	// используем предмет в фокусе
		}
	break;
	// удалить предметы из ячейки
	case "invDelCellBtn": 
		obj_ctrl_gm_rmInv.action = "invCheckDelCell";
	break;
	// следующая страница нашего инвентаря
	case "invNextPage": 
		obj_ctrl_gm_rmInv.action = "invNextPage";
	break;
	// предыдущая страница нашего инвентаря
	case "invPrePage": 
		obj_ctrl_gm_rmInv.action = "invPrePage";
	break;
	// следующая страница инвентаря модернизации буханки
	// case "invNextPageBuhUpgrade": 
	// 	obj_ctrl_gm_rmInv.action = "invNextPageBuhUpgrade";
	// break;
	//// предыдущая страница инвентаря модернизации буханки
	// case "invPrePageBuhUpgrade": 
	// 	obj_ctrl_gm_rmInv.action = "invPrePageBuhUpgrade";
	// break;
	// следующая страница инвентаря буханки
	case "invNextPageBuh": 
		obj_ctrl_gm_rmInv.action = "invNextPageBuh";
	break;
	// предыдущая страница инвентаря буханки
	case "invPrePageBuh": 
		obj_ctrl_gm_rmInv.action = "invPrePageBuh";
	break;
	// следующая страница инвентаря крафта 
	// case "invNextPageCraft": 
	// 	obj_ctrl_gm_rmInv.action = "invNextPageCraft";
	// break;
	//// предыдущая страница инвентаря крафта 
	// case "invPrePageCraft": 
	// 	obj_ctrl_gm_rmInv.action = "invPrePageCraft";
	// break;
	// следующая страница инвентаря продавца
	case "invNextPageSeller": 
		obj_ctrl_gm_rmInv.action = "invNextPageSeller";
	break;
	// предыдущая страница инвентаря продавца
	case "invPrePageSeller": 
		obj_ctrl_gm_rmInv.action = "invPrePageSeller";
	break;
	// следующая страница инвентаря коробки
	case "invNextPageBox": 
		obj_ctrl_gm_rmInv.action = "invNextPageBox";
	break;
	// предыдущая страница инвентаря коробки
	case "invPrePageBox": 
		obj_ctrl_gm_rmInv.action = "invPrePageBox";
	break;
	// взять все предметы из инвентаря-контрагента
	case "invTakeAll":
		obj_ctrl_gm_rmInv.action = "invTakeAll";
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	// положить все предметы в инвентарь-контрагент
	case "invPutAll":
		obj_ctrl_gm_rmInv.action = "invPutAll";
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
}