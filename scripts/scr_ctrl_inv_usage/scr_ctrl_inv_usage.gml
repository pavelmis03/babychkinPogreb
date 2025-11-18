/*
	// использование предмета
*/



/// @function scr_inv_useItem(tid);
/// @param {} tid - id ячейки, к которой применяем действие
/// @description использует предмет, если это еда и медикаменты или перекидывает в снаряжение
function scr_inv_useItem(tid) {
	randomize();
	var ctrl = obj_ctrl_gm_rmInv;
	if (tid.cell_obj != "") {	// если это не пустая клетка 
		if (tid.inv_use == "Использование") {	// если предмет можно использовать 
			if (ctrl.inv_type == "normalInv") {	// для снаряжения только в обычном инвентаре
				if (tid.inv_type == "Снаряжение") {	// перемещаем в ячейку инвентаря снаряжения
					if (tid.cell_owner == "ctrl") {	// если эта ячейка относится к контроллеру инвентаря
						// переместить можно из инвентаря в снаряжение, но не наоборот
						ctrl.action = "invMoveCellFromI";
					
						// подсказка по сняряжению
						var hintArr = ["equ_get1", "equ_get2", "equ_get3", "equ_get4", "equ_get5", ];
						// подсказка специально для пистолета
						if (scr_arr_findEl(["Пистолет", "ПистолетМ1"], ctrl.inv_items[tid.cell_numR][tid.cell_numC][0], 1) != -1) {
							array_push(hintArr, "equ_get_пистолет");
						}
						hintArr = array_shuffle(hintArr);
						obj_ctrl_gm_hint.ctrl_hint_newHint = hintArr[irandom_range(0, array_length(hintArr) - 1)];
					}
				} 
			}
			ctrl = obj_ctrl_gm_playerStatus;
			if (tid.inv_type == "Еда и медикаменты") { // изменяем характеристики
				var arr = global.CONST_MAP_PRODUCT[?tid.cell_obj];	// характеристики предмета
				
				// var thp = ctrl.hp, tfood = ctrl.player_food, twater = ctrl.player_water, ttemp = ctrl.player_temp, tcrazy = ctrl.player_crazy, trun = ctrl.player_runPower;
				var thp = irandom_range(arr[0][0], arr[0][1]);
				var tfood = irandom_range(arr[1][0], arr[1][1]);
				var twater = irandom_range(arr[2][0], arr[2][1]);
				var ttemp = irandom_range(arr[3][0], arr[3][1]);
				var tcrazy = irandom_range(arr[4][0], arr[4][1]);
				var trun = irandom_range(arr[5][0], arr[5][1]);
				var hintArr = [];
				
				// добавляем подсказку по жизням
				array_push(hintArr, scr_hint_inv(thp, ctrl.hp, ctrl.hpMax, "hp"));
				if (hintArr[array_length(hintArr) - 1] == -1) {
					array_pop(hintArr);
				}
				// изменяем параметры в заданном диапазоне
				// (Не парюсь по поводу изменения, потому что контроллер состояний все поправит)
				ctrl.hp += irandom_range(arr[0][0], arr[0][1]);	
				
				// добавляем подсказку по жизням
				array_push(hintArr, scr_hint_inv(tfood, ctrl.player_food, ctrl.player_foodMax, "food"));
				if (hintArr[array_length(hintArr) - 1] == -1) {
					array_pop(hintArr);
				}
				// изменяем параметры в заданном диапазоне
				// (Не парюсь по поводу изменения, потому что контроллер состояний все поправит)
				ctrl.player_food += irandom_range(arr[1][0], arr[1][1]);	
				
				// добавляем подсказку по жизням
				array_push(hintArr, scr_hint_inv(twater, ctrl.player_water, ctrl.player_waterMax, "water"));
				if (hintArr[array_length(hintArr) - 1] == -1) {
					array_pop(hintArr);
				}
				// изменяем параметры в заданном диапазоне
				// (Не парюсь по поводу изменения, потому что контроллер состояний все поправит)
				ctrl.player_water += irandom_range(arr[2][0], arr[2][1]);	
				
				// добавляем подсказку по жизням
				array_push(hintArr, scr_hint_inv(ttemp, ctrl.player_tempMax, ctrl.player_tempMax, "temp"));
				if (hintArr[array_length(hintArr) - 1] == -1) {
					array_pop(hintArr);
				}
				// изменяем параметры в заданном диапазоне
				// (Не парюсь по поводу изменения, потому что контроллер состояний все поправит)
				ctrl.player_temp += irandom_range(arr[3][0], arr[3][1]);	
				
				// добавляем подсказку по жизням
				array_push(hintArr, scr_hint_inv(tcrazy, ctrl.player_crazy, ctrl.player_crazyMax, "crazy"));
				if (hintArr[array_length(hintArr) - 1] == -1) {
					array_pop(hintArr);
				}
				// изменяем параметры в заданном диапазоне
				// (Не парюсь по поводу изменения, потому что контроллер состояний все поправит)
				ctrl.player_crazy += irandom_range(arr[4][0], arr[5][1]);	
				
				// добавляем подсказку по жизням
				array_push(hintArr, scr_hint_inv(trun, ctrl.player_runPower, ctrl.player_runPowerMax, "run"));
				if (hintArr[array_length(hintArr) - 1] == -1) {
					array_pop(hintArr);
				}
				// изменяем параметры в заданном диапазоне
				// (Не парюсь по поводу изменения, потому что контроллер состояний все поправит)
				ctrl.player_runPower += irandom_range(arr[5][0], arr[5][1]);	
				
				// выбираю подсказку из массива собранных подсказок, предварительно перемешав его
				hintArr = array_shuffle(hintArr);
				obj_ctrl_gm_hint.ctrl_hint_newHint = hintArr[irandom_range(0, array_length(hintArr) - 1)];
				

				obj_ctrl_gm_rmInv.action = "invDelItemAfterUse";	// удаляем использованный предмет
			} 
		}
		inv_freeCell = scr_inv_calcFreeCell("ctrl"); // количество пустых ячеек
	}
}
	











