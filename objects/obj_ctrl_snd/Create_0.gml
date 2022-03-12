/// @description отвечает за музыку и звуки, включает их


//main 
sound = [];		//массив звуков, которые надо проиграть и их приоритет
action = "";	//действие 
iid = 0;		///id того, кто назначил действие

//playing snd & music
ctrl_snd_vol = real(obj_ctrl_set.ctrl_set_map_curr[?"sound_val"] / 100);	//громкость музыки и звуков
ctrl_msc_vol = real(obj_ctrl_set.ctrl_set_map_curr[?"music_val"] / 100);
action = "sndChange";	//меняем громкость в соответствии с настройками

//массив включенной музыки 
ctrl_msc_arr_on = [];

//массив включенных звуков
//!ctrl_snd_arr_on = [];

//работает по принципу действие-звук 
//!ctrl_snd_map = ds_map_create();
//!ctrl_snd_map[?"enterDoor"] = [20, "snd_menu_snd_enterDoor"];
//!ctrl_snd_map[?"openDoor"] = [20, "snd_menu_snd_openDoor"];

//работает по принципу комната-музыка
ctrl_msc_map = ds_map_create();
ctrl_msc_map[?"rm_menu_mm"] = [50, "snd_menu_msc_mm1", "snd_menu_msc_mm2", "snd_menu_msc_mm3"];
ctrl_msc_map[?"rm_menu_editor"] = [50, "snd_menu_msc_mm2"];
ctrl_msc_map[?"rm_menu_settings"] = [50, "snd_menu_msc_mm1"];
ctrl_msc_map[?"rm_menu_info"] = [50, "snd_menu_msc_mm1"];
ctrl_msc_map[?"rm_menu_dev"] = [50, "snd_menu_msc_mm1"];
ctrl_msc_map[?"rm_menu_journal"] = [50, "snd_menu_msc_mm1"];
ctrl_msc_map[?"rm_menu_stat"] = [50, "snd_menu_msc_mm1"];