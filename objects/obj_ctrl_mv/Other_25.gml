/// @description событие выполнения action


switch (action) {
	//добавляет комнату в список комнат
	case "addRm":
		array_push(ctrl_mv_arr_mv, room);
	break;
	//удаляет комнату
	case "delRm":
		array_pop(ctrl_mv_arr_mv);
	break;
	//отправляет нас в предыдущую по списку комнату и удаляет последнюю 
	case "goToRmPre":
		array_pop(ctrl_mv_arr_mv);
		room_goto(ctrl_mv_arr_mv[array_length(ctrl_mv_arr_mv) - 1]);
	break;
}