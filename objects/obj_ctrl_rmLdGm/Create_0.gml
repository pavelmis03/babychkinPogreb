/// @description этот объект отвечает за некоторые действия, происходящие в меню загрузки игры
// ОН ЛОКАЛЬНЫЙ
//действия:
	//отрисовка формы загрузок
	//перемещенние по сохранениям и загрузка оных в форму
	//перемещение по играм и подгрузка сохранений из папки
	//вывод информации о сохранении
	//загрузка игры с нужными параметрами

//main
action = "";

//drawing
draw_img = spr_sys_none;	//спрайт скриншота сохранения
draw_txt_x = room_width * 0.71;	//координаты отрисовки скрина
draw_txt_y = room_height * 0.3;

//работа с сохранениями
btn_loaderId = [];	//массив id кнопок-сохранения
btn_loaderNum = 0;	//номер кнопки в массиве btn_loaderIds, которая сейчас в фокусе
ctrl_ldGm_sv_curr = 0;	//текущее сохранение (номер сохранения в массиве путей сохранений (начинается с 0)
ctrl_ldGm_sv_currPath = "";	//текущее сохранение (путь)
ctrl_ldGm_sv = 0;		//всего сохранений (это для меня)
ctrl_ldGm_svPaths = [];	//пути сохранений
ctrl_ldGm_page_curr = 0; //текущая страница сохранений (для пользователя)
ctrl_ldGm_svOnPage = 5; // количество сохранений на странице
ctrl_ldGm_page = 1;	 //всего страниц (делим на количество сохранений на странице)
ctrl_ldGm_gm_curr = 0;	//текущая игра (начинается с 0 до 4)
ctrl_ldGm_gm_currPath = "";	//текущая игра (путь)
var n = 0;
while (directory_exists("saves/game_" + string(n))) {
	n++;
}
ctrl_ldGm_gm = n;		//всего игр

//автоподстановка последних игры и сохранения
if (file_exists("gameInfo.ini")) {
	ini_open("gameInfo.ini");
	//если игры не существует, мы до этой строки просто не дойдем т.к. при попытке зайти 
	//в меню загрузок начнется новая игра, аналогично с сохранением
	var str = ini_read_string("GAMEINFO", "lastGame", "saves/game_0");
	ctrl_ldGm_gm_currPath = str;	//путь игры
	ctrl_ldGm_gm_curr = int64(string_copy(str, string_last_pos("_", str) + 1, 10));	//копируем номер игры
	//если не найдено последнее сохранение, что уже возможно 
	//(например, если игрок удалил последнее сохранение, тогда оно, будет удалено из gameInfo), 
	//подгружаем первое сохранение из выбранной папки
	var str1 = ini_read_string("GAMEINFO", "lastSave", ctrl_ldGm_gm_currPath + "/save_1");
	ctrl_ldGm_sv_currPath = str1;	//путь сохранения
	//номер сохранения получаем в scr_ld_findSvPaths
	
	//скрин текущего сохранения
	draw_img = sprite_add(ctrl_ldGm_sv_currPath + "/svScreenShot.png", 1, true, true, 0, 0);
}

//нахожу все папки сохранений, считаю количество сохранений
//(первая папка, номер для первой ветви)
scr_ld_findSvPaths(ctrl_ldGm_gm_currPath + "/save_1", 1);
//номер страницы считаем после того, как получили номер сохранения
ctrl_ldGm_page_curr = ceil((ctrl_ldGm_sv_curr + 1) / ctrl_ldGm_svOnPage);	//подстраиваем страницу под номер сохранения
//количество страниц считаем после того, как посчитали количество сохранений
ctrl_ldGm_page = ceil(ctrl_ldGm_sv / ctrl_ldGm_svOnPage);


event_user(14);	//проверка на наличие сохранений, создание кнопок-загрузчиков или, если нет сохр. то начало новой игры


//создаю кнопки
//кнопка ,,загрузить сохранение,,
btn_ldSvId = instance_create_depth(room_width * 0.25, room_height * 0.85, depth, obj_btn);
btn_ldSvId.sprite_index = spr_btn_ldGm_ldSv0;
btn_ldSvId.type = "confirmYNCl";
btn_ldSvId.action = ["ldSv", "cansel", "cansel"];
btn_ldSvId.sound = [20, "snd_none", "snd_none"];
//пока не выбрано сохранение, кнопка загрузки не активна
btn_ldSvId.btn_enable = true;

//кнопка ,,удалить игру,,
btn_delGmId = instance_create_depth(room_width * 0.53, room_height * 0.85, depth, obj_btn);
btn_delGmId.sprite_index = spr_btn_ldGm_delGm1;
btn_delGmId.type = "confirmYNCl";
btn_delGmId.action = ["delGm", "cansel", "cansel"];
btn_delGmId.sound = [20, "snd_none", "snd_none"]; 
btn_delGmId.btn_enable = true;
	
//кнопка ,,удалить сохранение,,
btn_delSvId = instance_create_depth(room_width * 0.70, room_height * 0.85, depth, obj_btn);
btn_delSvId.sprite_index = spr_btn_ldGm_delSv0;
btn_delSvId.type = "confirmYNCl";
btn_delSvId.action = ["delSv", "cansel", "cansel"];
btn_delSvId.sound = [20, "snd_none", "snd_none"];
//пока не выбрано сохранение, кнопка удаления не активна
btn_delSvId.btn_enable = true;
