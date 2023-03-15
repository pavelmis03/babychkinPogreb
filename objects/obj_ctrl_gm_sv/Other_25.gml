/// @description выполнение действий

switch (action) {
	//сохрание игры - большой и сложный процесс, поэтому отдельной функцией
	case "saveGm":
		//сохраняем текущую комнату перед сохранением всей игры
		scr_sv_svRm(ctrl_sv_svDir);
		event_user(13);
	break;
	//сохранение комнаты при переходе в следующую
	case "saveRoom":
		scr_sv_svRm(ctrl_sv_svDir);	
	break;
	//загрузка комнаты 
	case "loadRm":
	/*
		//если есть откуда загружать
		if (
		//(ctrl_sv_ldDir != "newGm") and
		(directory_exists(ctrl_sv_gmDir + ctrl_sv_ldDir))) {
			//scr_sv_ldRm(ctrl_sv_gmDir + ctrl_sv_ldDir + room_get_name(room) + "_save.txt"); 
		}
	*/
	break;
}
