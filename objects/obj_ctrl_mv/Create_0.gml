/// @description хранит информацию по перемещению между комнатами, отвечает за некоторые перемещения

//main
ctrl_mv_change_rm = false;	//показывает, что комната поменялась
pre_rm = rm_load;			//предыдущая комната
next_rm = rm_menu_mm;		//следующая комната
action = "";

ctrl_mv_arr_mv[0] = rm_load;
ctrl_mv_arr_mv[1] = rm_menu_mm;