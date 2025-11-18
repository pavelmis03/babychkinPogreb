/// @function scr_equ_updateEquInfo();
/// @description пока мы в инвентаре, обновляем информацию о снаряжении, проходя по всему снаряжению, 
function scr_equ_updateEquInfo() {
	inv_weight = 0;
	for (var i = 0; i < array_length(inv_items[0]); i++) {	
		if (inv_items[0][i][0] != "") {	// если в данной ячейке не пусто
			// перерасчет веса
			var tarr = global.CONST_MAP_ITEMS[?inv_items[0][i][0]];
			inv_weight += inv_items[0][i][1] * tarr[1];	// количество на вес предмета
			// изменения в дополнительной информации
			var res = 0, findName = "";	// количество и имя расходников
			var itemName = inv_items[0][i][0];	// имя предмета, для которого надо найти количество расходников
			var tarr = [];			// массив доп. информации
			array_copy(tarr, 0, inv_items[0][i][2], 0, array_length(inv_items[0][i][2]));
			if (ds_map_exists(global.CONST_MAP_WEAPON, itemName)) {	// если есть информация в оружии
				findName = global.CONST_MAP_WEAPON[?itemName][8];	// название патронов
				// изменяем информацию по предмету
				var t = global.CONST_MAP_WEAPON[?itemName][0];
				tarr[1][1] = " от " + string(t[0]) + " до " + string(t[1]);	// урон
				tarr[2][1] = global.CONST_MAP_WEAPON[?itemName][9];	// дальность прицельной стрельбы (м)
			} else {
				findName = global.CONST_MAP_CLOTHES[?itemName][8];	// название элементов, которые надо искать
				// изменяем информацию по предмету
				tarr[1][1] = global.CONST_MAP_CLOTHES[?itemName][0];	// сопротивляемость холоду
				tarr[2][1] = global.CONST_MAP_CLOTHES[?itemName][1];	// сопротивляемость урону
			}
			// считаем количество патронов/расходников
			if (findName != "") {	// если нужны расходники
				res = scr_inv_calcItems(findName, "ctrl");
				// изменяем информацию по предмету
				tarr[3][1] = res;
			}
				
			// износ не меняется, пока мы в инвентаре)
			array_copy(inv_items[0][i][2], 0, tarr, 0, array_length(tarr));
		}
	}
}































