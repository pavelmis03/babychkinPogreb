/// @function scr_hint_inv(val, param, paramMax, str);
/// @param {} val значение, на которое изменяем параметр
/// @param {} param значение параметра, который изменяем
/// @param {} paramMax максимальное значение параметра
/// @param {} str строка для подсказки
/// @description использует предмет, если это еда и медикаменты или перекидывает в снаряжение
function scr_hint_inv(val, param, paramMax, str) {
	var tarr = [-1];
	if (val != 0) {	// если параметр изменился
		// если просто увеличиваем параметр
		if ((param + val < paramMax) and (val > 0)) {
			tarr = [str + "_up1", str + "_up2", str + "_up3"]
		}
		// если после этого восстановления параметра он достигнет максимума
		if ((param + val >= paramMax) and (param != paramMax)) {
			tarr = [str + "_full1", str + "_full2", str + "_full3"];
		}
		// Если параметр уже на максимуме и его пытаются поднять выше
		if ((param >= paramMax) and (val > 0)) {
			tarr = [str + "_over1", str + "_over2", str + "_over3"];
		}
		// если мы не увеличиваем, а уменьшаем параметр
		if (val < 0) {
			tarr = [str + "_less1", str + "_less2", str + "_less3"];
		}
	}
	// возвращаем рандомную подсказку
	return tarr[irandom_range(0, array_length(tarr) - 1)];
}































