//когда дверь откроется, переходим в другую комнату или меняем ее положение

switch (destination) { //нужно учесть, что когда очередь дойдет до этого события, 
						//destination уже будет изменен в user event 15 на противоположное значение
	case "next_room": 
		image_index = 0;
		image_speed = 0;
		//door_wall.image_angle -= 90;
	break;
	case "pre_room": 
		image_index = image_number - 0.01;
		image_speed = 0;
		//door_wall.image_angle += 90;
	break;
	default:
		image_index = 0;
		image_speed = 0;
		//room_goto(destination);	//если в destination название комнаты
		ds_list_add(obj_ctrl_mv.next_rm_list_, destination);	//говорим, куда мы направимся 
		obj_ctrl_mv.ctrl_mv_rmChangeDelay = 0.1;				//даем время на сохранение
		obj_ctrl_gm_sv.action = "svRm";							//сохраняем комнату
	break;
}


// Inherit the parent event
event_inherited();

