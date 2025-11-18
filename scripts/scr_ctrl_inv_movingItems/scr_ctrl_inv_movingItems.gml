/*
	// скрипт вкладывания предмета в ячейку
	// перемещение предмета/ячейки
	// перемещение всех предметов 
*/

/// @function scr_inv_pushItemCell(c, itemInfo, towner, powner, trow, tcol, prow, pcol, tid, pid);
/// @param {} c - количество предметов
/// @param {} itemInfo - информация о ячейке ["name", cnt, [доп инфо о предмете]], из которой кладем
/// @param {} towner - владелец ячейки, откуда берем предметы
/// @param {} powner - владелец ячейки, куда кладем
/// @param {} trow - строка ячейки, откуда берем предметы
/// @param {} tcol - столбец ячейки, откуда берем предметы
/// @param {} prow - строка ячейки, куда кладем
/// @param {} pcol - столбец ячейки, куда кладем
/// @param {} tid - id ячейки, откуда берем предметы
/// @param {} pid - id ячейки, куда кладем
/// @description кладет в ячейку столько предметов, сколько возможно из ячейки, из которой предметы были взяты в руки
function scr_inv_pushItemCell(c, itemInfo, towner, powner, trow, tcol, prow, pcol, tid, pid) {
	var addCnt = 0, ost = 0;	// сколько предметов положили, остаток в ячейке, откуда брали
	// проверяем, можно ли переместить предмет, если нет, останавливаем все
	if (!scr_inv_checkMoveItem(itemInfo[1], towner, powner, trow, tcol, prow, pcol)) {
		// если нельзя поместить такое количество предмето
		if (itemInfo[1] > 1) {
			// пробуем поместить на один меньше
			itemInfo[1] -= 1;
			return scr_inv_pushItemCell(c, itemInfo, towner, powner, trow, tcol, prow, pcol, tid, pid)
		} else { // если даже один не поместился
			// и заканчиваем скрипт
			return 0;
		}
	}
	addCnt = clamp(itemInfo[1], 0, c);	// сколько мы можем положить предметов
	if (powner == "ctrl") {	// если ячейка, в которую кладем относится к инвентарю персонажа
		// докладываем столько предметов, сколько можем поместить в выбранную ячейку
		// -= и += почему-то в этих случаях не работают (баги движка)
		obj_ctrl_gm_rmInv.inv_items[prow][pcol][1] = obj_ctrl_gm_rmInv.inv_items[prow][pcol][1] + addCnt;	// назначаем имя объекта ячейке
	} else { // если это ячейка контрагент
		obj_ctrl_gm_rmInv.inv_items_other[prow][pcol][1] = obj_ctrl_gm_rmInv.inv_items_other[prow][pcol][1] + addCnt;	// назначаем имя объекта ячейке
	}
	if (towner == "ctrl") {	// если ячейка, из которой берем относится к инвентарю персонажа
		ost = obj_ctrl_gm_rmInv.inv_items[trow][tcol][1];	// чтобы потом посчитать, сколько осталось
		// убираем из ячейки, откуда перекладываем столько, сколько взяли
		obj_ctrl_gm_rmInv.inv_items[trow][tcol][1] = ost - addCnt;	
	} else { // если это ячейка контрагент
		ost = obj_ctrl_gm_rmInv.inv_items_other[trow][tcol][1];	// чтобы потом посчитать, сколько осталось
		// убираем из ячейки, откуда перекладываем столько, сколько взяли 
		obj_ctrl_gm_rmInv.inv_items_other[trow][tcol][1] = obj_ctrl_gm_rmInv.inv_items_other[trow][tcol][1] - addCnt;	
	}
	if (c > 0) {	// если мы что-то отдали
		if (powner == "ctrl") {	// если ячейка, в которую кладем относится к инвентарю персонажа
			obj_ctrl_gm_rmInv.inv_items[prow][pcol][0] = itemInfo[0];	// назначаем объект ячейке в массиве
			array_copy(obj_ctrl_gm_rmInv.inv_items[prow][pcol][2], 0, itemInfo[2], 0, array_length(itemInfo[2]));	// назначаем доп. информацию
		} else { // если это ячейка контрагент
			obj_ctrl_gm_rmInv.inv_items_other[prow][pcol][0] = itemInfo[0];	// назначаем объект ячейке в массиве
			array_copy(obj_ctrl_gm_rmInv.inv_items_other[prow][pcol][2], 0, itemInfo[2], 0, array_length(itemInfo[2]));	// назначаем доп. информацию
		}
		if (tid != -1) {	// если ячейка существует
			tid.action = "updateInfo_take";	// обновляем информацию о предмете в руках
		}
		if (pid != -1) {	// если ячейка существует
			pid.action = "updateInfo";	// обновляем информацию о ячейке, куда мы положили предмет
		}
	}
	if (ost - addCnt <= 0) {	// если предметы в ячейке, откуда брали, закончились
		if (tid != -1) {	// если ячейка существует
			tid.action = "clearCell";	// полностью очищаем информацию
		} else {	// если ячейки не сущеуствует, очищаем область инвентаря вручную
			scr_inv_clearCell(trow, tcol, towner);
		}
		// если мы перемещали из той ячейки, которая и в руках (может быть перемещение с помощью
			// кнопки use, при этом в руках может быть другой предмет, тогда оставляем его в руках)
		if (tid == obj_ctrl_gm_rmInv.cellId) {	
			obj_ctrl_gm_rmInv.cellId = -1;
		}
	}
	return itemInfo[1];	// возвращаем, сколько предметов мы смогли положить
}

