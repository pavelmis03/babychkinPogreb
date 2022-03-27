/// @function scr_player_type();
/// @description определяет, какой игрок присутствует в комнате и возвращает его
function scr_player_type() {
	var player = obj_player_FP;
	
	if (instance_exists(obj_player_SP)) {
		player = obj_player_SP;
	}
	if (instance_exists(obj_player_home)) {
		player = obj_player_home;
	}
	if (instance_exists(obj_player_village)) {
		player = obj_player_village;
	}
	
	return player;
}
