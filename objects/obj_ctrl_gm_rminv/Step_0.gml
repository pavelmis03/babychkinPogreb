/// @description 

if (!init) {
	event_user(0);
}

if (((mouse_x >= room_width * inv_sideCoef) and (!mouseXSide)) or	// если курсор только что перешел в правую часть
	((mouse_x < room_width * inv_sideCoef) and (mouseXSide))) {	// если курсор только что перешел в левую часть
	col = 0;	// ячейка в фокусе - первая
	row = maxRow * (page - 1);
}

if (mouse_x >= room_width * inv_sideCoef) {	// обновляем положение мыши
	mouseXSide = 1;		// мышь справа
} else {
	mouseXSide = 0;		// мышь слева
}

// выполнение действия
if (action != "") {
	event_user(15);
	// action = "";
}