/// @function scr_inv_moveItem(cnt, owner, row, col));
/// @param {} cnt - количество предметов
/// @param {} owner - куда перемещаем: инвентарь или контрагент
/// @param {} row - строка перемещаемой ячейки
/// @param {} col - столбец перемещаемой ячейки
/// @description перемещает указанное количество предметов из ячейки одного инвентаря в другой, вызывается из ККИ
function scr_inv_moveItem(cnt, owner, row, col) {
	var ctrl = obj_ctrl_gm_inv, tryPushItems = 0;	// количество попыток переместить предмет (проверка, что были подходящие ячейки)
	// перемещаемая ячейка в фокусе
	// var l1 = array_length(inv_items_other);
	var l2 = array_length(inv_items_other[0]);
	var cellI, cellO, str, tarr, moveItems = 0;	// id ячеек, количество перемещенных предметов
	
	if (owner == "ctrl") {	// если перемещаем в инвентарь  
		str = "take";
		for (var i = 0; i < array_length(inv_items); i++) {	
			for (var j = 0; j < array_length(inv_items[i]); j++) {	
				// var t = ... с рюкзаком нет таких проблем
				if (scr_var_inRange((i % maxRow) * maxCol + j, 0, array_length(cells) - 1)) {	// если эти ячейки существуют 
					cellI = cells[(i % maxRow) * maxCol + j];	// id ячейки инвентаря, получаем их
				} else {
					cellI = -1;		// иначе без ячейки, все действия через массив предметов
				}
				var t = ctrl.maxEl_other - maxRow * maxCol * (page_other - 1);	// сколько ячеек на данной странице
				// проверяем, что индекс, который мы выбрали, лежит между нулем и min(длина массива, количество ячеек на странице)
				if (scr_var_inRange((row - (page_other - 1) * maxRow)  * l2 + col, 0, min(array_length(cells_other) - 1, t - 1))) {
					cellO = cells_other[(row - (page_other - 1) * maxRow) * l2 + col];	// id ячейки контрагента
				} else {
					cellO = -1;
				}
				// если найденная ячейка пуста и если мы можем класть в эту ячейку взятый предмет (или можем класть любой)
				if ((inv_items[i][j][0] == "") /*and 
					((scr_arr_findEl(cell.cell_corrItems, inv_items_other[row][col][0], 1) != -1) 
						or (array_length(cell.cell_corrItems) == 0)))*/ or 
						// ячейка содержит тот же предмет, что перемещаемая
					inv_items[i][j][0] == inv_items_other[row][col][0]) {
					// получаем количество предметов, которое мы можем положить (максимальное - предметы в этой ячейке)
					var c = global.CONST_MAP_ITEMS[?inv_items_other[row][col][0]][3] - inv_items[i][j][1];
					// кладем предметы в ячейку, получаем, сколько удалось положить
					if (c != 0) {
						tryPushItems++;	// считаем, сколько раз пытались переместить предметы
						c = scr_inv_pushItemCell(c, [inv_items_other[row][col][0], cnt, inv_items_other[row][col][2]], "other", "ctrl", row, col, i, j, cellO, cellI);
					}
					cnt -= c;
					moveItems += c;	// сколько предметов переместили
					if (cnt <= 0) {	// если перемещаемые предметы закончились
						return moveItems;
					}
				}
			}
		}
		inv_freeCell = scr_inv_calcFreeCell("ctrl"); // количество пустых ячеек
	} else {	// если перемещаем в контрагента	
		str = "put";
		for (var i = 0; i < array_length(inv_items_other); i++) {	
			for (var j = 0; j < array_length(inv_items_other[i]); j++) {	
				// var t = ... с рюкзаком нет таких проблем
				if (scr_var_inRange((row - (page - 1) * maxRow) * maxCol + col, 0, array_length(cells) - 1)) {	// если эти ячейки существуют 
					cellI = cells[(row - (page - 1) * maxRow) * maxCol + col];	// id ячейки инвентаря, получаем их
				} else {
					cellI = -1;		// иначе без ячейки, все действия через массив предметов
				}
				var t = ctrl.maxEl_other - maxRow * maxCol * (page_other - 1);	// сколько ячеек на данной странице
				// проверяем, что индекс, который мы выбрали, лежит между нулем и min(длина массива, количество ячеек на странице)
				if (scr_var_inRange((i % maxRow) * l2 + j, 0, min(array_length(cells_other) - 1, t - 1))) {	
					cellO = cells_other[(i % maxRow) * l2 + j];	// id ячейки контрагента
				} else {
					cellO = -1;
				}
				// если найденная ячейка пуста и если мы можем класть в эту ячейку взятый предмет (или можем класть любой), если эта ячейка существует, иначе можно класть любой
				if (((inv_items_other[i][j][0] == "") and 
					((cellO == -1) or (scr_arr_findEl(cellO.cell_corrItems, inv_items[row][col][0], 1) != -1) 
						or (array_length(cellO.cell_corrItems) == 0))) or 
						// ячейка содержит тот же предмет, что перемещаемая
					(inv_items_other[i][j][0] == inv_items[row][col][0])) {
					// получаем количество предметов, которое мы можем положить (максимальное - предметы в этой ячейке)
					// var c = cellI.inv_maxCntCell - inv_items_other[i][j][1];
					var c = global.CONST_MAP_ITEMS[?inv_items[row][col][0]][3] - inv_items_other[i][j][1];
					// кладем предметы в ячейку
					if (c != 0) {
						tryPushItems++;	// считаем, сколько раз пытались переместить предметы
						c = scr_inv_pushItemCell(c, [inv_items[row][col][0], cnt, inv_items[row][col][2]], "ctrl", "other", row, col, i, j, cellI, cellO);
					}
					cnt -= c;
					moveItems += c;	// сколько предметов переместили
					if (cnt <= 0) {	// если перемещаемые предметы закончились
						return moveItems;
					}
				} else {	// только для подсказки ,,несовпадение типа,,
					if (cellO != -1) {
						// если предмет, который мы хотим переложить нельзя положить в эту ячейку
						if ((scr_arr_findEl(cellO.cell_corrItems, ctrl.inv_items[row][col][0], 1) == -1) 
							and (array_length(cellO.cell_corrItems) != 0)) {
				
							// подсказки в зависимости от действия (put/take)
							tarr = ["box_put_fail_type1", "box_put_fail_type2", "box_put_fail_type3"];
							obj_ctrl_gm_hint.ctrl_hint_newHint = tarr[irandom_range(0, 2)];
						}
					} 	
				}
				
			}
		}
		inv_freeCell_other = scr_inv_calcFreeCell("other"); // количество пустых ячеек
	}
	
	if (tryPushItems == 0) { // если не нашли подходящую ячейку, значит, они все заполнены
		// выбираем подсказку
		if (obj_ctrl_gm_hint.ctrl_hint_newHint == "") {
			// подсказки в зависимости от действия (put/take)
			tarr = ["box_" + str + "_fail_cellFull1", "box_" + str + "_fail_cellFull2", "box_" + str + "_fail_cellFull3"];
			obj_ctrl_gm_hint.ctrl_hint_newHint = tarr[irandom_range(0, 2)];
			moveItems = 1;	// костыль, чтобы другая подсказка не сработала
		}
	}
	
	return moveItems;	// сколько предметов переместили
}


