/// @description
draw_set_color(c_white);	
draw_text(100, 100, "direction: " + string(obj_player_FP.direction));
//x + lengthdir_x(100, t)
draw_text(100, 130, obj_player_FP.player_moveType);
for (var i = 0; i < ds_list_size(obj_player_FP.player_move_key_list); i++) {
	draw_text(100 + i * 40, 160, obj_player_FP.player_move_key_list[|i]);
}