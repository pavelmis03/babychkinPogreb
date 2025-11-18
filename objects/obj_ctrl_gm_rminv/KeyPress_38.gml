/// @description изменение ячейки в фокусе

// если нет диалога и мышь не наведена на ячейку
if ((!obj_ctrl_dlg.ctrl_dlg_exist) and (mouseOnCellId = -1)) {	
	// если мышь в левой части, то мы используем данные контроллера
	if (!mouseXSide) {	
		if (row > maxRow * (page - 1)) { 
			row--;
		}
	} else {// если же у нас мышка в правой части, то данные контрагента
		if (row > maxRow * (page_other - 1)) { 
			row--;
		}
	}
}