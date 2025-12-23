/// @description выполнение действий

switch (action) {
	// изменяет статус переданных задач
	case "change_iss_status":
		// проходим по массиву выданных/сделанных задач
		for (var i = 0; i < array_length(ctrl_iss_arr_id); i++) {
			// индекс строки с нужной задачей в list`е (находим индекс по id задачи)
			var iss_ind = scr_iss_findIssInd(ctrl_iss_arr_id[i]);
			// если задача не была найдена, ничего не делаем
			if (iss_ind != -1) {
				// меняем статус задачи
				ctrl_iss_list_iss[|iss_ind][1]++;
				// если задача только что была получена
				if (ctrl_iss_list_iss[|iss_ind][1] == 1) {
					// вывод уведомления о том, что получено новое задание
					obj_ctrl_gm_img.action = "newTaskAlert";
				}
				// если задача только что была выполнена
				if (ctrl_iss_list_iss[|iss_ind][1] == 2) {
					// если задача закрыта, меняем ей заголовок, чтобы об этом узна журнал
					ctrl_iss_list_iss[|iss_ind][2] = string_replace(ctrl_iss_list_iss[|iss_ind][2], "O", "C");
					// только если нет уведомления, что получено новое, это важнее
					if (obj_ctrl_gm_img.action == "") {
						// вывод уведомления о том, что получено задание выполнено
						obj_ctrl_gm_img.action = "completeTaskAlert";
					} else { // если надо о нескольких действиях сообщить
						obj_ctrl_gm_img.action = "changeTaskAlert";
					}
				}
				
				// записываем в файл journalInfo.ini информацию о добавленных или выполненных задачах
				var path = obj_ctrl_gm_sv.ctrl_sv_gmDir + "/journalInfo.ini";
				ini_open(path);
				// сохраняем по индексу записи в массиве, а не по id задания (+ 1, потому что 0 - это заголовок в журнале)
				ini_write_string("quest", iss_ind + 1, ctrl_iss_list_iss[|iss_ind][2]); 
				ini_close();
			}
		}
		// сбрасываем массив
		ctrl_iss_arr_id = [];
	break;
}



