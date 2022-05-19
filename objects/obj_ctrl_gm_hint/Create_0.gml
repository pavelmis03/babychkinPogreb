/// @description контроллер всевозможных подсказок, выводящихся над игроком

//main
action = "";

//drawing
draw_txt = "";		//строка подсказки
draw_txt_x = 0;
draw_txt_y = 0;

ctrl_hint_hint_map = ds_map_create();
//с помощью этой подсказки определяю, обновлен ли массив в соответствии с частью игры (см. степ)
ctrl_hint_hint_map[?"gmPart"] = "1";	//1, если первая, 2, если вторая
ctrl_hint_hint_map[?""] = "";
ctrl_hint_hint_map[?""] = "";
ctrl_hint_hint_map[?""] = "";
ctrl_hint_hint_map[?""] = "";
ctrl_hint_hint_map[?""] = "";
ctrl_hint_hint_map[?""] = "";
ctrl_hint_hint_map[?""] = "";
ctrl_hint_hint_map[?""] = "";
ctrl_hint_hint_map[?""] = "";
ctrl_hint_hint_map[?""] = "";
ctrl_hint_hint_map[?""] = "";
ctrl_hint_hint_map[?""] = "";


