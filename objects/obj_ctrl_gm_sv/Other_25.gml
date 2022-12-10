/// @description выполнение действий

switch (action) {
	//сохрание игры - большой и сложный процесс, поэтому отдельной функцией
	case "saveGm":
		//event_user(13);
	break;
	//загрузка комнаты 
	case "loadRm":
		//если есть откуда загружать
		if (/*(ctrl_sv_ldDir != "newGm") and*/ (directory_exists(ctrl_sv_gmDir + ctrl_sv_ldDir))) {
			//scr_sv_ldRm(ctrl_sv_gmDir + ctrl_sv_ldDir + room_get_name(room) + "_save.txt"); 
		}
	break;
}
