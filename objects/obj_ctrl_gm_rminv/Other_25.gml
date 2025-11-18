/// @description выполнение действия
var tid = obj_ctrl_gm_rmInv.cellId;	// id той ячейки, откуда берем инфу

switch (action) {
	// удаление вызов диалога или удаление сразу. предудаление
	case "invCheckDelCell": 
		if (cellId == -1) {	// если руки пустые
			var arr, tarr_items, owner;
			if (!mouseXSide) {	// в зависимости от того, с кем работаем, создаем ссылку на массив предметов ctrl или other
				tarr_items = inv_items;
				owner = "ctrl";
			} else {
				tarr_items = inv_items_other;
				owner = "other";
			}
			arr = global.CONST_MAP_ITEMS[?tarr_items[row][col][0]];
			if (arr[4] != "Сюжетный") {	// сюжетные предметы нельзя удалять
				if ((keyboard_check(vk_shift)) or (inv_btn[3].btn_pressed)) {	// если нажат шифт (или кнопка удалить ячейку), то удаляем сразу пачку
					if (tarr_items[row][col][1] > 1) {	// вызываем диалог, если предметов в ячейке больше одного
						// диалог подтверждения
						obj_ctrl_dlg.ctrl_dlg_need = true;
						obj_ctrl_dlg.type = "confirmYNCl";
						if (owner == "ctrl") {
							obj_ctrl_dlg.action = ["invDelCell", "cansel", "cansel"];	
						} else {
							obj_ctrl_dlg.action = ["invDelCell_other", "cansel", "cansel"];	
						}
					} else {
						scr_inv_delItem(1, owner, "delBox");	// если предмет один, просто удаляем его
					}
				} else {
					scr_inv_delItem(1, owner, "delBox");	// если шифт не нажат, то удаляем только один предмет
				}
			} else {
				// диалог предупреждения
				obj_ctrl_dlg.ctrl_dlg_need = true;
				obj_ctrl_dlg.type = "confirmYCl";
				obj_ctrl_dlg.action = ["invPlotItem", "cansel"];	
			}
		}
		action = "";
	break;
	// удаление всех предметов из ячейки-контрагента
	case "invDelCell_other": 
		scr_inv_delItem(inv_items_other[row][col][1], "other", "delBox");
		action = "";
	break;
	// удаление всех предметов из ячейки
	case "invDelCell": 
		scr_inv_delItem(inv_items[row][col][1], "ctrl", "delBox");
		action = "";
	break;
	// удаление предмета из ячейки
	case "invDelItemAfterUse": 
		if (!mouseXSide) {	// в зависимости от того, с кем работаем, создаем ссылку на массив предметов ctrl или other
			scr_inv_delItem(1, "ctrl", "delUse");
		} else {
			scr_inv_delItem(1, "other", "delUse");
		}
		action = "";
	break;
	// взять все предметы из инвентаря-контрагента
	case "invTakeAll":
		// перемещаем в контроллер
		scr_inv_moveItemAll("ctrl");
		action = "calcFreeCell";
	break;
	// положить все предметы в инвентарь-контрагент
	case "invPutAll":
		// перемещаем в контрагента
		scr_inv_moveItemAll("other");
		action = "calcFreeCell";
	break;
	// перемещение ячейки инвентаря соседа в наш инвентарь
	// case "invMoveCellFromO": // не используется
	// 	scr_inv_moveItem(inv_items[row][col][1], "ctrl", row, col);
	// 	action = "";
	// break;
	// перемещение ячейки в инвентарь соседа
	case "invMoveCellFromI": 
		scr_inv_moveItem(inv_items[row][col][1], "other", row, col);
		action = "";
	break;
	// перемещение предмета инвентаря соседа в наш инвентарь
	// case "invMoveItemFromO": 
	// 	scr_inv_moveItem(1, "ctrl", row, col);
	// 	action = "";
	// break;
	//// перемещение предмета в инвентарь соседа
	// case "invMoveItemFromI": 
	// 	scr_inv_moveItem(1, "other", row, col);
	// 	action = "";
	// break;
	// следующая страница нашего инвентаря
	case "invNextPage": 
		if (page < maxPage) {
			page++;
			scr_inv_changePage(true);	// действия при перелистывании страинцы
		}
		action = "";
	break;
	// предыдущая страница нашего инвентаря
	case "invPrePage": 
		if (page > 1) {
			page--;
			scr_inv_changePage(false);	// действия при перелистывании страинцы
		}
		action = "";
	break;
	// следующая страница инвентаря модернизации буханки
	// case "invNextPageBuhUpgrade": 
	// 	obj_ctrl_gm_rmInv.action = "invNextPageBuhUpgrade";
	// 	action = "";
	// break;
	//// предыдущая страница инвентаря модернизации буханки
	// case "invPrePageBuhUpgrade": 
	// 	obj_ctrl_gm_rmInv.action = "invPrePageBuhUpgrade";
	// 	action = "";
	// break;
	// следующая страница инвентаря буханки
	case "invNextPageBuh": 
		if (page_other < maxPage_other) {
			page_other++;
			scr_inv_changePage(true);	// действия при перелистывании страинцы
		}
		action = "";
	break;
	// предыдущая страница инвентаря буханки
	case "invPrePageBuh": 
		if (page_other > 1) {
			page_other--;
			scr_inv_changePage(false);	// действия при перелистывании страинцы
		}
		action = "";
	break;
	// следующая страница инвентаря крафта 
	// case "invNextPageCraft": 
	// 	obj_ctrl_gm_rmInv.action = "invNextPageCraft";
	// 	action = "";
	// break;
	//// предыдущая страница инвентаря крафта 
	// case "invPrePageCraft": 
	// 	obj_ctrl_gm_rmInv.action = "invPrePageCraft";
	// 	action = "";
	// break;
	// следующая страница инвентаря продавца
	case "invNextPageSeller": 
		if (page_other < maxPage_other) {
			page_other++;
			scr_inv_changePage(true);	// действия при перелистывании страинцы
		}
		action = "";
	break;
	// предыдущая страница инвентаря продавца
	case "invPrePageSeller": 
		if (page_other > 1) {
			page_other--;
			scr_inv_changePage(false);	// действия при перелистывании страинцы
		}
		action = "";
	break;
	// следующая страница инвентаря коробки
	case "invNextPageBox": 
		if (page_other < maxPage_other) {
			page_other++;
			scr_inv_changePage(true);	// действия при перелистывании страинцы
		}
		action = "";
	break;
	// предыдущая страница инвентаря коробки
	case "invPrePageBox": 
		if (page_other > 1) {
			page_other--;
			scr_inv_changePage(false);	// действия при перелистывании страинцы
		}
		action = "";
	break;
	// рассчитываем количество пустых страниц и вес инвентаря-контрагента
	case "calcFreeCell": 
		inv_freeCell_other = scr_inv_calcFreeCell("other"); // количество пустых ячеек и вес
		inv_freeCell = scr_inv_calcFreeCell("ctrl"); // количество пустых ячеек и вес
		action = "";
	break;
}