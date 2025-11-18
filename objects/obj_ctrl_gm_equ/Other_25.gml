/// @description выполнение действий

var player_obj = scr_player_type();
var _tarr = [];
{	// временный массив соответствия предметов ячейкам снаряжения
_tarr[0] = "Шапка";
_tarr[1] = "Куртка";
_tarr[2] = "Основное оружие";
_tarr[3] = "Вспомогательное оружие";
_tarr[4] = "Снаряга1";
_tarr[5] = "Снаряга2";
_tarr[6] = "Перчатки";
_tarr[7] = "Пистолет";
_tarr[8] = "Бронежилет";
_tarr[9] = "Штаны";
_tarr[10] = "Ботинки";
}

switch (action) {
	// переход из инвентаря
	case "goBackInv":	// копируем изменения в словарь снаряжения
		var tarr = inv_items[0];
		var key = ds_map_find_first(equ_map_equ);
		for (var i = 0; i < array_length(tarr); i++) {	// если какая-то ячейка снаряжения изменилась
														// меняем соответствующую запись в словаре
			equ_map_equ[?_tarr[i]] = tarr[i];
			key = ds_map_find_next(equ_map_equ, key);
		}
		
		// проходим по инвентарю в поисках патронов
		event_user(5);	// обнуление словаря патронов
		var ctrl = obj_ctrl_gm_inv;
		for (var i = 0; i < ctrl.maxEl / ctrl.maxCol; i++) {
			for (var j = 0; j < ctrl.maxCol; j++) {
				if (string_copy(ctrl.inv_items[i][j][0], 0, 6) == "Патрон") {
					equ_map_patrons[?ctrl.inv_items[i][j][0]] += ctrl.inv_items[i][j][1];
				}
			}
		}
		action = "";
	break;
}
