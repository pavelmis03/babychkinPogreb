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
ctrl_dlg_arr_btn[0] = -1;
ctrl_dlg_arr_btn[1] = -1;
ctrl_dlg_arr_btn[2] = -1;

//словарь глубины
ctrl_dlg_map_depth = ds_map_create();
ctrl_dlg_map_depth[?rm_menu_mm] = -100;
ctrl_dlg_map_depth[?rm_menu_ldGm] = -100;
ctrl_dlg_map_depth[?rm_menu_newGm] = -100;
ctrl_dlg_map_depth[?rm_menu_endless] = 50;
ctrl_dlg_map_depth[?rm_menu_newGm_start] = -100;
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
ctrl_dlg_map_txt[?"exitGm"] = @"Вы уверены, что хотите выйти из игры?!";
//меню загрузки
ctrl_dlg_map_txt[?"nothingSv"] = @"Сохранений нет хотите начать новую игру?";
ctrl_dlg_map_txt[?"ldSv"] = "Загрузить это сохранение?";
ctrl_dlg_map_txt[?"delSv"] = @"Вы уверены, что хотите 
							удалить это сохранение?
							Отменить это действие будет невозможно!";
////если есть ветвь в данном сохранении, выводим предупреждение
ctrl_dlg_map_txt[?"delSv1"] = @"Вы уверены, что хотите 
							удалить это сохранение?

							Все ветви (развилки) сохранений, 
							начатые из этого сохранения
							после того, как были созданы 
							более поздние по сюжету сохранения,
							будут удалены.
							Отменить это действие будет невозможно!";
ctrl_dlg_map_txt[?"delGm"] = @"Это действие приведет к
								удалению всех сохранений 
								данной игровой сессии.
								Вы уверены, что хотите продолжить?
								Отменить это действие будет невозможно!";
//меню настроек
ctrl_dlg_map_txt[?"backSaveSettings"] = @"Хотите сохранить настройки перед выходом?";
ctrl_dlg_map_txt[?"defaultSettings"] = @"Вы уверены, что хотите сбросить настройки
										до значений по умолчанию?";
ctrl_dlg_map_txt[?"alreadYdefaultSet"] = "Настройки уже сброшены!";
ctrl_dlg_map_txt[?"saveSettings"] = "Настройки успешно сохранены! :)";
//новая игра
ctrl_dlg_map_txt[?"newGm"] = @"Вы уверены, что хотите начать новую игровую сессию?";
ctrl_dlg_map_txt[?"newGmErr"] = @"Извините, создать новую игру нельзя:
								уже создано 5 игровых сессий.
								Вы можете продолжить игру
								в одной из уже существующих сессий
								или удалить одну из них,
								после чего начать новую игру.";
//
ctrl_dlg_map_txt[?"noEditor"] = @"Извините, сюда пока нельзя :(";
ctrl_dlg_map_txt[?"noEndless"] = @"Извините, сюда пока нельзя :(";
//game
ctrl_dlg_map_txt[?"goToMM_pause"] = @"Вы уверены, что хотите выйти в главное меню?
									Все несохраненные данные будут потеряны!";