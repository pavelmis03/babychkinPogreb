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
		room_goto(array_last(ctrl_mv_arr_mv));
	break;
	//отправляет нас в меню справки
	case "goToRmRef":
		//чтоб самому себе не назначать action = "addRm";
		array_push(ctrl_mv_arr_mv, rm_menu_reference);
		ds_list_add(next_rm_list_, rm_menu_reference);//говорим, куда мы направимся 
		ctrl_mv_rmChangeDelay = 0.1;			//даем время на сохранение
		obj_ctrl_gm_sv.action = "svRm";		//сохраняем комнату
	break;
	//отправляет нас в меню журнала
	case "goToRmJournal":
		//чтоб самому себе не назначать action = "addRm";
		array_push(ctrl_mv_arr_mv, rm_menu_journal);
		ds_list_add(next_rm_list_, rm_menu_journal);	//говорим, куда мы направимся 
		ctrl_mv_rmChangeDelay = 0.1;			//даем время на сохранение
		obj_ctrl_gm_sv.action = "svRm";		//сохраняем комнату
	break;
	//переход в назнаенную комнату
	//case "addRm":
	//	array_push(ctrl_mv_arr_mv, room);
	//break;
}