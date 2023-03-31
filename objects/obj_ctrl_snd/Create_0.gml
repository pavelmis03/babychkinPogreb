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
ctrl_msc_arr_on = [];	//[музыка, комната, в которой он включен]

//массив включенных включенных звуков
ctrl_snd_arr_on = [];	//[звук, комната, в которой он включен]

//работает по принципу действие-звук 
//!ctrl_snd_map_ = ds_map_create();
//!ctrl_snd_map_[?"enterDoor"] = [20, "snd_menu_enterDoor"];
//!ctrl_snd_map_[?"openDoor"] = [20, "snd_menu_openDoor"];

//работает по принципу комната-музыка [priority, mysic1, mysic2...] запускаются все mysic1, mysic2...
//или
//работает по принципу комната-музыка [priority, [mysic1, mysic2...]], запускается одна из [mysic1, mysic2...]
ctrl_msc_map_ = ds_map_create();
ctrl_msc_map_[?"rm_menu_mm"] = [50, "msc_menu_mm1", "msc_menu_mm2", "msc_menu_mm3"];
ctrl_msc_map_[?"rm_menu_ldGm"] = [50, "msc_menu_mm1"];
ctrl_msc_map_[?"rm_menu_newGm"] = [50, "msc_menu_mm1"];
ctrl_msc_map_[?"rm_menu_endless"] = [50, "msc_menu_mm1"];
ctrl_msc_map_[?"rm_menu_newGm_start"] = [50, "msc_menu_mm1"];
ctrl_msc_map_[?"rm_menu_settings"] = [50, "msc_menu_mm1"];
ctrl_msc_map_[?"rm_menu_reference"] = [50, "msc_menu_mm1"];
ctrl_msc_map_[?"rm_menu_info"] = [50, "msc_menu_mm1"];
ctrl_msc_map_[?"rm_menu_dev"] = [50, "msc_menu_mm1"];
ctrl_msc_map_[?"rm_menu_journal"] = [50, "msc_menu_mm1"];
ctrl_msc_map_[?"rm_menu_stat"] = [50, "msc_menu_mm1"];
ctrl_msc_map_[?"rm_menu_editor"] = [50, "msc_menu_mm1"];
//game menu
ctrl_msc_map_[?"rm_menu_pause"] = [50, "snd_none"];
ctrl_msc_map_[?"rm_menu_lvlEnd"] = [50, "snd_none"];
ctrl_msc_map_[?"rm_menu_deathFP"] = [50, "snd_none"];
ctrl_msc_map_[?"rm_menu_deathSP"] = [50, "snd_none"];
ctrl_msc_map_[?"rm_menu_history"] = [50, "snd_none"];
ctrl_msc_map_[?"rm_menu_riddle"] = [50, "snd_none"];
ctrl_msc_map_[?"rm_menu_inv"] = [50, "snd_none"];
ctrl_msc_map_[?"rm_pixel"] = [50, "msc_menu_mm1"];
//game
	//fp
ctrl_msc_map_[?"rm_gm_fp_office"] = [50, "msc_menu_mm1"];
ctrl_msc_map_[?"rm_gm_fp_floor1"] = [50, "msc_menu_mm1"];
ctrl_msc_map_[?"rm_gm_fp_floor2"] = [50, "msc_menu_mm1"];
ctrl_msc_map_[?"rm_gm_fp_floor3"] = [50, "msc_menu_mm1"];
ctrl_msc_map_[?"rm_gm_fp_floor4"] = [50, "msc_menu_mm1"];
ctrl_msc_map_[?"rm_gm_fp_bossFloor"] = [50, "msc_menu_mm1"];
ctrl_msc_map_[?"rm_gm_fp_hole"] = [50, "msc_menu_mm1"];
ctrl_msc_map_[?"rm_gm_fp_torture"] = [50, "msc_menu_mm1"];
ctrl_msc_map_[?"rm_gm_fp_armory"] = [50, "msc_menu_mm1"];
ctrl_msc_map_[?"rm_gm_fp_parking"] = [50, "msc_menu_mm1"];
ctrl_msc_map_[?"rm_gm_fp_elevator"] = [50, ["msc_gm_lift1", "msc_gm_lift2", "msc_gm_lift3", "msc_gm_lift4"]];
	//sp
	
//other





