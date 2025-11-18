/// @description изменение ячейки в фокусе

// если нет диалога и мышь не наведена на ячейку
if ((!obj_ctrl_dlg.ctrl_dlg_exist) and (mouseOnCellId = -1)) {	
	// если у нас инвентари с квадратным полем, то у них такие же размеры, как у нашего
	if ((scr_arr_findEl(["sellerInv", "boxInv", "buhInv"], inv_type, 1) != -1) or (!mouseXSide)) {	
		if (col < maxCol - 1) { 
			col++;
		}
	} else {// если же у нас мышка в правой части и инвентарь необычный 
		if (col < array_length(inv_items_other[0]) - 1) { 
			col++;
		}
	}
}