/// @description поднятие предмета и вложение предмета в ячейку
var tid = obj_ctrl_gm_rmInv.cellId;	// id той ячейки, откуда берем инфу

if (btn_enable) {
	// если на ячейку нажали, она меняет цвет
	cl_subl = cl_sublType;

	if ((tid == -1) and (cell_obj != "")) {	// если в этой ячейке что-то лежит и при этом у нас в руках ничего
		obj_ctrl_gm_rmInv.cellId = id;	// назначаем наш id, чтобы снять предметы из нас
		action = "emptyCell";	// очищаем ячейку
	}

	// если у нас в руках что-то есть
	if (tid != -1) {
		var takeInfo = [];	// получаем информацию о ячейке, из которой мы забрали предмет
		if (tid.cell_owner == "ctrl") {	// если ячейка, из которой берем, относится к инвентарю персонажа
			array_copy(takeInfo, 0, obj_ctrl_gm_rmInv.inv_items[tid.cell_numR][tid.cell_numC], 0, 3);	// имя и количество предметов, которое мы взяли
		} else { // если это ячейка контрагент
			array_copy(takeInfo, 0, obj_ctrl_gm_rmInv.inv_items_other[tid.cell_numR][tid.cell_numC], 0, 3);	// имя и количество предметов, которое мы взяли
		}
		var pushInfo = [];	// получаем информацию о ячейке в которую мы положим предмет
		if (cell_owner == "ctrl") {	// если ячейка, из которой берем, относится к инвентарю персонажа
			array_copy(pushInfo, 0, obj_ctrl_gm_rmInv.inv_items[cell_numR][cell_numC], 0, 3);	// имя и количество предметов, которое мы взяли
		} else { // если это ячейка контрагент
			array_copy(pushInfo, 0, obj_ctrl_gm_rmInv.inv_items_other[cell_numR][cell_numC], 0, 3);	// имя и количество предметов, которое мы взяли
		}
		// если мы можем класть в эту ячейку взятый предмет (или можем класть любой) и (предмет из этой ячейки можно положить в ту, из которой предмет взяли или она пустая)
		if ((((scr_arr_findEl(cell_corrItems, takeInfo[0], 1) != -1)) or (array_length(cell_corrItems) == 0)) and
			(((scr_arr_findEl(tid.cell_corrItems, pushInfo[0], 1) != -1)) or (array_length(tid.cell_corrItems) == 0) or (pushInfo[0] == ""))) {
			// если текущая ячейка пустая (или та же, из которой мы взяли (у нее тоже cell_obj == "")
			// или это ячейка с таким же предметом
			if ((cell_obj == "") or (takeInfo[0] == cell_obj)) {
				
				// получаем количество предметов, которое мы можем положить (максимальное - предметы в этой ячейке)
				var c = tid.inv_maxCntCell - pushInfo[1];
				if (tid == id) {	// если это ячейка, из которой мы брали
					obj_ctrl_gm_rmInv.cellId = -1;
				} else {
					scr_inv_pushItemCell(c, takeInfo, tid.cell_owner, cell_owner, tid.cell_numR, tid.cell_numC, cell_numR, cell_numC, tid, id);	// кладем предметы в ячейку
					
				}
			} else { // если эта ячейка занята другим предметом
				// проверяем, можно ли переместить предмет, если нет, останавливаем все
				// if (scr_inv_checkMoveItem(cnt, owner, row, col)) {
					if (tid.cell_owner == "ctrl") {	// если ячейка, из которой берем, относится к инвентарю персонажа
						// нам нужно поменять их местами (в takeInfo инфа по взятому предмету)
						obj_ctrl_gm_rmInv.inv_items[tid.cell_numR][tid.cell_numC][0] = pushInfo[0];	
						obj_ctrl_gm_rmInv.inv_items[tid.cell_numR][tid.cell_numC][1] = pushInfo[1];	
						array_copy(obj_ctrl_gm_rmInv.inv_items[tid.cell_numR][tid.cell_numC][2], 0, pushInfo[2], 0, array_length(pushInfo[2]));	// назначаем доп. информацию
					} else { // если это ячейка контрагент
						obj_ctrl_gm_rmInv.inv_items_other[tid.cell_numR][tid.cell_numC][0] = pushInfo[0];	
						obj_ctrl_gm_rmInv.inv_items_other[tid.cell_numR][tid.cell_numC][1] = pushInfo[1];	
						array_copy(obj_ctrl_gm_rmInv.inv_items_other[tid.cell_numR][tid.cell_numC][2], 0, pushInfo[2], 0, array_length(pushInfo[2]));	// назначаем доп. информацию
					}
					if (cell_owner == "ctrl") {	// если ячейка, в которую кладем относится к инвентарю персонажа
						obj_ctrl_gm_rmInv.inv_items[cell_numR][cell_numC][0] = takeInfo[0];
						obj_ctrl_gm_rmInv.inv_items[cell_numR][cell_numC][1] = takeInfo[1];
						array_copy(obj_ctrl_gm_rmInv.inv_items[cell_numR][cell_numC][2], 0, takeInfo[2], 0, array_length(takeInfo[2]));	// назначаем доп. информацию
					} else { // если это ячейка контрагент
						obj_ctrl_gm_rmInv.inv_items_other[cell_numR][cell_numC][0] = takeInfo[0];
						obj_ctrl_gm_rmInv.inv_items_other[cell_numR][cell_numC][1] = takeInfo[1];
						array_copy(obj_ctrl_gm_rmInv.inv_items_other[cell_numR][cell_numC][2], 0, takeInfo[2], 0, array_length(takeInfo[2]));	// назначаем доп. информацию
					}
					tid.action = "updateInfo_take";	// обновляем информацию о предмете в руках
				// }
			}
			event_user(3);	// обновляем информацию по предмету
		}
	}
}