/// @description выполнение действий

switch (action) {
	case "change_iss_status":
		ctrl_iss_list_iss[ctrl_iss_id][0]++;
		if (ctrl_iss_list_iss[ctrl_iss_id][0] == 1) {
			obj_ctrl_gm_hint.action = "newTask";	
		}
		ctrl_iss_id = 0;
	break;
}
