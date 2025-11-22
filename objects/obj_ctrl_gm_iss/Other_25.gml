/// @description выполнение действий

switch (action) {
	case "change_iss_status":
		// меняем статус задачи
		ctrl_iss_list_iss[ctrl_iss_id][0]++;
		// если задача только что была получена
		if (ctrl_iss_list_iss[ctrl_iss_id][0] == 1) {
			// записываем в файл journalInfo.ini информацию о добавленных задачах
			var path = obj_ctrl_gm_sv.ctrl_sv_gmDir + "/journalInfo.ini";
			ini_open(path);
			ini_write_string("quest", ctrl_iss_id, ctrl_iss_list_iss[ctrl_iss_id][1]); 
			ini_close();
			// вывод уведомления о том, что получено новое задание
			obj_ctrl_gm_img.action = "newTaskAlert";
		}
		ctrl_iss_id = 0;
	break;
}



