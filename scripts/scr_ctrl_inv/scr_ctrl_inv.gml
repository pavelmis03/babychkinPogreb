/*
	// добавление предметов в инвентарь
	// перелистывание страниц
	// пересчет пустых ячеек и веса инвентарей
*/

/// @function scr_inv_addItem();
/// @description эта функция добаляет предмет в инвентарь, если это позволяет инвентарь. Максимальное количество предметов
function scr_inv_addItem() {
	// далее описаны локальные переменные
	var ctrl = obj_ctrl_gm_inv;
	var itemId = ctrl.inv_itemId;   // id подбираемого предмета
	var invItems = ctrl.inv_items;   // двумерный массив инвентаря   
	var maxWeight = ctrl.inv_maxWeight;  // маскимальный вес инвентаря
	var weightInv = ctrl.inv_weight;		// текущий вес инвентаря
	var map_invItems = ctrl.inv_map_items; // словарь, содержащий количество предметов в инвентаре
	var invItemsCnt = 0;				// по умолчанию количество предметов - ноль
	var new_inv = 0, new_cell = 0, new_weight = 0, tweight = 0;
	if (ds_map_exists(map_invItems, itemId.inv_keyName)) { // если они есть, то сколько?
		invItemsCnt = map_invItems[?itemId.inv_keyName]; // сколько таких предметов в инвентаре
	}
	
	for (var i = 0; i < ctrl.maxEl / ctrl.maxCol; i++) {
		for (var j = 0; j < ctrl.maxCol; j++) {
			var cell = invItems[i][j];      // ячейка инвентаря
			if ((cell[0] == "") or (cell[0] == itemId.inv_keyName)) { // если она пустая или соответствует подбираемому предмету
				// новое допустимое значение веса, если подобрать все предметы
				new_weight = clamp(weightInv + (itemId.inv_weight * itemId.inv_cnt), weightInv, maxWeight);
			    // новое допустимое значение количества предметов в ячейке, если подобрать все предметы
			    new_cell = clamp(cell[1] + itemId.inv_cnt, cell[1], itemId.inv_maxCntCell);
			    // новое допустимое значение количества предметов во всём инвентаре, если подобрать все предметы
			    new_inv = clamp(invItemsCnt + itemId.inv_cnt, invItemsCnt, itemId.inv_maxCntInv);
			    // количество предметов которые можно добавить в инвентарь по максимальному весу,
			    // первая часть - получение количества предметов, которые влезут по весу, умножаю на условие, что 
				// свободного веса больше или равно, весу одного предмета (чтобы исключить случай, когда предмет влезает на 50+%)
				tweight = round((new_weight - weightInv) / itemId.inv_weight) * (maxWeight - weightInv - itemId.inv_weight > 0.001);
				// количеству предметов на инвентарь и количеству предметов на ячейку
				// количеству предметов на инвентарь и количеству предметов на инвентарь
			    var addCnt = min(tweight, new_cell - cell[1], new_inv - invItemsCnt);
			    // cell[0] - это название предмета
			    // cell[1] - это количество предметов в ячейке
			    if (addCnt > 0) {	// если мы можем что-то добавить
					cell[0] = itemId.inv_keyName;// добавляем в ячейку инвентаря имя предмета
					cell[1] += addCnt;			// и количество
					array_copy(cell[2], 0, itemId.inv_otherInfo, 0, array_length(itemId.inv_otherInfo)); // доп. информация
					invItems[i][j] = cell;
					// ОБНОВЛЕНИЕ ПЕРЕМЕННЫХ В КОНТРОЛЛЕРЕ ИНВЕНТАРЯ
				    ctrl.inv_weight += addCnt * itemId.inv_weight;
					ctrl.inv_map_items[?itemId.inv_keyName] = invItemsCnt + addCnt; // обновляем общее количество этих предметов в инвентаре
					// обновление информации в массиве снаряжения
					if (string_copy(cell[0], 0, 6) == "Патрон") {	// добавляю патроны
						obj_ctrl_gm_equ.equ_map_patrons[?cell[0]] += cell[1];
					}
					// обновление локальных переменных для дальнейшей работы
					invItemsCnt = ctrl.inv_map_items[?itemId.inv_keyName]; // локальный счетчик количества предметов тоже нужно обновить 
					weightInv = ctrl.inv_weight;
				    itemId.inv_cnt -= addCnt;	// обновляем количество предметов в коробке
				}
			}
			if (itemId.inv_cnt == 0) {	// если предметы в коробке закончились, обновляем массив предметов в контроллере и выходим
				ctrl.inv_items = invItems;
				var tarr = ["take_inv_success1", "take_inv_success2", "take_inv_success3"];
				obj_ctrl_gm_hint.ctrl_hint_newHint = tarr[irandom_range(0, 2)];
				return;
			}
		}
	}
	
	if (new_inv - invItemsCnt == 0) {
		var tarr = ["take_inv_fail_cnt1", "take_inv_fail_cnt2", "take_inv_fail_cnt3"];
		obj_ctrl_gm_hint.ctrl_hint_newHint = tarr[irandom_range(0, 2)];
	}
	if (tweight == 0) {
		var tarr = ["take_inv_fail_weight1", "take_inv_fail_weight2", "take_inv_fail_weight3"];
		obj_ctrl_gm_hint.ctrl_hint_newHint = tarr[irandom_range(0, 2)];
	}
	if (scr_inv_calcFreeCell("ctrl_inv") == 0) {	// количество пустых ячеек
		var tarr = ["take_inv_fail_bagFull1", "take_inv_fail_bagFull2", "take_inv_fail_bagFull3"];
		obj_ctrl_gm_hint.ctrl_hint_newHint = tarr[irandom_range(0, 2)];
	}
	ctrl.inv_items = invItems;	// обновляем массив предметов в контроллере 
}

