/// @function scr_col_checkColObj(objType);
/// @param {} objType какие это объекты ("enemy", "player", "buh"...)
/// @description проверяет, если ли коллизия с кем-нибудь из указанных объектов
function scr_col_checkColObj(objType) {
	if (objType == "player") {	// проверяем коллизии с игроками
		var player_obj = scr_player_type();	// игрок в комнате
	
		if (place_meeting(x, y, player_obj)) {	// если, стоя в наших в наших координатах, мы имеем коллизию с игроком
			return player_obj;
		}	
	}
	
	if (objType == "buh") {	// проверяем коллизии с буханкой
		if (place_meeting(x, y, obj_buh)) {	// если, стоя в наших в наших координатах, мы имеем коллизию с буханкой
			return obj_buh;
		}	
	}
	
	if (objType == "enemy") {	// проверяем коллизии с игроками
		// получаем массив монстров откуда-нибудь
		// смотрим, есть ли контакт с кем-то из них
		// возвращаем id
	}
	
	
	return -1;
}

/// @function scr_col_findEmptyArea(w, h, startX, startY, objArr);
/// @param {} w необходимая ширина свободного пространства
/// @param {} h необходимая высота свободного пространства
/// @param {} startX начальная координата X
/// @param {} startY начальная координата Y
/// @param {} objArr объекты, которых не должно быть в области [] - никаких 
/// @description находит свободную от объектов область заданного размера
function scr_col_findEmptyArea(w, h, startX, startY, objArr) {
	var i = 0, j = 0, tx = startX, ty = startY, flag = true;	
	w /= 2;
	h /= 2;
	if (array_length(objArr) == 0) {
		objArr = [all];
	}
	
	if (scr_col_exceptObj(tx - w, ty - h, tx + w, ty + h, objArr) == 0) {	// если коллизий нет, ответ найден, дальше не ищем
		return [tx, ty]
	}
			
	// ограничение в 1000 проверок, чтобы не зациклиться
	while (i < 1000) {
		i++;
		// смещение по условной сетке: я иду по расширяющейся спирали от начальной точки
		// сначала проверяю область справа, потом справа сверху, потом сверху и т.д.
		// потом увеличиваю отступ то начальной точки и уже проверяю не 8 клеток вокруг, а 16
		// и после каждого смещения проверяю, есть ли коллизии с кем-то, кроме поверхностей и триггеров
		for (var j = 0; j < i; j++) tx += w 
		if (scr_col_exceptObj(tx - w, ty - h, tx + w, ty + h, objArr) == 0) return [tx, ty];	// ответ найден
		
		for (var j = 0; j < i; j++) ty += h
		if (scr_col_exceptObj(tx - w, ty - h, tx + w, ty + h, objArr) == 0) return [tx, ty];	// ответ найден
		
		for (var j = 0; j < i * 2; j++) tx -= w
		if (scr_col_exceptObj(tx - w, ty - h, tx + w, ty + h, objArr) == 0) return [tx, ty];	// ответ найден
		
		for (var j = 0; j < i * 2; j++) ty -= h
		if (scr_col_exceptObj(tx - w, ty - h, tx + w, ty + h, objArr) == 0) return [tx, ty];	// ответ найден
		
		for (var j = 0; j < i * 2; j++) tx += w
		if (scr_col_exceptObj(tx - w, ty - h, tx + w, ty + h, objArr) == 0) return [tx, ty];	// ответ найден
		
		for (var j = 0; j < i - 1; j++) ty += h
		if (scr_col_exceptObj(tx - w, ty - h, tx + w, ty + h, objArr) == 0) return [tx, ty];	// ответ найден
	}
	
	return [tx, ty];
}

/// @function scr_col_exceptObj(x1, y1, x2, y2);
/// @param {} x1 координата для рамки поиска коллизий
/// @param {} y1 координата для рамки поиска коллизий
/// @param {} x2 координата для рамки поиска коллизий
/// @param {} y2 координата для рамки поиска коллизий
/// @param {} objArr объекты, которых не должно быть в области [] - никаких 
/// @description находит список id объектов, с которыми произошла коллизия, удаляет
	// из него объекты поверхностей и триггеров, возвращает количество оставшихся объектов
	// (суть)вспомогательный скрипт для scr_col_findEmptyArea, возвращает количество коллизий с несистемыми объектами в области
function scr_col_exceptObj(x1, y1, x2, y2, objArr) {
	var exceptObj = [obj_ctrl_gm_surf, obj_ctrl_gm_trigger];// объекты, которые нужно исключить из коллизий
	var list = ds_list_create();	// список для id объектов коллизий
	var n = collision_rectangle_list(x1, y1, x2, y2, objArr, true, true, list, false);
	// прохожу по списку объектов коллизий и удаляю из него поверхности и триггеры(
	for (var l = 0; l < ds_list_size(list); l++) {
		if (scr_arr_findEl(exceptObj, list[|l].object_index, 1) != -1) {
			ds_list_delete(list, l);
			l--;
		}
	}
	var t = ds_list_size(list);
	ds_list_destroy(list);
	return t;
}










