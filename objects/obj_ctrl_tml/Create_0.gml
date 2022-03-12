/// @description на него вешаются таймлайны, 
	//которые не могут быть воспроизведены в другом месте (например, в roomCreationCode)


//main
action = "";
//действие которое надо выполнить по истеречении времени
//[что сделать, время]
ctrl_tml_list = ds_list_create();
//свободные таймеры
ctrl_tml_alarmFree_list = ds_list_create();
ds_list_add(ctrl_tml_alarmFree_list, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11);
//дейстиве, приписанное к таймеру
ctrl_tml_alarmAction_arr[0] = "";
ctrl_tml_alarmAction_arr[1] = "";
ctrl_tml_alarmAction_arr[2] = "";
ctrl_tml_alarmAction_arr[3] = "";
ctrl_tml_alarmAction_arr[4] = "";
ctrl_tml_alarmAction_arr[5] = "";
ctrl_tml_alarmAction_arr[6] = "";
ctrl_tml_alarmAction_arr[7] = "";
ctrl_tml_alarmAction_arr[8] = "";
ctrl_tml_alarmAction_arr[9] = "";
ctrl_tml_alarmAction_arr[10] = "";
ctrl_tml_alarmAction_arr[11] = "";