/// @function scr_inv_changePage(next);
/// @param {} next - следующая страница (true) или предыдущая (false)
/// @description проверяет, есть ли поднятый предмет, если да, то перемещает его в свободную
	// ячейку на следующей странице и снова берет в руку после перелистывания. 
	// вызывает скрипт создания ячеек, изменяет col и row фокуса
function scr_inv_changePage(next) {
	var t, tarr, tcell, owner;
	// совпадают ли инвентарь, к которому относится предмет в руках, и инвентарь, чью страницу листаем
	var flag = false; 
	var tarr_items, tcells, tpage;
	// в зависимости от того, с кем работаем, создаем ссылку на массив предметов ctrl или other
	if ((action == "invNextPage") or ((action == "invPrePage"))) {
		tarr_items = inv_items;
		tcells = cells;
		tpage = page;
		owner = "ctrl";
		if ((cellId != -1) and (cellId.cell_owner == "ctrl")) {	
			// если совпадают инвентарь, к которому относится предмет в руках, и инвентарь, чью страницу листаем
			flag = true;
		}
	} else {
		tarr_items = inv_items_other;
		tcells = cells_other;
		tpage = page_other;
		owner = "other";
		if ((cellId != -1) and (cellId.cell_owner == "other")) {	
			// если совпадают инвентарь, к которому относится предмет в руках, и инвентарь, чью страницу листаем
			flag = true;
		}
	}
	// если у нас что-то в руках (из инвентаря, чью страницу листают) при перелистывании страницы, мы
	if ((cellId != -1) and (flag)) {	
		tarr = [];	// перед перелистыванием ищем в диапазоне ячеек, относящихся к новой
		array_copy(tarr, 0, tarr_items, maxRow * (tpage - 1), maxRow); // странице 
		t = scr_arr_findEl(tarr, ["", 0, [["", 0], ["", 0], ["", 0], ["", 0]]], 2);	// пустую клетку
		if (t != -1) {	// это значит, что мы нашли свободную ячейку
			tcell = tarr_items[cellId.cell_numR][cellId.cell_numC]; // получаем данные о ячейке в руках
			tarr_items[t[0] + maxRow * (tpage - 1), t[1]][0] = tcell[0];	// переносим предмет из ячейки, откуда взяли в руки
			tarr_items[t[0] + maxRow * (tpage - 1), t[1]][1] = tcell[1];	// на найденную свободную ячейку на новой странице
			array_copy(tarr_items[t[0] + maxRow * (tpage - 1), t[1]][2], 0, tcell[2], 0, array_length(tcell[2]));	// назначаем доп. информацию
			tarr_items[cellId.cell_numR][cellId.cell_numC][0] = "";	// обнуляем старую ячейку
			tarr_items[cellId.cell_numR][cellId.cell_numC][1] = 0;
			tarr_items[cellId.cell_numR][cellId.cell_numC][2] = [["", 0], ["", 0], ["", 0], ["", 0]];
		} else {
			cellId = -1;	// если мест на следующей стрианице нет, то мы оставляем предмет на месте на предыдущей странице
		}
	}
	// создаю массив ячеек для текущей страницы
	scr_inv_createCell(tpage - 1, owner);
	// ВАЖЕН ПОРЯДОК, поэтому еще один if такой же, как и до этого (сначала создать ячейки, а потом этот if)
	if ((cellId != -1) and (flag)) {	// искусственно ,,забираем предмет,, из ячейки
		cellId = tcells[(t[0] % maxRow) * maxCol + t[1]];
		cellId.cell_obj = "";
		cellId.action = "emptyCell";
	}
	// сдвигаем фокус на одну страницу по строкам
	row += maxRow * next - maxRow * (!next);	// в зависимости от next прибавляем или убираем
	col = col;		// столбец оставляем тот же
}
	
