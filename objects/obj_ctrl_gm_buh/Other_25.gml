/// @description действия 

switch (action) {
	// действия при смене комнаты
	case "changeRm":	
		// проверяем и создаем, удаляем или передвигаем буханку
		if (buh_map_info[?"room"] == room) {	// если в этой комнате должна быть буханка
			if (instance_exists(obj_buh)) {	// если буханка существует
				// проверяем ее координаты	
				obj_buh.x = buh_map_info[?"x"];
				obj_buh.y = buh_map_info[?"y"];
				obj_buh.depth = buh_map_info[?"depth"];
				obj_buh.direction = buh_map_info[?"dir"];
				obj_buh.persistent = false;	// при переходах между комнатами-частями локаций контроллер триггеров делает буханку постоянной для сохранения ее переменных				
			} else {// если не существует, создаем
				obj = instance_create_depth(buh_map_info[?"x"], buh_map_info[?"y"], buh_map_info[?"depth"], obj_buh);
				obj.direction = buh_map_info[?"dir"];
				// настройки, если понадобятся
			}
		} else {	
			if (instance_exists(obj_buh)) { // если не должно быть, а она есть - удаляем
				instance_destroy(obj_buh);
			}
		}
		action = "";
	break;
	// переход в инвентарь
	case "goToInv":
		room_goto(rm_menu_inv);
		obj_ctrl_mv.action = "addRm";
		action = "";
	break;
	// переход из инвентаря
	case "goBackInv":
		obj_ctrl_mv.action = "goToRmPre";
		action = "afterLeaveInv";	// действия после выхода из инвентаря
	break;
	// действия после выхода из инвентаря
	case "afterLeaveInv":
		// проигрываем спрайт игрока в обратном направлении 
		obj_buh.sprite_index = spr_playerFP_openInv;	
		obj_buh.image_speed = -1;
		obj_buh.image_index = obj_buh.image_number - 0.1;
		action = "";
	break;
}
