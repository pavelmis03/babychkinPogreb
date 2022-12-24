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
		obj_ctrl_mv.action = "addRm";
		image_index = 0;
		image_speed = 0;
		room_goto(destination);	//если в destination название комнаты
	break;
}


// Inherit the parent event
event_inherited();

