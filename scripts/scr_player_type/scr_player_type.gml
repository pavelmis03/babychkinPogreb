/// @function scr_player_type();
/// @description определяет, какой игрок присутствует в комнате и возвращает его
function scr_player_type() {
	var player = -1;
	var arr = obj_ctrl_gm_playerStatus.player_arr;
	
	//ищем по массиву игроков того, что существует
	for (var i = 0; i < array_length(arr); i++) {
		if (instance_exists(arr[i])) {
			player = arr[i];
			break;	//прекращаем поиск, потому что в массиве игроков есть буханка, если никто не был найден
		}
	}
	/*
	if (instance_exists(obj_player_FP)) {
		player = obj_player_FP;
	}
	if (instance_exists(obj_player_SP)) {
		player = obj_player_SP;
	}
	if (instance_exists(obj_player_home)) {
		player = obj_player_home;
	}
	if (instance_exists(obj_player_village)) {
		player = obj_player_village;
	}
	*/
	return player;
}
