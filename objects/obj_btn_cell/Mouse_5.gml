/// @description выкладавание по одному предмету в ячейку, если в руке что-то есть
		// или использование предмета

var tid = obj_ctrl_gm_rmInv.cellId;	// id той ячейки, откуда берем инфу
if (btn_enable) {
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
		// если мы можем класть в эту ячейку взятый предмет (или можем класть любой)
		if (((scr_arr_findEl(cell_corrItems, takeInfo[0], 1) != -1)) or (array_length(cell_corrItems) == 0)) {
			// and (((scr_arr_findEl(tid.cell_corrItems, pushInfo[0], 1) != -1)) or (array_length(tid.cell_corrItems) == 0))) {				
			// если текущая ячейка пустая (или та же, из которой мы взяли (у нее тоже cell_obj == "")
			// или это ячейка с таким же предметом
			if ((cell_obj == "") or (takeInfo[0] == cell_obj)) {
				// перенос объектов, если это возможно 
				// получаем количество предметов, которое мы можем положить (максимальное - предметы в этой ячейке)
				var c = tid.inv_maxCntCell - pushInfo[1];
				if ((tid != id) and (c != 0)) {	// если это не ячейка, из которой мы брали и мы можем положить хотя бы один предмет
					scr_inv_pushItemCell(1, takeInfo, tid.cell_owner, cell_owner, tid.cell_numR, tid.cell_numC, cell_numR, cell_numC, tid, id);	// кладем предметы в ячейку
					event_user(3);
				}
			}
		}
	} else {
		scr_inv_useItem(id);	// используем предмет 
	}
}