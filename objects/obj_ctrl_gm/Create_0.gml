/// @description контроллирует техническую часть игры (загрузка, выход и т.п.)

//main
action = "";
ctrl_gm_gm = false;		//показывает, что мы находимся в игре
ctrl_gm_phase = 1;		//чать игры (пока только два значения: 1 - First part, 2 - second)

//pixel rm
ctrl_gm_pixel_time = 3; //время пребывания в комнате пикселей (сек)

//history rm
ctrl_gm_goHistory = false; //идем ли мы в комнату истории (например, после комнаты пикселей)
ctrl_gm_goDlg = false;		//в комнату истории с целью посмотреть диалог


//event_user(14);