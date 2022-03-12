/// @description отвечает за сохранение и применение настроек, 


//main
action = "";
ctrl_stat_menu = false;		//показывает, что мы находимся в меню статистики

//interaction 
iid = 0;

//room scrolling
//нужно увеличивать комнату и прокручивать окно (если открыто много текста) или уменьшать
//0 - ничего, 1 - уменьшение, 2 - увеличение
ctrl_stat_enlarging = 0;
//ctrl_stat_scroll = false;

//drawing
//в массиве хранятся разрешения на рисование отделов: ОБЩЕЕ - true, и т.д.
ctrl_stat_arr_draw = [];
//[отдел, разрешение, количество подпунктов, значение]
//!!!ВАЖНО!!! ЕСЛИ ДОБАВЛЯТЬ СЮДА ЗНАЧЕНИЯ, ДОБАВЛЯТЬ И USER_EV(15), В DRAW(if) И В КОМНАТЕ СТАТИСТИКИ В КНОПКАХ-РАЗВЕРТКАХ !!!ВАЖНО!!!
ctrl_stat_arr_draw[0] = ["", false, 9, ""];		//общее

//массив статистики
ctrl_stat_map = ds_map_create();
ctrl_stat_map[?"gameProgress"] = "0";
ctrl_stat_map[?"plotProgress"] = "0";
ctrl_stat_map[?"subPlotProgress"] = "0";
ctrl_stat_map[?"achieveCnt"] = "0";
ctrl_stat_map[?"questCopmlete"] = "0";
ctrl_stat_map[?"specialItems"] = "0";
ctrl_stat_map[?"timeInGame"] = "0";
ctrl_stat_map[?"kill"] = "0";
ctrl_stat_map[?"death"] = "0";
ctrl_stat_map[?"getDamage"] = "0";
ctrl_stat_map[?"giveDamage"] = "0";
ctrl_stat_map[?"dist"] = "0";
ctrl_stat_map[?"shot"] = "0";
ctrl_stat_map[?"accuracy"] = "0";
ctrl_stat_map[?"hits"] = "0";
ctrl_stat_map[?"mileage"] = "0";
ctrl_stat_map[?"pumping"] = "0";
ctrl_stat_map[?"integrity"] = "0";

//interaction
ctrl_stat_arr_btn = [];

//настройки вида
view_hport[0] = room_height;
view_wport[0] = room_width;

event_user(14);	//загрузка статистики