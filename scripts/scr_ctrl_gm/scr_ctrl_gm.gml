/// @function scr_gm_phase();
/// @description эта функция возвращает фазу игры, определяя ее по комнатам: 0 - menu, 1 - game, 2 - history&dialog

function scr_gm_phase() {
	var phase = -1;
	var name = room_get_name(room);
	
	if (string_copy(name, 0, 7) == "rm_menu" or room == rm_pixel) {
		phase = 0;
	}
	
	if (string_copy(name, 0, 5) == "rm_gm") {
		phase = 1;
	}
	
	if (room == rm_menu_history) {
		phase = 2;
	}
	
	return phase;
}
