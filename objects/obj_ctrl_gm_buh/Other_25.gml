/// @description действия 

switch (action) {
	//действия при смене комнаты
	case "changeRm":	
		//проверяем и создаем, удаляем или передвигаем буханку
		if (buh_map_info[?"room"] == room) {	//если в этой комнате должна быть буханка
			if (instance_exists(obj_buh)) {	//если буханка существует
				//проверяем ее координаты	
				obj_buh.x = buh_map_info[?"x"];
				obj_buh.y = buh_map_info[?"y"];
				obj_buh.depth = buh_map_info[?"depth"];
				obj_buh.direction = buh_map_info[?"dir"];
				obj_buh.persistent = false;	//при переходах между комнатами-частями локаций контроллер триггеров делает буханку постоянной для сохранения ее переменных				
			} else {//если не существует, создаем
				obj = instance_create_depth(buh_map_info[?"x"], buh_map_info[?"y"], buh_map_info[?"depth"], obj_buh);
				obj.direction = buh_map_info[?"dir"];
				//настройки, если понадобятся
			}
		} else {	
			if (instance_exists(obj_buh)) { //если не должно быть, а она есть - удаляем
				instance_destroy(obj_buh);
			}
		}
	break;
}
