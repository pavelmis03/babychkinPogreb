/// @description этот объект отвечает за некоторые действия, происходящие в меню журнала
// ОН ЛОКАЛЬНЫЙ
//действия:
	//отрисовка книги

randomize();

//main
action = "";

//drawing
draw_spr = spr_journal1;	//для фона книги
draw_txt_x = room_width * 0.32;	//начало рисования текста на книге
draw_txt_y = room_height * 0.29;
ctrl_jrn_chapter_curr = 1;			//текущий раздел 
ctrl_jrn_chapter_target = 1;		//раздел, в который мы хотим попасть

//text
ctrl_jrn_txt_str = 7;	//количество строк на странице книги
ctrl_jrn_txt_map = ds_map_create();	//здесь будет храниться текст по страницам и разделам
ctrl_jrn_txt_map[?"history"] = ["ИСТОРИЯ"];
ctrl_jrn_txt_map[?"quest"] = ["КВЕСТЫ"];
ctrl_jrn_txt_map[?"monsterInfo"] = ["ИНФОРМАЦИЯ О МОНСТРАХ"];
ctrl_jrn_txt_map[?"weaponInfo"] = ["ИНФОРМАЦИЯ ОБ ОРУЖИИ"];
ctrl_jrn_txt_map[?"achiv"] = ["ДОСТИЖЕНИЯ"];


//btn
//двумерный [id, open/not, page]
ctrl_jrn_btn_map = ds_map_create(); //созданные динамически кнопки
ctrl_jrn_btn_arrow_arr = []; //массив id стрелочек
ctrl_jrn_btn_active = "history";
//ctrl_jrn_btn_del = []; //закладка, которую сейчас удалили 

//этот контроллер будет рисовать фон книги и все остальное, поэтому должен лежать на ее месте
//видимым станет после открытия книги
sprite_index = spr_sys_none;
visible = false;
x = 0;
y = 0;
