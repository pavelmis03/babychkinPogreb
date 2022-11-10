/// @description конечные действия кнопки


switch (action) {
	//ДИАЛОГОВЫЕ
	case "cansel": 
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	//перейти в предыдущее меню
	case "back": 
		obj_ctrl_mv.action = "goToRmPre";
		obj_ctrl_dlg.ctrl_dlg_del = true;
		obj_ctrl_stat.action = "goBackStatistic";
	break;
	//перейти в предыдущее меню с сохранением настроек
	case "backSaveSettings": 
		obj_ctrl_set.action = "saveSettings";
		obj_ctrl_mv.action = "goToRmPre";
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	//перейти в предыдущее меню без сохранения настроек
	case "backDelSettings": 
		obj_ctrl_set.action = "backDelSettings";
		obj_ctrl_mv.action = "goToRmPre";
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	//сброс до настроек по умолчанию
	case "defaultSettings": 
		obj_ctrl_set.action = "defaultSettings";
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	//просто оповещение
	case "alreadYdefaultSet": 
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	//просто оповещение
	case "noEditor": 
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	case "noEndless": 
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	
	//ГЛАВНОЕ МЕНЮ
	//пока только выход, возможно, понадобится сохранение
	case "exitGm": game_end(); break;
	//перейти в меню загрузки уровня
	case "goToLdGm": 
		room_goto(rm_menu_ldGm);
		obj_ctrl_mv.action = "addRm";
	break;
	//перейти в меню новой игры
	case "goToNewGm": 
		room_goto(rm_menu_newGm); 
		obj_ctrl_mv.action = "addRm";
	break;
	//перейти в меню информации 
	case "goToInfo":
		room_goto(rm_menu_info); 
		obj_ctrl_mv.action = "addRm";
	break;
	//перейти в меню настроек
	case "goToSet": 
		room_goto(rm_menu_settings); 
		obj_ctrl_mv.action = "addRm";
	break;
	//переход в меню редактирования 
	case "goToEditor": 
		room_goto(rm_menu_editor);
		obj_ctrl_mv.action = "addRm";
	break;
	//переход в справку
	case "goToReference": 
		room_goto(rm_menu_reference); 
		obj_ctrl_mv.action = "addRm";
	break;
	//ИНФОРМАЦИЯ
	//меню ,,о разработчиках,,
	case "goToDev&AboutGm": 
		room_goto(rm_menu_dev);
		obj_ctrl_mv.action = "addRm";
	break;
	//меню ,,журнал,,
	case "goToJournal": 
		room_goto(rm_menu_journal);
		obj_ctrl_mv.action = "addRm";
	break;
	//меню ,,статистика,,
	case "goToStatistic": 
		room_goto(rm_menu_stat);
		obj_ctrl_mv.action = "addRm";
		obj_ctrl_stat.action = "goToStatistic";
	break;
	
	//ФУНКЦИОНАЛЬНЫЕ
	//ЗАГРУЗКА ИГРЫ
	//если нет сохранений, начинаем новую игру после диалога
	case "nothingSv": 
		obj_ctrl_mv.action = "addRm";
		obj_ctrl_dlg.ctrl_dlg_del = true;
		scr_newGm(); //скрипт приготовлений к игре
	break;
	//загрузить выбранное сохранени
	case "ldSv": 
		
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	//удалить выбранное сохранение
	case "delSv": 
		
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	//удалить текущую игру
	case "delGm": 
		
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	//Следующее сохранение
	case "nextSv": 
		
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	//предыдущее сохранение
	case "preSv": 
		
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	//следующая игровая сессия 
	case "nextGm": 
		
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	//предыдущая игровая сессия
	case "preGm": 
		
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	//НАСТРОЙКИ
	//сохранение настроек
	case "saveSettings": 
		obj_ctrl_set.action = "saveSettings";
		obj_ctrl_dlg.ctrl_dlg_del = true;
	break;
	//СПРАВКА
	//пролистывание справки
	case "refNextImg": 
		var lay_id = layer_get_id("Background");
		var back_id = layer_background_get_id(lay_id);
		var t_ind = layer_background_get_index(back_id) + 1;
		layer_background_index(back_id, t_ind);
	break;
	case "refPreImg": 
		var lay_id = layer_get_id("Background");
		var back_id = layer_background_get_id(lay_id);
		//var t_num = sprite_get_number(layer_background_get_sprite(lay_id));
		var t_ind = layer_background_get_index(back_id) - 1;
		layer_background_index(back_id, t_ind);
	break;
	//СТАТИСТИКА
	//пролистывание статистики
	case "arrowUp": 
		obj_ctrl_stat.action = "statUp";
	break;
	case "arrowDown": 
		obj_ctrl_stat.action = "statDown";
	break;
	//ЖУРНАЛ
	//открыть меню журнала 
	case "openJournal": 
		obj_ctrl_rmJournal.action = "openJournal";
		instance_destroy();
	break;
	//Перелистнуть страницу раздела в журнале
	case "journalNext": 
		obj_ctrl_rmJournal.action = "journalNext";
	break;
	//Перелистнуть страницу раздела в журнале
	case "journalPre": 
		obj_ctrl_rmJournal.action = "journalPre";
	break;
	//открыть раздел история
	case "journalHistory": 
		obj_ctrl_rmJournal.action = "journalHistory";
	break;
	//открыть раздел квесты
	case "journalQuest": 
		obj_ctrl_rmJournal.action = "journalQuest";
	break;
	//открыть раздел инфа о мобах
	case "journalMonsterInfo": 
		obj_ctrl_rmJournal.action = "journalMonsterInfo";
	break;
	//открыть раздел инфа об оружии
	case "journalWeaponInfo": 
		obj_ctrl_rmJournal.action = "journalWeaponInfo";
	break;
	//открыть раздел достижения
	case "journalAchiv": 
		obj_ctrl_rmJournal.action = "journalAchiv";
	break;
	
	//GAME
	//ПАУЗА
	case "goToMM_pause": 
		obj_ctrl_gm.action = "exitToMM";
		obj_ctrl_dlg.ctrl_dlg_del = true;
		//сам переход происходит в obj_ctrl_gm после всех необходимых действий
	break;
	//НОВАЯ ИГРА
	case "newGm": 
		obj_ctrl_mv.action = "addRm";
		obj_ctrl_dlg.ctrl_dlg_del = true;
		scr_newGm(); //скрипт приготовлений к игре
	break;
	//пропустить просмотр истории (для комнаты истории)
	case "skipHistory": 
		obj_ctrl_rmHistory.action = "skipHistory";
	break;
	//следующее изображение (для комнаты истории)
	case "historyNextImg": 
		obj_ctrl_rmHistory.action = "historyNextImg";
	break;
	//предыдущее изображение (для комнаты истории)
	case "historyPreImg": 
		obj_ctrl_rmHistory.action = "historyPreImg";
	break;
}