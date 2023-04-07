/// @description выполнение действия action

switch (action) {
	//пропустить историю, закончить просмотр
	case "skipHistory":
		obj_ctrl_mv.action = "addRm";
		//obj_ctrl_gm.ctrl_gm_goDlg = false;
		obj_ctrl_gm.ctrl_gm_histStatus = 0;
		//переходим в следующую комнату в списке
		room_goto(obj_ctrl_mv.next_rm_list_[|ds_list_size(obj_ctrl_mv.next_rm_list_) - 1]);
		ds_list_delete(obj_ctrl_mv.next_rm_list_, ds_list_size(obj_ctrl_mv.next_rm_list_) - 1);
		obj_ctrl_gm_img.action = "delImg";
	break;
	case "historyNextImg":
		if (ctrl_history_page_curr < ctrl_history_page_last) {
			ctrl_history_page_curr++;
		}
		
		//если у нас одна картинка, то кнопки деактивированы
		if (ctrl_history_page_last - ctrl_history_page_first > 0) {
			//т.к. мы пролистнули вперед, теперь можно отлистать назад, поэтому появляется кнопка ,,назад,,
			btn_id2.btn_enable = true;
		}

		//если это последний слайд в серии, удаляем кнопку ,,вперед,,
		if (ctrl_history_page_last == ctrl_history_page_curr) {
			btn_id1.btn_enable = false;
		}
	break;
	case "historyPreImg":
		if (ctrl_history_page_curr > ctrl_history_page_first) {
			ctrl_history_page_curr--;
		}
		
		//если у нас одна картинка, то кнопки деактивированы
		if (ctrl_history_page_last - ctrl_history_page_first > 0) {
			//т.к. мы пролистнули назад, теперь можно отлистать вперед, поэтому появляется кнопка ,,вперед,,
			btn_id1.btn_enable = true;
		}

		//если это первый слайд в серии, удаляем кнопку ,,назад,,
		if (ctrl_history_page_first == ctrl_history_page_curr) {
			btn_id2.btn_enable = false;
		}
	break;
}