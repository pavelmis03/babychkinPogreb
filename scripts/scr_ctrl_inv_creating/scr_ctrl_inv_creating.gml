/*
	// создание ячеек
	// создание специальных ячеек
*/


/// @function scr_inv_createCell(page);
/// @param {} page - страница, которую нужно отобразить (!!! считаем с 0)
/// @param {} owner - для кого генерировать: для инвентаря или контрагента
/// @description скрипт создает ячейки на определенной странице
function scr_inv_createCell(page, owner) {
	var tcells, tstartX, tstartY, tmaxEl, ttype;
	// в зависимости от того, с кем работаеtм, создаем ссылку на массив предметов ctrl или other
	if (owner == "ctrl") {
		tstartX	= startX;
		tstartY	= startY;
		tcells = cells;
		// очищаем массив ячеек (их все равно удалять потом)
		// cells = [];
		// в контроллере комнаты нет этой переменной, беру из контроллера инвентаря
		tmaxEl = ctrl.maxEl;
		ttype = "Прочее";	// тип ячейки 
	} else {	
		tstartX	= startX_other;
		tstartY	= startY_other;
		tcells = cells_other;
		// очищаем массив ячеек (их все равно удалять потом)
		// cells_other = [];
		// в контроллере комнаты нет этой переменной, беру из контроллера инвентаря
		tmaxEl = ctrl.maxEl_other;
		ttype = inv_cell_type_other;	// тип ячейки 
	}
	// удаляю старые ячейки
	for (var i = 0; i < array_length(tcells); i++) {
		if (instance_exists(tcells[i])) {	// удаляем предыдущую ячейку, чтобы создать новую
			instance_destroy(tcells[i]);
		}
	}
	
	
	// создаю массив ячеек
	// но не больше, чем влезет на страницу и не больше, чем всего элементов в инвентаре
	for (var i = 0; (i < maxRow * maxCol) and (i + page * (maxRow * maxCol) < tmaxEl); i++) {
		var tx = tstartX + (i - (i div maxCol) * maxCol) * (cellW + 10);
		var ty = tstartY + (i div maxCol) * (cellH + 10);
		var obj = instance_create_depth(tx, ty, depth, obj_btn_cell);
		// сохраняем номер строки и столбца в массиве контроллера инвентаря,
		// к которым привязана ячейка с учетом страницы
		obj.cell_numR = (i + page * (maxRow * maxCol)) div maxCol;	
		obj.cell_numC = i mod maxCol;
		obj.cell_owner = owner;	// кто владелец ячейки
		obj.type = ttype;
		// запоминаем id созданной ячейки
		tcells[i] = obj;
	}	
	if (owner == "ctrl") {
		array_copy(cells, 0, tcells, 0, array_length(tcells));
	} else {
		array_copy(cells_other, 0, tcells, 0, array_length(tcells));
	}
}

/// @function scr_inv_createCellSpecial(c, r, i, type, owner);
/// @param {} c - столбец создаваемой ячейки
/// @param {} r - строка создаваемой ячейки
/// @param {} i - номер в массиве id ячеек для контроллера комнаты инвентаря
/// @param {} type - тип ячейки
/// @param {} owner - владелец
/// @description создаем уникальные ячейки по одной (например, ячейки снаряжения)
function scr_inv_createCellSpecial(c, r, i, type, owner) {
	// координаты левой верхней ячейки в сетке
	var tx = room_width * 0.62, ty = room_height * 0.22;
	// расстояние, на которое смещается каждая следующая ячейка по х и по у
	var tw = sprite_get_width(spr_inv_cell) + 10, th = sprite_get_height(spr_inv_cell) + 10;
	
	// координаты указываю по сетке (см. положение ячеек в !my_inventory\important_info - фон инвентаря
	var obj = instance_create_depth(tx + tw * c, ty + th * r, depth, obj_btn_cell);
	obj.type = type;
		
	obj.cell_numR = 0; // эти ячейки получаем из массива снаряжения контроллера снаряжения (он относительно одномерный)
	obj.cell_numC = i;
	obj.cell_owner = owner;
	cells_other[i] = obj;	
}

















