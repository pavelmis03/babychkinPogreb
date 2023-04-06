/// @description отвечает за сохранение и применение настроек, 


//main
action = "";
ctrl_stat_menu = false;		//показывает, что мы находимся в меню статистики
ctrl_stat_path = "statistic.ini";	//путь до статистики

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
event_user(11);	//значения по умолчанию

//interaction
ctrl_stat_arr_btn = [];

//настройки вида
view_hport[0] = room_height;
view_wport[0] = room_width;

event_user(14);	//загрузка статистики