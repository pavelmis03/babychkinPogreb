/// @description выполнение действий

var player_obj = scr_player_type();
var t, tx, ty;

// первая часть
switch (action) {
	// ЗАДАЧИ
	// научиться ходить, научиться открывать двери
	case "iss1_1_1":
		// активируем задачи по обучению
		obj_ctrl_gm_iss.action = "change_iss_status";
		// список активируемых задач
		obj_ctrl_gm_iss.ctrl_iss_arr_id = [010000, 010100, 010101, 010102];
		instance_destroy();
	break;
	// зайти к шефу
	case "iss1_2_1":
		// активируем задачи по обучению
		obj_ctrl_gm_iss.action = "change_iss_status";
		// список активируемых задач
		obj_ctrl_gm_iss.ctrl_iss_arr_id = [010200, 010201, 010202];
		instance_destroy();
	break;
	// научиться ходить - выполнена
	case "issComplete1_1_1":
		// активируем задачи по обучению
		obj_ctrl_gm_iss.action = "change_iss_status";
		// список активируемых задач
		obj_ctrl_gm_iss.ctrl_iss_arr_id = [010101];
		instance_destroy();
	break;
	// научиться открывать двери (и заголовки с ней) - выполнена
	case "issComplete1_1_2":
		// активируем задачи по обучению
		obj_ctrl_gm_iss.action = "change_iss_status";
		// список активируемых задач
		obj_ctrl_gm_iss.ctrl_iss_arr_id = [010000, 010100, 010102];
		instance_destroy();
	break;
	// ДИАЛОГИ
	case "dlg1_1_1": // второй диалог (обучалка: как передвигаться)
		// вызываю первый диалог 
		obj_ctrl_gm.action = "dlg1_1_1";
		obj_ctrl_gm.ctrl_gm_historyInd = "1_1_1";	// индекс диалога для контроллера комнаты истории
		// ds_list_add(obj_ctrl_tml.ctrl_tml_list_, ["dlg1_1_1", 1.5]);
		instance_destroy();
	break;
	case "dlg1_1_2": // второй диалог (загляни в журнал)
		obj_ctrl_gm.action = "dlg1_1_2";
		obj_ctrl_gm.ctrl_gm_historyInd = "1_1_2";	// индекс диалога для контроллера комнаты истории
		instance_destroy();
	break;
	case "dlg1_1_3": // второй диалог (обучалка: как взаимодействовать с предметами)
		obj_ctrl_gm.action = "dlg1_1_3";
		obj_ctrl_gm.ctrl_gm_historyInd = "1_1_3";	// индекс диалога для контроллера комнаты истории
		instance_destroy();
	break;
	case "dlg1_2_1": // вызов на седьмой этаж
		obj_ctrl_gm.action = "dlg1_2_1";
		obj_ctrl_gm.ctrl_gm_historyInd = "1_2_1";	// индекс диалога для контроллера комнаты истории
		instance_destroy();
	break; 
	case "dlg1_2_2": // сообщение о деле
		obj_ctrl_gm.action = "dlg1_2_2";
		obj_ctrl_gm.ctrl_gm_historyInd = "1_2_2";	// индекс диалога для контроллера комнаты истории
		instance_destroy();
	break; 
	/*
	case "":
		
	break;
	*/
	// ПОДСКАЗКИ
	// подсказка с уровня офиса о степашке (что он забыл у босса)
	case "hint_office1":
		obj_ctrl_gm_hint.ctrl_hint_newHint = "hint_office1";
		instance_destroy();
	break;
	//// подсказка с этажа босса
	// case "hint_boss1":
	// 	obj_ctrl_gm_hint.ctrl_hint_newHint = "hint_boss1";
	// 	instance_destroy();	
	// break;
	// подсказка с уровня ,,холл,, о том, что выйти из здания еще нельзя
	case "hint_hole1":
		obj_ctrl_gm_hint.ctrl_hint_newHint = "hint_hole1";
	break;
	// подсказка с уровня офиса ,,допросная,, 
	case "hint_torture1":
		obj_ctrl_gm_hint.ctrl_hint_newHint = "hint_torture1";
	break;
	// БУХАНКА
	case "createBuhInParking": // создать буханку на парковке
		// меняю параметры контроллера буханки по положению буханки, чтобы он создал ее
		obj_ctrl_gm_buh.buh_map_info[?"x"] = 1690;		
		obj_ctrl_gm_buh.buh_map_info[?"y"] = 1205;
		obj_ctrl_gm_buh.buh_map_info[?"depth"] = 0;
		obj_ctrl_gm_buh.buh_map_info[?"room"] = rm_gm_fp_parking;
		instance_destroy();
	break;
	// ИГРОК	
	case "moveToNextRm": // переход в другую комнату игрока или буханки (обычно для больших карт)
		{
		t = 0;
		if (player_obj.player_buhIn) {	// если игрок в буханке, отступ нужен больше
			t = padding_buh;
		}
		// определяем, в какой части экрана триггер находится,
		// и в зависимости от этого будем создавать персонажа в другой комнате на нужном отступе от стены 
		// для этого создаем в массиве информации об игроке запись о будущей комнате
		// ВСЕ КОМНАТЫ-ЧАСТИ ЛОКАЦИЙ (в одной локации) ДЕЛАТЬ ОДИНАКОВЫХ РАЗМЕРОВ, потому что
		// при переходе используется размер текущей комнаты, а не следующей, если сделать разных размеров,
		// игрок будет появляться не там, где нужно
		if ((bbox_right > room_width / 2) and (bbox_bottom > room_height / 2)) { // когда переходим вправо
			tx = padding + t;
			ty = player_obj.y;
		}
		if ((bbox_right > room_width / 2) and (bbox_bottom < room_height / 2)) { // когда переходим вверх
			tx = player_obj.x;
			ty = room_height - padding - t;
		}
		if ((bbox_right < room_width / 2) and (bbox_bottom > room_height / 2)) { 	// когда переходим влево
			tx = room_width - padding - t;
			ty = player_obj.y;
		}
		if ((bbox_left < room_width / 2) and (bbox_top > room_height / 2)) { 	// когда переходим вниз
			tx = player_obj.x;
			ty = padding + t;
		}
		
		obj_ctrl_gm_playerStatus.player_map_info[?target_rm] = [tx, ty, player_obj.depth];	// назначаем новые координаты
		
		// по сути костыль, нужен, чтобы при возвращении в комнату контроллер игрока не создал его там, где он остался (то есть на триггере)
		// потому что если это произойдет, то игрок будет летать туда-сюда по комнатам, т.к. его положение сохранено на месте контакта с триггером
		// instance_destroy(player_obj);	// удаяем игрока
		player_obj.persistent = true;	// чтобы у игрока сохранились переменные (такие как бег и движение)
		ds_map_delete(obj_ctrl_gm_playerStatus.player_map_info, room);	// удаляем запись о его существовании в контроллере игрока)
		room_goto(target_rm);	// переходим в следуюзую комнату
		obj_ctrl_mv.action = "addRm";
		if (player_obj.player_buhIn) {	// если игрок в буханке, нужно переместить и ее
			obj_buh.persistent = 1;
			obj_ctrl_gm_buh.buh_map_info[?"x"] = tx; // новые координаты для комнаты, в которую переходим
			obj_ctrl_gm_buh.buh_map_info[?"y"] = ty;
			obj_ctrl_gm_buh.buh_map_info[?"room"] = target_rm; // указываем новую комнату-базирования 
		}
		}
	break;
	// СИСТЕМНЫЕ
	// удаление себя
	case "selfDestroy":
		instance_destroy();	
	break;
}