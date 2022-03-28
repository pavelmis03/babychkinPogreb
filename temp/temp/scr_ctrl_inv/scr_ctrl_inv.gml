/// @function scr_ctrl_inv(params);
/// @description 
function scr_inv_addItem(){
	var invItem = obj_ctrl_gm_inv.ctrl_inv_items;
	var maxWeight = obj_ctrl_gm_inv.ctrl_inv_maxWeight;
	var weightInv = obj_ctrl_gm_inv.ctrl_inv_weight;
	
	for (var i = 0; i < obj_ctrl_gm_inv.ctrl_inv_maxRow; i++) {
		for (var j = 0; j < obj_ctrl_gm_inv.ctrl_inv_maxCol; j++) {
			var cell = invItem[i][j];
			var dif_weight = clamp(weightInv + (inv_weight * inv_cnt), weightInv, maxWeight);
			var dif_cell = clamp(cell[1] + inv_cnt, cell[1], inv_maxCntCell);
			var dif_inv = clamp(inv_cntInv + )
			if (cell[0] == "") {
				cell[0] = inv_name;
				cell[1] = inv_cnt;
				////////////////
			} else if (cell[0] == inv_name) {
				if (cell[1] < inv_maxcnt_cell) {
					cell[1] += dif_cell;
					inv_cnt -= dif_cell;
				}
			}
		}
	}
}