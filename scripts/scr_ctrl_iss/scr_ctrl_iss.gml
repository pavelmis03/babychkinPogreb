/// @function scr_iss_findIssind(iss_id);
/// @param {} iss_id id задачи в формате 010311 (см. UE0 в ctrl iss)
/// @description ищет индекс записи в list`е задач по id задачи, возвращает индекс для list`а
function scr_iss_findIssind(iss_id) {
	// ищем, в какой строке хранится id задачи (структуру list`а см. UE0 в ctrl iss)
	for (var i = 0; i < ds_list_size(ctrl_iss_list_iss); i++) {
		// если нашли нужную строку с правильным id, возвращаем индекс
		if (ctrl_iss_list_iss[|i][0] == iss_id) {
			return i;
		}
	}
}































