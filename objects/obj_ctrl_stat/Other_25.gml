/// @description выполнение действий

switch (action) {
	//сигнал на то, что надо поменять привязку к файлу статистики
	//активируется контроллером комнаты загрузок
	case "statchangeGm":
		event_user(14);	//загружаем новую статистику
	break;
	//сохранение статистики
	case "statSvStat":
		event_user(12);	//сохраняем старую статистику
	break;
	//выход из игры, активируется контроллером игры при выходе из игры
	case "exitToMM":
		event_user(12);	//сохраняем старую статистику
		event_user(11);	//обнуление статистики
	break;
	//действия при выходе из меню статистики
	case "goBackStatistic":
		ctrl_stat_menu = false;
	break;
	//действия при входе в меню статистики
	case "goToStatistic":
		ctrl_stat_menu = true;
		//настраиваем вид (он создан в комнате)
		view_wport[0] = room_width;
		view_hport[0] = room_height;
		camera_set_view_size(view_camera[0], room_width, room_height);
		event_user(13);	//обновление массива отрисовки в соответствии со статистикой
		//Сбрасываем все значения, чтобы при очередном входе, статистика была свернута
		for (var i = 0; i < array_length(ctrl_stat_arr_draw); i++) {
			var t2 = ctrl_stat_arr_draw[i];
			ctrl_stat_arr_draw[i] = [t2[0], false, t2[2], t2[3], t2[4]];
		}
		//обнуляем массив кнопок с прошлого посещения, кроме последнего эл-та, т.к. это кнопка назад 
		array_delete(ctrl_stat_arr_btn, 0, array_length(ctrl_stat_arr_btn) - 1);
		event_user(13);	//обновляем массив рисования
	break;
	//общее в разделе компаниии
	case "statCmnCompany":
		scr_stat_changeFlag(0);
	break;
	//статистика по игроку в разделе компаниии
	case "statPlayerCompany":
		scr_stat_changeFlag(10);
	break;
	//статистика по буханка в разделе компаниии
	case "statBuhankaCompany":
		scr_stat_changeFlag(19);
	break;
	//другия статистика в разделе компаниии
	case "statOtherCompany":
		scr_stat_changeFlag(23);
	break;
	//пролистывание статистики
	case "statUp":
		//поднимаем камеру вверх до конца
		var t_y = 0;
		camera_set_view_pos(view_camera[0], 0, t_y);
	break;
	case "statDown":
		//опускаем камеру вниз до конца
		var t_y = room_height - camera_get_view_height(view_camera[0]);
		camera_set_view_pos(view_camera[0], 0, t_y);
	break;
}
