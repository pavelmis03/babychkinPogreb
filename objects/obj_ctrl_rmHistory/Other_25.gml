/// @description выполнение действия action

switch (action) {
	//пропустить историю, закончить просмотр
	case "skipHistory":
		obj_ctrl_mv.action = "addRm";
		obj_ctrl_gm.ctrl_gm_goDlg = false;
		obj_ctrl_gm.ctrl_gm_goHistory = false;
		room_goto(obj_ctrl_mv.next_rm);
		//дефолтное значение 
		obj_ctrl_mv.next_rm = rm_menu_mm;
		obj_ctrl_gm_img.action = "delImg";
	break;
	case "historyNextImg":
		if (ctrl_history_page_curr < ctrl_history_page_last) {
			ctrl_history_page_curr++;
		}
	break;
	case "historyPreImg":
		if (ctrl_history_page_curr > ctrl_history_page_first) {
			ctrl_history_page_curr--;
		}
	break;
}