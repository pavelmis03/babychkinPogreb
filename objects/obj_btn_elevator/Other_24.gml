/// @description конечные действия кнопки

// Inherit the parent event
event_inherited();

switch (action) {
	//просто этаж
	case "goToFloor1": 
		room_goto(rm_gm_fp_floor1);
		obj_ctrl_mv.action = "addRm";
	break;
	//просто этаж
	case "goToFloor2":
		room_goto(rm_gm_fp_floor2);
		obj_ctrl_mv.action = "addRm";
	break;
	//просто этаж
	case "goToFloor3":
		room_goto(rm_gm_fp_floor3);
		obj_ctrl_mv.action = "addRm";
	break;
	//просто этаж
	case "goToFloor4":
		room_goto(rm_gm_fp_floor4);
		obj_ctrl_mv.action = "addRm";
	break;
	//офис Леонида
	case "goToOffice":
		room_goto(rm_gm_fp_office);
		obj_ctrl_mv.action = "addRm";
	break;
	//офис шефа
	case "goToBoss":
		room_goto(rm_gm_fp_bossFloor);
		obj_ctrl_mv.action = "addRm";
	break;
	//холл (первый этаж)
	case "goToHole":
		room_goto(rm_gm_fp_hole);
		obj_ctrl_mv.action = "addRm";
	break;
	//парковка
	case "goToParking":
		room_goto(rm_gm_fp_parking);
		obj_ctrl_mv.action = "addRm";
	break;
	//допросная
	case "goToTorture":
		room_goto(rm_gm_fp_torture);
		obj_ctrl_mv.action = "addRm";
	break;
	//оружейная
	case "goToArmory":
		room_goto(rm_gm_fp_armory);
		obj_ctrl_mv.action = "addRm";
	break;
	case "scaryVoice": 
	
	break;
}
