/// @description выполнение действий

switch (action) {
	case "change_iss_status":
		// индекс строки с нужной задачей в list`е (находим индекс по id задачи)
		var iss_ind = scr_iss_findIssind(ctrl_iss_id);
		// если задача не была найдена, ничего не делаем
		if (iss_ind != -1) {
			// меняем статус задачи
			ctrl_iss_list_iss[|iss_ind][1]++;
			// если задача только что была получена
			if (ctrl_iss_list_iss[|iss_ind][1] == 1) {
				// записываем в файл journalInfo.ini информацию о добавленных задачах
				var path = obj_ctrl_gm_sv.ctrl_sv_gmDir + "/journalInfo.ini";
				ini_open(path);
				// сохраняем по индексу записи в массиве, а не по id задания
				ini_write_string("quest", iss_ind, ctrl_iss_list_iss[|iss_ind][2]); 
				ini_close();
				// вывод уведомления о том, что получено новое задание
				obj_ctrl_gm_img.action = "newTaskAlert";
			}
			ctrl_iss_id = 0;
		}
	break;
}



