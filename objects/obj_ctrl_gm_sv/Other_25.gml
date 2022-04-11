/// @description выполнение действий

switch (action) {
	//сохрание игры - большой и сложный процесс, поэтому отделььной функцией
	case "saveGm":
		event_user(13);
	break;
	//загрузка комнаты 
	case "loadRm":
		scr_sv_ldRm(ctrl_sv_gmDir + room_get_name(room) + "_save.txt");
	break;
}
