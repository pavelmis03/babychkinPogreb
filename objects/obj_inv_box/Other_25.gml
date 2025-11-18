/// @description выполнение действий

switch (action) {
	// действия после выхода из инвентаря
	case "afterLeaveInv":
		// рассчет веса инвентаря 
		inv_weight = 0;
		for (var i = 0; i < ceil(maxEl / obj_ctrl_gm_inv.maxCol); i++) {
			for (var j = 0; (j < obj_ctrl_gm_inv.maxCol) and (j < maxEl - i * obj_ctrl_gm_inv.maxCol); j++) {
				var tarr = inv_items[i][j];
				if (tarr[0] != "") {					
					// количество предметов на их вес
					inv_weight += tarr[1] * global.CONST_MAP_ITEMS[?tarr[0]][1];
				}
			}
		}
	break;
}