/// @function scr_inv_calcEmptyCell(owner);
/// @param {} owner - где ищем: инвентарь или контрагент
/// @description считает количество пустых ячеек в инвентаре и вес инвентаря-контагента. 
function scr_inv_calcFreeCell(owner) {
	var tarr_items, freeCell = 0, tweight = 0, ctrl = obj_ctrl_gm_inv;
	if (owner == "ctrl_inv") {	// если ищем в контроллере инвентаря вне комнаты инвентаря
		tarr_items = ctrl.inv_items;
	} else {
		if (owner == "ctrl") {	// если ищем в инвентаре
			tarr_items = obj_ctrl_gm_rmInv.inv_items;
			ds_map_clear(ctrl.inv_map_items);	// проверяем предметы в словаре
			// вес снаряжения прибавляю к весу инвентаря
			ctrl.inv_weight = obj_ctrl_gm_equ.inv_weight;
		} else {	// если ищем в контрагенте
			tarr_items = obj_ctrl_gm_rmInv.inv_items_other;
			inv_weight_other = 0;
		}
	}
	for (var i = 0; i < array_length(tarr_items); i++) {	
		for (var j = 0; j < array_length(tarr_items[i]); j++) {	
			if ((tarr_items[i][j][0] == "") or (tarr_items[i][j][1] == 0)) {
				freeCell++;
			} else {	// рассчитываем вес инвентаря 
				if (owner == "other") {	// если ищем в контрагенте
					// дополнительно считаем вес инвентаря контрагента
					inv_weight_other += tarr_items[i][j][1] * global.CONST_MAP_ITEMS[?tarr_items[i][j][0]][1];
				}
				if (owner == "ctrl") {	// если ищем в инвентаре
					ctrl.inv_weight += tarr_items[i][j][1] * global.CONST_MAP_ITEMS[?tarr_items[i][j][0]][1];
					// обновляем количество предметов в инвентаре 
					if (ds_map_exists(ctrl.inv_map_items, tarr_items[i][j][0])) {
						ctrl.inv_map_items[?tarr_items[i][j][0]] += tarr_items[i][j][1];
					} else {
						ctrl.inv_map_items[?tarr_items[i][j][0]] = tarr_items[i][j][1];
					}
				}
			}
		}
	}
	
	return freeCell;
}


/// @function scr_inv_calcItems(itemName, owner);
/// @param {} itemName - имя предмета, который мы ищем в инвентаре
/// @param {} owner - где ищем 
/// @description считает количество заданных по имени предметов в инвентаре
function scr_inv_calcItems(itemName, owner) {
	var titems = [], maxEl, ctrl = obj_ctrl_gm_inv;
	if (owner == "ctrl") {
		titems = ctrl.inv_items;
		maxEl = ctrl.maxEl;
	} else {
		titems = ctrl.inv_items_other;
		maxEl = ctrl.maxEl_other;
	}
	var t = string_length(itemName);
	var itemsCnt = 0;
	// for (var i = 0; i < ceil(maxEl / ctrl.maxCol); i++) {
		// for (var j = 0; (j < ctrl.maxCol) and (j < maxEl - i * ctrl.maxCol); j++) {
	for (var i = 0; i < array_length(titems); i++) {
		for (var j = 0; j < array_length(titems[i]); j++) {
			if (string_copy(titems[i][j][0], 0, t) == itemName) {
				itemsCnt += titems[i][j][1];	
			}
		}
	}
	
	return itemsCnt;
}


