/// @function scr_inv_moveItemAll(owner);
/// @param {} owner - куда перемещаем: инвентарь или контрагент
/// @description перемещает все предметы из одного инвентаря в другой, вызывается из ККИ
function scr_inv_moveItemAll(owner) {
	var items, moveItems = 0, tarr = [], str, tcell = 0;
	if (owner == "ctrl") {	// если перемещаем в инвентарь  
		items = inv_items_other;	// берем из контрагента
	} else {
		items = inv_items;
	}
	
	// проходим по инвентарю
	for (var i = 0; i < array_length(items); i++) {	
		for (var j = 0; j < array_length(items[i]); j++) {	
			if (items[i][j][0] != "") {
				// считаем, сколько предметов переместили
				moveItems += scr_inv_moveItem(items[i][j][1], owner, i, j);
			}
		}
	}
	// подсказки 
	if (owner == "ctrl") {	// если перемещаем в инвентарь  
		tcell = scr_inv_calcFreeCell("other") - obj_ctrl_gm_inv.maxEl_other; // пересчитываем вес и количество ячеек;
		str = "take";
	} else {
		tcell = scr_inv_calcFreeCell("ctrl") - obj_ctrl_gm_inv.maxEl; // пересчитываем вес и количество ячеек;
		str = "put";
	}
	if (tcell >= 0) {
		if (obj_ctrl_gm_hint.ctrl_hint_newHint == "") {
			// если все проверки пройдены успешно
			tarr = ["box_" + str + "_success1", "box_" + str + "_success2", "box_" + str + "_success3"]
			obj_ctrl_gm_hint.ctrl_hint_newHint = tarr[irandom_range(0, 2)];	
		}
	}
	if (moveItems == 0) {	// если ничего не получилось переместить
		// if (obj_ctrl_gm_hint.ctrl_hint_newHint == "") {
			// подсказки в зависимости от действия (put/take)
			tarr = ["box_nothing_has_moved1", "box_nothing_has_moved2", "box_nothing_has_moved3"]
		// }
		if (array_length(tarr) != 0) {
			// выбираем подсказку
			obj_ctrl_gm_hint.ctrl_hint_newHint = tarr[irandom_range(0, 2)];
		}
	}
}


