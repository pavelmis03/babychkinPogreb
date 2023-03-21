/// @description сохранение игры

//обновляем информацию по сохранениям (теперь это сохранение действительное)
ini_open(ctrl_sv_svDir + "/saveInfo.ini");
//действительность сохранения
ini_write_real("MAIN", "saveValid", 1);
ini_write_string("MAIN", "lastRoom", room_get_name(room));	//комната, с которой начинаем загрузку
//информация для отображения в меню загрузок
ini_write_string("SAVE_INFO", "dateTime", date_datetime_string(date_current_datetime()));
ini_write_string("SAVE_INFO", "dateTimeInGame", string("/*игровые дата и время*/"));
ini_write_string("SAVE_INFO", "quest", string("/*название квеста*/"));
ini_write_string("SAVE_INFO", "location", string("/*локация*/"));
ini_write_string("SAVE_INFO", "name", string(irandom(99999)));	//имя, которое потом сохранится в родителя
ini_close();

//сохраняем информацию о том, что было произведено сохранение
//нужно для контроллера игры, который удаляет папку сохранений игры при выходе в ММ, если не было ни одного сохранения
ini_open(ctrl_sv_gmDir + "/save_cmn.ini");
ini_write_real("SAVES", "save_number", ini_read_real("SAVES", "save_number", 0) + 1);
ini_close();

//создание скриншота для меню загрузок
screen_save(ctrl_sv_svDir + "/svScreenShot.png");

//создаем новое недействительное сохранение
event_user(7);

//вывод подсказки о том, что игра сохранена
obj_ctrl_gm_img.action = "gameSaveAlert";


