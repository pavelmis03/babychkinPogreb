/// @description контроллирует техническую часть игры (загрузка, выход и т.п.)

//main
action = "";
//ctrl_gm_phase = 0;		//0 - меню, 1 - игра, 2 - пауза, 3 - комнаты истории, диалогов, 4 - меню смерти
ctrl_gm_stage = 1;		//чать игры (пока только два значения: 1 - First part, 2 - second)

//pixel rm
ctrl_gm_pixel_time = 3; //время пребывания в комнате пикселей (сек)

//history rm
ctrl_gm_goHistory = false; //идем ли мы в комнату истории (например, после комнаты пикселей)
ctrl_gm_goDlg = false;		//в комнату истории с целью посмотреть диалог

//перемещение по комнатам
//список комнат, которые посетил игрок с момента последнего сохранения или начала игры
ctrl_gm_changedRm = ds_list_create();


//event_user(14);