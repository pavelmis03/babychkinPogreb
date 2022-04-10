/// @description выполнение действий

switch (action) {
	case "goToPause":
		room_goto(rm_menu_pause);
		obj_ctrl_mv.action = "addRm";
	break;
}