/// @function scr_inv_checkMoveItem(cnt, towner, powner, trow, tcol, prow, pcol);
/// @param {} cnt - количество предметов
/// @param {} towner - откуда перемещаем: инвентарь или контрагент
/// @param {} powner - куда перемещаем: инвентарь или контрагент
/// @param {} trow - строка перемещаемой ячейки
/// @param {} tcol - столбец перемещаемой ячейки
/// @param {} prow - строка ячейки, куда перемещаем
/// @param {} pcol - столбец ячейки, куда перемещаем
/// @description проверяет, можно ли положить указанное количество предметов по весу, типу, количеству на инвентарь
function scr_inv_checkMoveItem(cnt, towner, powner, trow, tcol, prow, pcol) {
	var str, titems, titemW, tweight, tweightMax, tcnt, tcntMax, tcell, ctrl = obj_ctrl_gm_rmInv;
	if (powner == towner) {	// если действия происходят в одном инвентаре, то это всегда допустимо
		return true;	
	}
	// получаю данные в зависимости оттого, куда кладем
	if (powner == "ctrl") {
		titems = ctrl.inv_items_other;	// это не ошибка: берем информацию о ячейке, откуда будем перемещать предметы
		tweightMax = obj_ctrl_gm_inv.inv_maxWeight;
		tcell = scr_inv_calcFreeCell("ctrl");	// пересчитываем вес и количество ячеек
		str = "take";
		tweight = obj_ctrl_gm_inv.inv_weight;
		if (ds_map_exists(obj_ctrl_gm_inv.inv_map_items, titems[trow][tcol][0])) {
			tcnt = obj_ctrl_gm_inv.inv_map_items[?titems[trow][tcol][0]] 	// количество данных предметов в инвентаре
		} else {
			tcnt = 0;
		}
	} else {
		titems = ctrl.inv_items;
		tweightMax = ctrl.inv_maxWeight_other;
		tcell = scr_inv_calcFreeCell("other");	// пересчитываем вес и количество ячеек
		str = "put";
		tweight = ctrl.inv_weight_other;
		tcnt = scr_inv_calcItems(titems[trow][tcol][0], "other");
	}
	titemW = global.CONST_MAP_ITEMS[?titems[trow][tcol][0]][1];		// вес предмета
	tcntMax = global.CONST_MAP_ITEMS[?titems[trow][tcol][0]][2];	// макс количество предметов на инвентарь
	
	var tarr = [], flag = true;
	
	/*
	if (tcell <= 0) {	// если закончилось место (ячейки) для того, чтобы положить
		// подсказки в зависимости от действия (put/take)
		tarr = ["box_" + str + "_fail_cellFull1", "box_" + str + "_fail_cellFull2", "box_" + str + "_fail_cellFull3"]
		flag = false;
	}
	*/
	
	// коробки по весу не ограничены
	if (tweight + titemW * cnt > tweightMax) {	// если не проходим по весу
		// подсказки в зависимости от действия (put/take)
		// tarr = ["box_" + str + "_fail_weight1", "box_" + str + "_fail_weight2", "box_" + str + "_fail_weight3"]
		tarr = ["box_take_fail_weight1", "box_take_fail_weight2", "box_take_fail_weight3"]
		flag = false;
	}
	
	if (cnt + tcnt > tcntMax) {	// если не проходим по количеству предметов на инвентарь
		// подсказки в зависимости от действия (put/take)
		tarr = ["box_" + str + "_fail_cnt1", "box_" + str + "_fail_cnt2", "box_" + str + "_fail_cnt3"]
		flag = false;
	}
	
	// только для контрагента, потому что в рюкзак можно положить предмет любого типа
	if (powner != "ctrl") {
		// индекс ячейки контрагента, куда мы хотим положить предметы
		var tind = (prow - (ctrl.page_other - 1) * ctrl.maxRow) *ctrl.maxCol + pcol;
		// если эта ячейка на открытой странице
		if (scr_var_inRange(tind, 0, array_length(ctrl.cells_other) - 1)) {
			// если предмет, который мы хотим переложить нельзя положить в эту ячейку
			if ((scr_arr_findEl(ctrl.cells_other[tind].cell_corrItems, ctrl.inv_items[trow][tcol][0], 1) == -1) 
				and (array_length(ctrl.cells_other[tind].cell_corrItems) != 0)) {
				
				// подсказки в зависимости от действия (put/take)
				tarr = ["box_put_fail_type1", "box_put_fail_type2", "box_put_fail_type3"]
				flag = false;
			}
		} 
	}
	
	if (array_length(tarr) != 0) {
		// выбираем подсказку
		obj_ctrl_gm_hint.ctrl_hint_newHint = tarr[irandom_range(0, 2)];
	}
	
	return flag;
}


