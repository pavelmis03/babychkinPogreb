/// @description инициализация в зависимости от типа

var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);	// id слоя фона

// создаю массив ячеек инвентаря персонажа
scr_inv_createCell(0, "ctrl");
inv_freeCell = scr_inv_calcFreeCell("ctrl"); // количество пустых ячеек

switch (inv_type) {
	case "normalInv":// просто инвентарь
		instance_destroy(inv_btn[0]);	// удаляем стрелки второго инвентаря
		instance_destroy(inv_btn[1]);
		instance_destroy(inv_btn[4]);	// удаляем кнопки ,,переместить все,, ,,взять все,,
		instance_destroy(inv_btn[5]);
		
		// если тип инвентаря обычный - создаем ячейки для него
		// координаты указываю по сетке (см. положение ячеек в !my_inventory\important_info - фон инвентаря
		scr_inv_createCellSpecial(3, 1, 0, "Шапка", "other");
		scr_inv_createCellSpecial(3, 2, 1, "Куртка", "other");
		scr_inv_createCellSpecial(4, 2, 2, "Основное оружие", "other");
		scr_inv_createCellSpecial(5, 2, 3, "Вспомогательное оружие", "other");
		scr_inv_createCellSpecial(1, 3, 4, "Снаряга", "other");
		scr_inv_createCellSpecial(2, 3, 5, "Снаряга", "other");
		scr_inv_createCellSpecial(3, 3, 6, "Перчатки", "other");
		scr_inv_createCellSpecial(4, 3, 7, "Пистолет", "other");
		scr_inv_createCellSpecial(5, 3, 8, "Бронежилет", "other");
		scr_inv_createCellSpecial(3, 4, 9, "Штаны", "other");
		scr_inv_createCellSpecial(3, 5, 10, "Ботинки", "other");
		
		layer_background_sprite(back_id, spr_gm_bg_invNormal);	// меняю фон инвентаря по типу инвентаря
	break;
	case "boxInv":// инвентарь ящика
		layer_background_sprite(back_id, spr_gm_bg_invBox);	// меняю фон инвентаря по типу инвентаря
		
		if (maxPage_other > 1) {
			inv_btn[0].action = "invPrePageBox";
			inv_btn[1].action = "invNextPageBox";
		} else {
			instance_destroy(inv_btn[0]);	// удаляем стрелки второго инвентаря
			instance_destroy(inv_btn[1]);
		}
		instance_destroy(inv_btn[2]);	// удаляем кнопку ,,использовать,,
		
		scr_inv_createCell(0, "other");	// создаю ячейки для инвентаря-контрагента
		
		inv_freeCell_other = scr_inv_calcFreeCell("other"); // количество пустых ячеек
	break;
	case "sellerInv":// инвентарь продавца
		instance_destroy(inv_btn[4]);	// удаляем кнопки ,,переместить все,, ,,взять все,,
		instance_destroy(inv_btn[5]);
	
		layer_background_sprite(back_id, spr_gm_bg_invSeller);	// меняю фон инвентаря по типу инвентаря
		if (maxPage_other > 1) {
			inv_btn[0].action = "invPrePageSeller";
			inv_btn[1].action = "invNextPageSeller";
		} else {
			instance_destroy(inv_btn[0]);	// удаляем стрелки второго инвентаря
			instance_destroy(inv_btn[1]);
		}
		
		scr_inv_createCell(0, "other");	// создаю ячейки для инвентаря-контрагента
		
		instance_destroy(inv_btn[2]);	// удаляем кнопку ,,использовать,,
	break;
	case "craftInv":// инвентарь крафта 
		// inv_btn[0].action = "invPrePageCraft";
		// inv_btn[1].action = "invNextPageCraft";
		layer_background_sprite(back_id, spr_gm_bg_invCraft);	// меняю фон инвентаря по типу инвентаря
		instance_destroy(inv_btn[0]);	// удаляем стрелки второго инвентаря
		instance_destroy(inv_btn[1]);
		instance_destroy(inv_btn[2]);	// удаляем кнопку ,,использовать,,
		instance_destroy(inv_btn[4]);	// удаляем кнопки ,,переместить все,, ,,взять все,,
		instance_destroy(inv_btn[5]);
	break;
	case "buhInv":// инвентарь буханки
		inv_btn[0].action = "invPrePageBuh";
		inv_btn[1].action = "invNextPageBuh";
		layer_background_sprite(back_id, spr_gm_bg_invBuh);	// меняю фон инвентаря по типу инвентаря
		instance_destroy(inv_btn[2]);	// удаляем кнопку ,,использовать,,
		
		scr_inv_createCell(0, "other");	// создаю ячейки для инвентаря-контрагента
		
		inv_freeCell_other = scr_inv_calcFreeCell("other"); // количество пустых ячеек
	break;
	case "buhUpgradeInv":// инвентарь модернизации буханки
		// inv_btn[0].action = "invPrePageBuhUpgrade";
		// inv_btn[1].action = "invNextPageBuhUpgrade";
		layer_background_sprite(back_id, spr_gm_bg_invBuhUpgrade);	// меняю фон инвентаря по типу инвентаря
		instance_destroy(inv_btn[0]);	// удаляем стрелки второго инвентаря
		instance_destroy(inv_btn[1]);
		instance_destroy(inv_btn[2]);	// удаляем кнопку ,,использовать,,
		instance_destroy(inv_btn[4]);	// удаляем кнопки ,,переместить все,, ,,взять все,,
		instance_destroy(inv_btn[5]);
	break;
}

init = true;