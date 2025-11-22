/// @description выполнение действий

var player_obj = scr_player_type();

switch (action) {
	// добавление предмета в инвентарь
	case "add_item":
		scr_inv_addItem();
		inv_itemId = -1;
		action = "";
	break; 
	// переход в инвентарь
	case "goToInv":
		room_goto(rm_menu_inv);
		obj_ctrl_mv.action = "addRm";
		if (inv_itemId != -1) {	// если мы открываем любой инвентарь, кроме стандартного (сняряжения)
			// получаем данные из того, с кем взаимодействуем
			inv_weight_other = inv_itemId.inv_weight;
			inv_maxWeight_other = inv_itemId.inv_maxWeight;
			inv_maxCnt_other = inv_itemId.inv_maxCnt;
			maxEl_other = inv_itemId.maxEl;
			inv_ico_ind_other = inv_itemId.inv_ico_num;	// номер картинке в спрайте иконки
			inv_items_other = inv_itemId.inv_items;		// массив инвентаря-контрагента
			inv_type = inv_itemId.inv_type;
			inv_name = inv_itemId.inv_name;		// имя инвентаря-контрагента
			inv_cell_type_other = inv_itemId.inv_cell_type;		// тип ячеек в этой коробке
		} else {	// если открываем инвентарь снаряжения
			inv_items_other = obj_ctrl_gm_equ.inv_items;
			inv_type = "normalInv";
			inv_name = "Инвентарь снаряжения";
		}

		action = "calcWeight";
	break;
	// переход из инвентаря
	case "goBackInv":
		obj_ctrl_mv.action = "goToRmPre";
		obj_ctrl_gm_equ.action = "goBackInv";	// нужно скопировать в словарь снаряги добавленные элементы
		action = "afterLeaveInv";	// действия после выхода из инвентаря
	break;
	// действия после выхода из инвентаря
	case "afterLeaveInv":
		// проигрываем спрайт игрока в обратном направлении 
		player_obj.sprite_index = spr_playerFP_openInv;	
		player_obj.image_speed = -1;
		player_obj.image_index = player_obj.image_number - 0.1;
		
		// выбрасывание предметов 
		// создаю коробки выброшенных предметов
		scr_inv_createDeletedItemBox();
		
		if (inv_itemId != -1) {
			// если взаимодействовали с каким-то предметом инвентаря (напр. коробкой) говорим, что вышли из инвентаря
			inv_itemId.action = "afterLeaveInv";
			inv_itemId = -1;			// если с кем-то взаимодействовали, то уже нет
		}
		
		ds_map_clear(inv_map_items_del);	// очищаем словарь предметов на выброс
		
		action = "";
	break;
	// расчет веса предметов
	case "calcWeight":	
		var el = ds_map_find_first(inv_map_items);
		inv_weight = 0;
		for (var i = 0; i < ds_map_size(inv_map_items); i++) {
			var arr = global.CONST_MAP_ITEMS[?el];	// получаем информацию по предмету
			inv_weight += arr[1] * inv_map_items[?el];	// считаем вес
			el = ds_map_find_next(inv_map_items, el);
		}
		action = "";
	break;
}