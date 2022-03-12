/// @function scr_map_equ(map1, map2);
/// @param {} map1 массив для поиска
/// @param {} map2 элемент 
/// @description возвращает true или false, если списки равны или не равны по значениям соответственно 
function scr_map_equ(map1, map2) {
	if (ds_map_size(map1) != ds_map_size(map2)) {
		return false;
	}
	var el1 = ds_map_find_first(map1);
	var el2 = ds_map_find_first(map2);
	for (var i = 0; i < ds_map_size(map1); i++) {
		if (map1[?el1] != map2[?el2]) {
			return false;	
		}
		el1 = ds_map_find_next(map1, el1);
		el2 = ds_map_find_next(map2, el2);
	}
	return true;
}