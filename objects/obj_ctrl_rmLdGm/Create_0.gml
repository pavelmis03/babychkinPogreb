/// @description этот объект отвечает за некоторые действия, происходящие в меню загрузки игры
// ОН ЛОКАЛЬНЫЙ
//действия:
	//отрисовка формы загрузок
	//

//main
action = "";

//drawing
draw_spr = spr_sys_none;	//спрайт скриншота сохранения
draw_txt_x = room_width * 0.31;	//координаты отрисовки скрина
draw_txt_y = room_height * 0.36;
ctrl_ldGm_page_curr = 1; //текущая страница сохранений
ctrl_ldGm_page = 1;		 //всего страниц
ctrl_ldGm_gm_curr = 1;	//текущая игра
ctrl_ldGm_gm = 1;		//всего игр

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