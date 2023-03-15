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
draw_spr = spr_sys_none;	//спрайт скриншота сохранения
draw_txt_x = room_width * 0.31;	//координаты отрисовки скрина
draw_txt_y = room_height * 0.36;
//узнать, как хранятся сохранения и считать, исходя их того, сколько всего и сколько помещается на странице
ctrl_ldGm_sv_curr = 0;	//текущее сохранение
ctrl_ldGm_sv_currPath = "";	//текущее сохранение (путь)
ctrl_ldGm_sv = 0;		//всего сохранений (это для меня)
ctrl_ldGm_page_curr = 0; //текущая страница сохранений (для пользователя)
ctrl_ldGm_svOnPage = 4; // количество сохранений на странице
//узнать, как хранятся сохранения и считать, исходя их того, сколько всего и сколько помещается на странице
ctrl_ldGm_page = ctrl_ldGm_sv / 4;	 //всего страниц (делим на количество сохранений на странице)
ctrl_ldGm_gm_curr = 0;	//текущая игра
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
	var str1 = ini_read_string("GAMEINFO", "lastSave", "saves/game_0/save_1");
	ctrl_ldGm_gm_currPath = str;
	ctrl_ldGm_gm_curr = int64(string_copy(str, string_last_pos("_", str) + 1, 10) + 1);	//копируем последний символ
	ctrl_ldGm_sv_currPath = str1;
	ctrl_ldGm_sv_curr = int64(string_copy(str1, string_last_pos("_", str1) + 1, 10));	//копируем последний символ
}

//text
//ctrl_ldGm_sv_map = ds_map_create();	//здесь будeт храниться сохранения и данные о них

event_user(14);	//проверка на наличие сохранений, выгрузка их, если нет сохр. то начало новой игры


//создаю кнопки
//кнопка ,,удалить игру,,
btn_delGmId = instance_create_depth(room_width * 0.25, room_height * 0.65, depth, obj_btn);
btn_delGmId.sprite_index = spr_btn_ldGm_delGm1;
btn_delGmId.type = "confirmYNCl";
btn_delGmId.action = ["delGm", "cansel", "cansel"];
btn_delGmId.sound = [20, "snd_none", "snd_none"]; 
btn_delGmId.btn_enable = false;
	
//кнопка ,,удалить сохранение,,
btn_delSvId = instance_create_depth(room_width * 0.45, room_height * 0.65, depth, obj_btn);
btn_delSvId.sprite_index = spr_btn_ldGm_delSv0;
btn_delSvId.type = "confirmYNCl";
btn_delSvId.action = ["delSv", "cansel", "cansel"];
btn_delSvId.sound = [20, "snd_none", "snd_none"];
//пока не выбрано сохранение, кнопка удаления не активна
btn_delSvId.btn_enable = false;

//кнопка ,,загрузить сохранение,,
btn_ldSvId = instance_create_depth(room_width * 0.65, room_height * 0.65, depth, obj_btn);
btn_ldSvId.sprite_index = spr_btn_ldGm_ldSv0;
btn_ldSvId.type = "confirmYNCl";
btn_ldSvId.action = ["ldSv", "cansel", "cansel"];
btn_ldSvId.sound = [20, "snd_none", "snd_none"];
//пока не выбрано сохранение, кнопка загрузки не активна
btn_ldSvId.btn_enable = false;