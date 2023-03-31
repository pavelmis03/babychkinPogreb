/// @description init

//считаю, сколько игр существует
var n = 0;
for (var i = 0; i < 5; i++) {
	if (directory_exists("saves/game_" + string(i))) {
		array_push(ctrl_ldGm_gmPaths, "saves/game_" + string(i));	//скрипт удаления игры удаляет папку сам, поэтому нужно ее сохранить даже если она пустая
		n++;
	}
}
ctrl_ldGm_gm = n;		//всего игр

//if (ctrl_ldGm_gm > 0) { //если у нас есть игры 
	var str = "", str1 = "";
	//автоподстановка последних игры и сохранения
	if (file_exists("gameInfo.ini")) {
		ini_open("gameInfo.ini");
		//загружаю последнюю игру из файла информации по играм
		str = ini_read_string("GAMEINFO", "lastGame", "saves/game_0");
		//последнее сохранение
		str1 = ini_read_string("GAMEINFO", "lastSave", str + "/save_1");
		ini_close();
	}

	if (!directory_exists(str)) {
		str = array_last(ctrl_ldGm_gmPaths);	//если папки, сохраненной, как последняя игра нет, берем последнюю из существующих
		//может быть, если игрок удалит через меню загрузок папку игры, в которой только что играл
		//и снова войдет в меню загрузок
		//номер игры приравнивается к последней игре в списке игр
		ctrl_ldGm_gm_curr = ctrl_ldGm_gm;
	}

	ctrl_ldGm_gm_currPath = str;	//путь игры
	//определяем номер игры по индексу
	ctrl_ldGm_gm_curr = scr_arr_fingEl(ctrl_ldGm_gmPaths, ctrl_ldGm_gm_currPath, 1);
	
	//нахожу все папки сохранений в папке игры
	scr_ld_findSvPaths(ctrl_ldGm_gm_currPath);

	if (ctrl_ldGm_gm) {	//если сохранения игр есть (после прохода scr_ld_findSvPaths пустые папки игр могут удалиться)
		//общее количество сохранений
		ctrl_ldGm_sv = array_length(ctrl_ldGm_svPaths);
	
		//если не найдено последнее сохранение, что вполне уже 
		//подгружаем первое сохранение из выбранной папки
		if (!directory_exists(str1)) {
			//если не нашли папки последнего сохранения, сохраняем последнее из доступных
			str1 = array_last(ctrl_ldGm_svPaths);
		}
	
		ctrl_ldGm_sv_currPath = str1;	//путь сохранения
		ctrl_ldGm_sv_curr = scr_arr_fingEl(ctrl_ldGm_svPaths, ctrl_ldGm_sv_currPath, 1);	//номер сохранения

		//номер страницы считаем после того, как получили номер сохранения
		ctrl_ldGm_page_curr = ceil((ctrl_ldGm_sv_curr + 1) / ctrl_ldGm_svOnPage);	//подстраиваем страницу под номер сохранения
		//количество страниц считаем после того, как посчитали количество сохранений
		ctrl_ldGm_page = ceil(ctrl_ldGm_sv / ctrl_ldGm_svOnPage);

		//скрин текущего сохранения
		draw_img = sprite_add(ctrl_ldGm_sv_currPath + "/svScreenShot.png", 1, true, true, 0, 0);


		//создаю кнопки
		//кнопка ,,загрузить сохранение,,
		btn_ldSvId = instance_create_depth(room_width * 0.25, room_height * 0.85, depth, obj_btn);
		btn_ldSvId.sprite_index = spr_btn_ldGm_ldSv0;
		btn_ldSvId.type = "confirmYNCl";
		btn_ldSvId.action = ["ldSv", "cansel", "cansel"];
		btn_ldSvId.sound = [20, "snd_none", "snd_none"];
		//пока не выбрано сохранение, кнопка загрузки не активна
		btn_ldSvId.btn_enable = true;

		//кнопка ,,удалить сохранение,,
		btn_delSvId = instance_create_depth(room_width * 0.53, room_height * 0.85, depth, obj_btn);
		btn_delSvId.sprite_index = spr_btn_ldGm_delSv0;
		btn_delSvId.type = "confirmYNCl_delSv";
		btn_delSvId.action = ["delSv", "cansel", "cansel"];
		btn_delSvId.sound = [20, "snd_none", "snd_none"];
		//пока не выбрано сохранение, кнопка удаления не активна
		btn_delSvId.btn_enable = true;

		//кнопка ,,удалить игру,,
		btn_delGmId = instance_create_depth(room_width * 0.70, room_height * 0.85, depth, obj_btn);
		btn_delGmId.sprite_index = spr_btn_ldGm_delGm1;
		btn_delGmId.type = "confirmYNCl";
		btn_delGmId.action = ["delGm", "cansel", "cansel"];
		btn_delGmId.sound = [20, "snd_none", "snd_none"]; 
		btn_delGmId.btn_enable = true;


		//здесь создаем пять кнопок-загрузок
		scr_ld_createLdBtn();
	}
//}

init = true;




