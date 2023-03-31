/// @description обновление массива подсказок в соответствии с частью игры

ds_map_clear(ctrl_hint_map_hint);

if (obj_ctrl_gm.ctrl_gm_stage == 1) {
	//с помощью этой подсказки определяю, обновлен ли массив в соответствии с частью игры (см. степ)
	ctrl_hint_map_hint[?"gmPart"] = "1";	//1, если первая, 2, если вторая
	//["hint", priority, liveTime (sec), time_reload] чем больше число, тем выше приоритет
	//последний параметр - сколько времени осталось до того, как подсказку можно будет использовать еще раз 
	//последний параметр только для рандомых подсказок (RH_)
	ctrl_hint_map_hint[?"openDoor"] = ["Нажимай Е, чтобы открыть её!", 100, 1.5, 0]; //открыть дверь
	ctrl_hint_map_hint[?"take_inv"] = ["Жми Е и поднимай!", 100, 1.5, 0];
	ctrl_hint_map_hint[?"useIt"] = ["Жми Е и сделай уже это!", 100, 2, 0];		//использовать
	ctrl_hint_map_hint[?"sitCar"] = ["Клацай Е, заводи и погнали!", 100, 2, 0];	//сесть в машину
	
	//удаление ненужных (из второй части)
	ds_map_delete(ctrl_hint_map_hint, "RH_petrovich");
	ds_map_delete(ctrl_hint_map_hint, "RH_khe");
	ds_map_delete(ctrl_hint_map_hint, "RH_worried");
	ds_map_delete(ctrl_hint_map_hint, "RH_shiz");
}

if (obj_ctrl_gm.ctrl_gm_stage == 2) {
	ctrl_hint_map_hint[?"gmPart"] = "2";
	//random hint (RH_) - подсказки, которые будут выводиться раз в некоторое время, как мысли
	ctrl_hint_map_hint[?"RH_petrovich"] = ["Интересно, сколько спирта\nможет выпить Петрович \nза раз?", 1, 3, 0];
	ctrl_hint_map_hint[?"RH_khe"] = ["Кхе-кх... Прохладно здесь", 1, 3, 0];
	ctrl_hint_map_hint[?"RH_worried"] = ["Что-то неспокойно мне...", 1, 3, 0];
	ctrl_hint_map_hint[?"RH_shiz"] = ["Эй, крыша, как поживаешь?", 1, 3, 0];
	
	
	//удаление ненужных (из первой части)
	ds_map_delete(ctrl_hint_map_hint, "openDoor");
	ds_map_delete(ctrl_hint_map_hint, "take_inv");
	ds_map_delete(ctrl_hint_map_hint, "useIt");
	ds_map_delete(ctrl_hint_map_hint, "sitCar");
}
