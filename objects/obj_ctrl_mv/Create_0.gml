/// @description хранит информацию по перемещению между комнатами, отвечает за некоторые перемещения

//main
ctrl_mv_change_rm = false;	//показывает, что комната поменялась
pre_rm = rm_load;			//предыдущая комната
//работает так: кто-то добавляет в лист комнаты, потом кто-то говорит: ,,перейди в след. по списку комнату,,
//тогда контроллер переходит в первую комнату из списка и удалет ее оттуда 
next_rm = ds_list_create();		//следующие комнаты, если задан порядок перехода
action = "";

//стэк комнат
ctrl_mv_arr_mv[0] = rm_load;
ctrl_mv_arr_mv[1] = rm_menu_mm;