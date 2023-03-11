/// @description выполнение действия action


switch (action) {
	//загрузить выбранное сохранени
	case "ldSv": 
		
	break;
	//удалить выбранное сохранение
	case "delSv": 
		
	break;
	//удалить текущую игру
	case "delGm": 
		
	break;
	//Следующее сохранение
	case "nextSv": 
		if (ctrl_ldGm_sv_curr < ctrl_ldGm_sv) {
			ctrl_ldGm_sv_curr++;
			if (ctrl_ldGm_sv_curr / ctrl_ldGm_svOnPage > ctrl_ldGm_page_curr) {
				ctrl_ldGm_page_curr++;
			}
		}
		action = "nextPage";
	break;
	//предыдущее сохранение
	case "preSv": 
		if (ctrl_ldGm_sv_curr > 1) {
			ctrl_ldGm_sv_curr--;
			if (ctrl_ldGm_sv_curr / ctrl_ldGm_svOnPage < ctrl_ldGm_page_curr) {
				ctrl_ldGm_page_curr--;
			}
		}
		action = "prePage";
	break;
	case "nextPage":
	
	break;
	case "prePage":
	
	break;
	//следующая игровая сессия 
	case "nextGm": 
		if (ctrl_ldGm_gm_curr < ctrl_ldGm_gm) {
			ctrl_ldGm_gm_curr++;
		}
		
	break;
	//предыдущая игровая сессия
	case "preGm": 
		if (ctrl_ldGm_gm_curr > 1) {
			ctrl_ldGm_gm_curr--;
		}
		
	break;
}