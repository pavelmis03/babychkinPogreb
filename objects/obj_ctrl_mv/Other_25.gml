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
	//отправляет нас в меню справки
	case "goToRmRef":
		array_push(ctrl_mv_arr_mv, room);
		room_goto(rm_menu_reference);
	break;
	//отправляет нас в меню журнала
	case "goToRmJournal":
		array_push(ctrl_mv_arr_mv, room);
		room_goto(rm_menu_journal);
	break;
	//переход в назнаенную комнату
	//case "addRm":
	//	array_push(ctrl_mv_arr_mv, room);
	//break;
}