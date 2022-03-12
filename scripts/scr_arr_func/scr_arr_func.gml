/// @function scr_arr_fingEl(arr, el, dimension);
/// @param {} arr массив для поиска
/// @param {} el элемент 
/// @param {} dimension мерность массива
/// @description возвращает номер индекс в массиве
function scr_arr_fingEl(arr, el, dimension) {
	if (dimension == 1) {
		for (var i = 0; i < array_length(arr); i++) {
			if (el == arr[i]) {
				return i;
			}
		}
	} else {
		for (var i = 0; i < array_length(arr); i++) {
			for (var j = 0; j < array_length(arr[i]); j++) {
				if (el == arr[i][j]) {
					return [i, j];
				}
			}
		}
	}
	return -1;
}