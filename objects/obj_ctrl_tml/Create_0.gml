/// @description на него вешаются таймлайны, 
	//которые не могут быть воспроизведены в другом месте (например, в roomCreationCode)

//need_sv = 2;

//main
action = "";
//действие которое надо выполнить по истеречении времени
//[что сделать, время]
ctrl_tml_list_ = ds_list_create();
//свободные таймеры
ctrl_tml_list_alarmFree = ds_list_create();
ds_list_add(ctrl_tml_list_alarmFree, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11);
//действие, приписанное к таймеру
for (var i = 0; i < 12; i++) {
	ctrl_tml_alarmAction_arr[i] = "";
}

