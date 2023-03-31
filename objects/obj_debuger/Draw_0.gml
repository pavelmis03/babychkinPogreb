/// @description
if (instance_exists(obj_player_FP)) {
	draw_set_color(c_white);	
	/*
	draw_text(100, 100, "direction: " + string(obj_player_FP.direction));
	//x + lengthdir_x(100, t)
	draw_text(100, 130, obj_player_FP.player_moveType);
	for (var i = 0; i < ds_list_size(obj_player_FP.player_list_move_key); i++) {
		draw_text(100 + i * 40, 160, obj_player_FP.player_list_move_key[|i]);
	}

	//коллизии
	draw_text(100, 260, "коллизии");
	var t1 = obj_player_FP.player_map_col[?"enemy"];
	var t2 = obj_player_FP.player_map_col[?"inv"];
	if (instance_exists(t1)) {
		draw_text(100, 280, string(object_get_name(t1.object_index)));
	} else {
		draw_text(100, 280, string(0));
	}
	if (instance_exists(t2)) {
		draw_text(100, 300, string(object_get_name(t2.object_index)));
	} else {
		draw_text(100, 300, string(0));
	}
	*/
	//draw_text(100, 100, "id: " + string(obj_player_FP.id));
}