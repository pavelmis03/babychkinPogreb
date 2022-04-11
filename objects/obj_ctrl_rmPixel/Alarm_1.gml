/// @description добавление пикселей на экран, удаление и выход из комнаты по завершении работы

//сколько клеток нужно добавлять за раз, чтобы уложиться в указанное времмя
var kol = round(ctrl_pixelRm_row * ctrl_pixelRm_col / (time * 10));
for (var i = 0; i < kol; i++) {
	//пока все ячейки не будут созданы/удалены
	if (ds_list_size(ctrl_pixelRm_list_free) > 0) {
		//выбираем номер ячейки для заполнения
		var t = ctrl_pixelRm_list_free[|ds_list_size(ctrl_pixelRm_list_free) - 1];
		//если экран заполняется, а не очищается
		if (!ctrl_pixelRm_full) {
			//назначаем ей цвет, помним, что free - линейный, cl - двумерный
			ctrl_pixelRm_arr_cl[t div ctrl_pixelRm_col, t mod ctrl_pixelRm_col] = irandom_range(1, 255);
		} else {
			ctrl_pixelRm_arr_cl[t div ctrl_pixelRm_col, t mod ctrl_pixelRm_col] = -1;
		}
		//удаляем ячейку из свободных
		ds_list_delete(ctrl_pixelRm_list_free, ds_list_size(ctrl_pixelRm_list_free) - 1);
	} else { //если мы только что заполнили весь экран, начинаем его опустошать, причем в два раза быстрее
		if (!ctrl_pixelRm_full) {
			ctrl_pixelRm_full = true;
			time = time / 3;
			//пересоздаем массив свободных мест 
			for (var i = 0; i < ctrl_pixelRm_row; i++) {
				for (var j = 0; j < ctrl_pixelRm_col; j++) {
					ds_list_add(ctrl_pixelRm_list_free, i * ctrl_pixelRm_col + j);
				}
			}
			//перемешиваем значения
			ds_list_shuffle(ctrl_pixelRm_list_free);
		} else { //если экран был заполнен, а потом очищен, уходим из комнаты в ту которая должна быть после загрузки
			obj_ctrl_mv.action = "addRm";
			//проверка особого флага в контроллере игры на то, что после пикселей надо зайти в историю, прежде, чем идти сразу в комнату
			if (obj_ctrl_gm.ctrl_gm_goHistory) { 
				room_goto(rm_menu_history);
			} else {
				//переходим в следующую комнату в списке
				room_goto(obj_ctrl_mv.next_rm[|0]);
				ds_list_delete(obj_ctrl_mv.next_rm, 0);
			}
			break;
		}
	}
}

//перезапускаем таймер 
alarm[1] = 0.1 * room_speed;
