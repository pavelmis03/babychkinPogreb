/// @description выполнение действий

switch (action) {
	//сохрание игры - большой и сложный процесс, поэтому отдельной функцией
	case "svGm":
		//сохраняем текущую комнату перед сохранением всей игры
		scr_sv_svRm(ctrl_sv_svDir);
		event_user(13);
	break;
	//сохранение комнаты при переходе в следующую
	case "svRm":
		scr_sv_svRm(ctrl_sv_svDir);	
	break;
	//загрузка комнаты 
	case "ldRm":
		scr_ctrl_sv_ldRm(ctrl_sv_svDir + "/" + room_get_name(room) + ".txt");
	break;
	//загрузка игры
	case "ldGm":
		event_user(8);
	break;
	//выход в главное меню
	case "exitToMM":
		//очищаем переменные
		ctrl_sv_gmDir = ""; 
		ctrl_sv_ldDir = "";
		ctrl_sv_svDir = "";	
		ctrl_sv_ldRms = [];
		ctrl_sv_ldRmsTmp = [];
	break;
}
