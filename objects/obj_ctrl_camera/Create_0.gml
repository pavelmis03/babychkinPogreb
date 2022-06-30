/// @description отвечает за настройку вида игрока и разрешение экрана


//main
action = ""


//настройка режима экрана
if (obj_ctrl_set.ctrl_set_map_curr[?"screenMode"] = "Полноэкранный") {
	window_set_fullscreen(1);
} else {
	window_set_fullscreen(0);
	var t = obj_ctrl_set.ctrl_set_map_curr[?"screenResolution"];
	var w = string_copy(t, 0, string_pos("x", t) - 1);
	var h = string_copy(t, string_pos("x", t) + 1, 10);
	window_set_size(real(w), real(h))
}
//выравнивание окна по центру
alarm[1] = 1;