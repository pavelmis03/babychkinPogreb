/// @description отвечает за сохранение и применение настроек


//main
action = "";
ctrl_set_change = false;	//сообщает об изменениях в настройках


//interaction 
iid = 0;


//settings
ctrl_set_map_def = ds_map_create();		//константный массив настроек
ctrl_set_map_curr = ds_map_create();	//массив текущих настроек
//(когда мы меняем настройки в комнате настроек, 
//этот массив запоминает предыдущее состояние настроек, чтобы можно было откатить)
ctrl_set_map_pre = ds_map_create();		//массив предыдущих настроек 

ctrl_set_map_def[?"music_val"] = 100;
ctrl_set_map_def[?"sound_val"] = 100;
ctrl_set_map_def[?"music"] = true;
ctrl_set_map_def[?"sound"] = true;
ctrl_set_map_def[?"buhankaMvJL"] = false;
ctrl_set_map_def[?"gridMv"] = false;
//нормальный, для настоящих пацанов, Для отбитых безумцев
ctrl_set_map_def[?"difficultyLvl"] = "Твой брат на таком играет";
ctrl_set_map_def[?"screenMode"] = "Полноэкранный";	//window
//1366x768, 1280x1024, 1024x768
ctrl_set_map_def[?"screenResolution"] = "1920x1080";
ctrl_set_map_def[?"effects"] = true;
ctrl_set_map_def[?"hints"] = true;
ctrl_set_map_def[?"pixels"] = true;	//заполнение экрана пикселями



event_user(14);	//загрузка настроек
