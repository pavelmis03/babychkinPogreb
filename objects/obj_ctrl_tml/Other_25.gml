/// @description выполнение действий

switch (action) {
	//добавление таймеров 
	case "addTml":
		for (var i = 0; i < ds_list_size(ctrl_tml_list); i++) {
			//arr[i] = [что сделать, время]
			var t = ctrl_tml_list[|i];
			//номер свободного таймера
			var tt = ctrl_tml_alarmFree_list[|0]; 
			//назначаю таймеру время, заданное из вне (рандом нужен для того, чтобы таймеры никогда не сработали одновременно)
			alarm[tt] = t[1] * room_speed + random(3);
			//назначаю задействованному таймеру действие, которое он должен будет выполнить 
			ctrl_tml_alarmAction_arr[tt] = t[0];
			//удаляю номер таймера из свободных
			ds_list_delete(ctrl_tml_alarmFree_list, 0);
		}
		ds_list_clear(ctrl_tml_list);
	break;
	case "dlg1_1":
		obj_ctrl_gm.action = "dlg1_1";
	break;
}