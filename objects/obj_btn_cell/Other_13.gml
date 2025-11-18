/// @description получение данных о предмете

if (cell_owner == "ctrl") {	// если эта ячейка относится к контроллеру инвентаря
	// получаем имя и свойства предмета, который храним в себе
	cell_obj = obj_ctrl_gm_rmInv.inv_items[cell_numR][cell_numC][0];	// объект в ячейке
	cell_cnt = obj_ctrl_gm_rmInv.inv_items[cell_numR][cell_numC][1];	// количество объектов в ячейке
	inv_otherInfo = obj_ctrl_gm_rmInv.inv_items[cell_numR][cell_numC][2];	// доп. информация
} else {	// для всех остальных ячеек (снаряжение, ящик и т.д.)
	// получаем из массива снаряжения 
	cell_obj = obj_ctrl_gm_rmInv.inv_items_other[cell_numR][cell_numC][0];	// объект в ячейке
	cell_cnt = obj_ctrl_gm_rmInv.inv_items_other[cell_numR][cell_numC][1];	// количество объектов в ячейке
	inv_otherInfo = obj_ctrl_gm_rmInv.inv_items_other[cell_numR][cell_numC][2];	// доп. информация
}
if (cell_obj != "") {
	var arr = global.CONST_MAP_ITEMS[?cell_obj];
	inv_name = arr[0];			// название предмета
	inv_weight = arr[1];		// вес предмета
	// inv_maxCntInv = arr[2];		// максимальное количество предметов на инвентарь
	inv_maxCntCell = arr[3];	// максимальное количество предметов на ячейку

	inv_type = arr[4];			// тип предмета
	if (scr_arr_findEl(["Еда и медикаменты", "Снаряжение", "Запчасти и инструменты", "Сюжетный", "Прочее"], type, 1) != -1) {	// если это обычные ячейки 
		type = inv_type;
	}
	inv_discription = arr[5];	// описание предмета
	inv_use = arr[6];			// приминение предмета
	inv_rarity = arr[7];		// редкость предмета
	// inv_sellCost = arr[8][0];		// минимальная стоимость предмета
	inv_buyCost = arr[8][1];		// максимальная стоимость предмета

	// sprite_index = arr[12][0];		// спрайт
	// inv_empty_spr = arr[12][1];		// спрайт пустой коробки
	// inv_death_spr = arr[12][2];		// спрайт уничтоженной коробки
	inv_ico_num = arr[13];			// номер картинки в спрайте иконки
	
	if (cell_cnt == 0) {
		action = "clearCell";
	}
	
}
event_user(2);