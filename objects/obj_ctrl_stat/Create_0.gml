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
ctrl_map_stat = ds_map_create();
ctrl_map_stat[?"gameProgress"] = "0";
ctrl_map_stat[?"plotProgress"] = "0";
ctrl_map_stat[?"subPlotProgress"] = "0";
ctrl_map_stat[?"achvCnt"] = "0";
ctrl_map_stat[?"questCopmlete"] = "0";
ctrl_map_stat[?"specialItems"] = "0";
ctrl_map_stat[?"timeInGame"] = "0";
ctrl_map_stat[?"kill"] = "0";
ctrl_map_stat[?"death"] = "0";
ctrl_map_stat[?"getDamage"] = "0";
ctrl_map_stat[?"giveDamage"] = "0";
ctrl_map_stat[?"dist"] = "0";
ctrl_map_stat[?"shot"] = "0";
ctrl_map_stat[?"accuracy"] = "0";
ctrl_map_stat[?"hits"] = "0";
ctrl_map_stat[?"mileage"] = "0";
ctrl_map_stat[?"pumping"] = "0";
ctrl_map_stat[?"integrity"] = "0";

//interaction
ctrl_stat_arr_btn = [];

//настройки вида
view_hport[0] = room_height;
view_wport[0] = room_width;

event_user(14);	//загрузка статистики