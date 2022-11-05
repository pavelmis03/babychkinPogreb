/// @description объект, отвечающий за появление на экране текстовых диалогов

//main
sprite_index = spr_sys_none;
x = -1000;
y = -1000;
depth = 100;

//main
ctrl_dlg_exist = false;		//диалог существует
ctrl_dlg_need = false;		//создать диалог? (false)
ctrl_dlg_del = false;		//удалить диалог?
ctrl_dlg_disable_btn = 0;	//показывает, что не диалоговые кнопки нужно деактивировать (0 - ничего, 1 - деактивация, 2 - активация)
action[0] = "";		//в данном случае это массив
type = "";

//drawig
draw_txt = "";				//отображаемый текст
draw_txt_x = -1000;
draw_txt_y = -1000;
draw_txt_cl = c_black;		//цвет текста


//другие
ctrl_dlg_arr_btn = [];		//созданные кнопки

//словарь глубины
ctrl_dlg_map_depth = ds_map_create();
ctrl_dlg_map_depth[?rm_menu_mm] = -100;
ctrl_dlg_map_depth[?rm_menu_ldGm] = 50;
ctrl_dlg_map_depth[?rm_menu_newGm] = 50;
ctrl_dlg_map_depth[?rm_menu_endless] = 50;
ctrl_dlg_map_depth[?rm_menu_newGm_start] = 50;
ctrl_dlg_map_depth[?rm_menu_info] = 50;
ctrl_dlg_map_depth[?rm_menu_dev] = 50;
ctrl_dlg_map_depth[?rm_menu_journal] = 50;
ctrl_dlg_map_depth[?rm_menu_stat] = 50;
ctrl_dlg_map_depth[?rm_menu_settings] = -20;
ctrl_dlg_map_depth[?rm_menu_reference] = -20;
ctrl_dlg_map_depth[?rm_menu_editor] = 50;
ctrl_dlg_map_depth[?rm_menu_pause] = -50;
ctrl_dlg_map_depth[?rm_menu_lvlEnd] = -50;
ctrl_dlg_map_depth[?rm_menu_deathFP] = -50;
ctrl_dlg_map_depth[?rm_menu_deathSP] = -50;
ctrl_dlg_map_depth[?rm_menu_history] = -50;
ctrl_dlg_map_depth[?rm_menu_riddle] = -50;
ctrl_dlg_map_depth[?rm_menu_inv] = -50;

//словарь тестов на диалогах, работает по action вызвавшей кнопки
ctrl_dlg_map_txt = ds_map_create();
//menu
ctrl_dlg_map_txt[?"exitGm"] = "Вы уверены,\nчто хотите выйти из игры?!";
ctrl_dlg_map_txt[?"backSaveSettings"] = "Хотите сохранить настройки\nперед выходом?";
ctrl_dlg_map_txt[?"defaultSettings"] = "Вы уверены,\nчто хотите сбросить настройки\nдо значений по умолчанию?";
ctrl_dlg_map_txt[?"alreadYdefaultSet"] = "Настройки уже сброшены!";
ctrl_dlg_map_txt[?"saveSettings"] = "Настройки успешно сохранены! :)";
ctrl_dlg_map_txt[?"newGm"] = "Вы уверены, что хотите\nначать игру сначала?\nВесь достигнутый Вами прогресс\nбудет потерян!";
ctrl_dlg_map_txt[?"noEditor"] = "        Извините,\nсюда пока нельзя :(";
ctrl_dlg_map_txt[?"noEndless"] = "        Извините,\nсюда пока нельзя :(";
//game
ctrl_dlg_map_txt[?"goToMM_pause"] = "Вы уверены, что хотите выйти в\nглавное меню?\nВсе несохраненные данные будут потеряны!";