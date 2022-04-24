/// @function scr_ctrl_inv();
/// @description эта функция добаляет предмет в инвентарь, если это позволяет инвентарь 

function scr_inv_addItem(){
	//далее описаны локальные перемнные
	var invItems = obj_ctrl_gm_inv.ctrl_inv_items;   //двумерный массив инвентаря   
	var maxWeight = obj_ctrl_gm_inv.ctrl_inv_maxWeight;  //маскимальный вес инвентаря
	var weightInv = obj_ctrl_gm_inv.ctrl_inv_weight;  //текущий вес инвентаря
	var map_invItems = obj_ctrl_gm_inv.ctrl_inv_map_items; //словарь, содержащий количество предметов в инвентаре

	for (var i = 0; i < obj_ctrl_gm_inv.ctrl_inv_maxRow; i++) {
		for (var j = 0; j < obj_ctrl_gm_inv.ctrl_inv_maxCol; j++) {
			var cell = invItems[i][j];      //ячейка инвентаря
			if ((cell[0] == "") or (cell[0] == inv_name)) { //если она пустая или соответствует подбираемому предмету
				//новое допустимое значение веса, если подобрать все предметы
				var new_weight = clamp(weightInv + (inv_weight * inv_cnt), weightInv, maxWeight);
			    //новое допустимое значение количества предметов в ячейке, если подобрать все предметы
			    var new_cell = clamp(cell[1] + inv_cnt, cell[1], inv_maxCntCell);
			    //новое допустимое значение количества предметов во всём инвенторе, если подобрать все предметы
			    var new_inv = clamp(map_invItems[?inv_name] + inv_cnt, map_invItems[?inv_name], inv_maxCntInv);
			    //количество предметов которые можно добавить в инвентарь по максимальному весу,
			    //количеству предметов на инвентарь и количеству предметов на ячейку
			    var addCnt = min((new_weight - weightInv) / inv_weight, new_cell - cell[1], new_inv - map_invItems[?inv_name]);
			    //cell[0] - это название предмета
			    //cell[1] - это количество предметов в ячейке
			    cell[0] = inv_name; 
			    cell[1] += addCnt;
			    invItems[i][j] = cell;
			    //ОБНОВЛЕНИЕ ПЕРЕМЕННЫХ В КОНТРОЛЛЕРЕ ИНВЕНТАРЯ
			    obj_ctrl_gm_inv.ctrl_inv_weight += addCnt * inv_weight; 
			    inv_cnt -= addCnt;          
			    map_invItems[?inv_name] += addCnt;      
			    //ds_map_copy()           
			    obj_ctrl_gm_inv.ctrl_inv_map_items = map_invItems;  
			}
		}
	}
	obj_ctrl_gm_inv.ctrl_inv_items = invItems;
}
