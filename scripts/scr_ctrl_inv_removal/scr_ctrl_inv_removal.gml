/*
	// удаление предметов из ячейки 
	// формирование коробки с выброшенными предметами
	// очистка ячейки в массиве предметов
*/

/// @function scr_inv_delItem(cnt, owner, typeDel);
/// @param {} cnt - количество предметов
/// @param {} owner - кто владелец: инвентарь или контрагент
/// @param {} typeDel - удаляем в коробку - "delBox", удаляем насовсем - "delUse"
/// @description удаляет указанное количество предметов из инвентаря
function scr_inv_delItem(cnt, owner, typeDel) {
	var tarr_items, tcells, ctrl = obj_ctrl_gm_inv;
	if (owner == "ctrl") {	// в зависимости от того, с кем работаем, создаем ссылку на массив предметов ctrl или other
		tarr_items = inv_items;
		tcells = cells;
	} else {
		tarr_items = inv_items_other;
		tcells = cells_other;
	}
	var t = tarr_items[row][col];
	// if (cellId == -1) {	// если что-то есть в руках, то нельзя удалять
		if (t[0] != "") {	// если мы над ячейкой с предметами
			cnt = clamp(cnt, 0, t[1]);	// чтобы не удалить больше, чем есть (такого не должно быть, это на всякий случай)
			tarr_items[row][col][1] -= cnt;	// удаляем предмет из массива-таблицы
			// в зависимости от того, с кем работаем, создаем ссылку на массив предметов ctrl или other
			if ((owner == "ctrl") or (inv_type == "normalInv")) {	// или мы работаем со снарягой (нет отдельного словаря элементов)
				// ОШИБКА если удаляем из снаряги то, чего нет в основном инвентаре. По идее при удалении из снаряги, нужно удалять из инвентаря снаряжения, а не из обычной снаряги
				ctrl.inv_map_items[?t[0]] -= cnt;	// удаляем предмет из словаря с предметами
				var arr = global.CONST_MAP_ITEMS[?t[0]];	
				ctrl.inv_weight -= arr[1] * cnt;	// уменьшаем вес инвентаря
			} else {
				// словарь других оъектов вхаимодействия, если он будет 
			}
		
			if (typeDel == "delBox") {	// если удаляем не насовсем, а просто выбрасываем
				// если в словаре предметов на удаление нет такого, создаем, иначе просто увеличиваем количество
				if (ds_map_exists(ctrl.inv_map_items_del, t[0])) {	
					// хранит в себе [количество, [доп информация]] по ключу - имени предмета
					ctrl.inv_map_items_del[?t[0]][0] += cnt;
				} else {
					ctrl.inv_map_items_del[?t[0]] = [cnt, t[2]];
				}
			}
		
			// обновляем информацию в ячейке
			tcells[(row % maxRow) * maxCol + col].action = "updateInfo";
			if (tarr_items[row][col][1] == 0) { // если предметы кончились, очищаем ячейку и массив
				tarr_items[row][col][0] = "";
				tarr_items[row][col][2] = [["", 0], ["", 0], ["", 0], ["", 0]];
				tcells[(row % maxRow) * maxCol + col].action = "clearCell";
			}
		}
		inv_freeCell = scr_inv_calcFreeCell("ctrl"); // количество пустых ячеек
		inv_freeCell_other = scr_inv_calcFreeCell("other"); // количество пустых ячеек
	// }
}


/// @function scr_inv_createDeletedItemBox();
/// @description создает коробку для удаленных (выброшенных) из инвентаря предметов
		// вызывается из контроллера инвентаря
function scr_inv_createDeletedItemBox() {
	var ctrl = obj_ctrl_gm_inv;
	var items_del = ctrl.inv_map_items_del;
	if (ds_map_size(items_del) > 0) {
		// получаю размеры будущей коробки
		var w = sprite_get_width(spr_box_recyleBin), h = sprite_get_height(spr_box_recyleBin);
		// получаю x, y места, где можно разместить коробку, чтобы она никого не касалась (свободное место)
		var tarr = scr_col_findEmptyArea(w, h, player_obj.x, player_obj.y, []);
		// создаю коробку (в tarr - координаты центра области)
		var obj = instance_create_depth(tarr[0] - w / 2, tarr[1] - h / 2, depth, obj_inv_box);
		// задаю основные параметры (типа создаю вручную)
		obj.inv_isCustom = true;
		obj.inv_keyName = "recycleBinBox";	// ключ для поиска в константном массиве
		obj.maxEl = 0;				// количество предметов, которое мы в принципе разместить в инвентаре (задам в цикле)
		obj.inv_cell_type = "Прочее";		// тип ячеек в этой коробке
		obj.inv_isRmv = true;		// необходимость удаления после поднятия/использования
		obj.inv_hp = 300;			// количество здоровья (-1 если бесконечное)
		obj.inv_weight = 1;		// вес ненулевой, чтобы коробка не удалилась, потом сама пересчитает

		obj.inv_items = [[]];

		var j = 0;
		var key = ds_map_find_first(items_del);
		for (var i = 0; i < ds_map_size(items_del); i++) { // цикл по ключам словаря мусора
			tarr = global.CONST_MAP_ITEMS[?key];
		
			while (items_del[?key][0] > 0) {	// сохраняем такие предметы, пока все не раскидаю по ячейкам
				// количество предметов не больше, чем можно сохранить в ячейку 
				var val = clamp(items_del[?key][0], 0, tarr[3]);	
				// сохраняю в ячейку инвентаря-мусора информацию [имя_предмета, количество, [доп. инфо]]
				obj.inv_items[floor(j / ctrl.maxCol)][j % ctrl.maxCol] = [key, val, items_del[?key][1]];
				items_del[?key][0] -= val;	// уменьшаю количество предметов, которое еще надо сохранить
				j++;
			}
		
			key = ds_map_find_next(items_del, key);
		}
		// максимальное количество предметов задаем исходя из того, сколько ячеек пришлось создать + 10
		obj.maxEl = j + 10;
		for (var i = j; i < j + 10; i++) {	// дополнительные ячейки, чтобы удобнее было
			obj.inv_items[floor(i / ctrl.maxCol)][i % ctrl.maxCol] = ["", 0, [["", 0], ["", 0], ["", 0], ["", 0]]];
		}
	}
}


/// @function scr_inv_clearCell(row, col, owner);
/// @param {} row - строка очищаемой ячейки
/// @param {} col - столбец очищаемой ячейки
/// @param {} owner - владелец очищаемой ячейки
/// @description очищает ячейку в массиве предметов
function scr_inv_clearCell(row, col, owner) {
	if (owner == "ctrl") {	// если ячейка, которую очищаем, относится к инвентарю персонажа
		obj_ctrl_gm_rmInv.inv_items[row][col][0] = "";	// зачищаем массив ячеек 
		obj_ctrl_gm_rmInv.inv_items[row][col][1] = 0;
		obj_ctrl_gm_rmInv.inv_items[row][col][2] = [["", 0], ["", 0], ["", 0], ["", 0]];
	} else {	// если это ячейка контрагента
		obj_ctrl_gm_rmInv.inv_items_other[row][col][0] = "";	// зачищаем массив ячеек 
		obj_ctrl_gm_rmInv.inv_items_other[row][col][1] = 0;
		obj_ctrl_gm_rmInv.inv_items_other[row][col][2] = [["", 0], ["", 0], ["", 0], ["", 0]];
	}
}





















