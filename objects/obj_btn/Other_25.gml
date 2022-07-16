/// @description действие в зависимости от типа кнопки 

switch (type) {
	//диалог подтверждения
	case "confirmYCl": 
		//говорим, что нужно создать диалог
		obj_ctrl_dlg.ctrl_dlg_need = true;
		//передаем тип диалога
		obj_ctrl_dlg.type = type;
		//передаем действия
		obj_ctrl_dlg.action = action;
		//для дверей с подтверждением надо отменить нажатие после появления диалога. т.к. в step 
		//это теперь не делатется, чтобы после нажатия и снятия курсора с кнопки, действие нажатия не отменялось
		///new/ /*
		var str = sprite_get_name(sprite_index);
		var str1 = string_copy(str, 0, string_length(str) - 1); 
		sprite_index = asset_get_index(str1 + "1");
		btn_enter = false;
		image_speed = -1;
		btn_pressed = false;
		//*/
	break;
	//отдельно для меню настроек с условием (действие сохранения)
	case "confirmYCl_svSet": 
		//говорим, что нужно создать диалог
		obj_ctrl_dlg.ctrl_dlg_need = true;
		//передаем тип диалога
		obj_ctrl_dlg.type = type;
		//передаем действия
		obj_ctrl_dlg.action = action;
		//для дверей с подтверждением надо отменить нажатие после появления диалога. т.к. в step 
		//это теперь не делатется, чтобы после нажатия и снятия курсора с кнопки, действие нажатия не отменялось
		///new/ /*
		var str = sprite_get_name(sprite_index);
		var str1 = string_copy(str, 0, string_length(str) - 1); 
		sprite_index = asset_get_index(str1 + "1");
		btn_enter = false;
		image_speed = -1;
		btn_pressed = false;
		//*/
		obj_ctrl_set.action = "saveSettings";
	break;
	//отдельно для меню настроек с условием (кнопка выхода)
	case "confirmYNCl_set": 
		//если настройки изменились
		if (!scr_map_equ(obj_ctrl_set.ctrl_set_map_curr, obj_ctrl_set.ctrl_set_map_pre)) {
			//говорим, что нужно создать диалог
			obj_ctrl_dlg.ctrl_dlg_need = true;
			//передаем тип диалога
			obj_ctrl_dlg.type = type;
			//передаем действия
			obj_ctrl_dlg.action = action;
		} else {	//если настройки остались прежними, просто выход
			action = "back";
			event_user(14);
		}
		///new/ /*
		var str = sprite_get_name(sprite_index);
		var str1 = string_copy(str, 0, string_length(str) - 1); 
		sprite_index = asset_get_index(str1 + "1");
		btn_enter = false;
		image_speed = -1;
		btn_pressed = false;
		//*/
	break;
	//отдельно для меню настроек с условием (кнопка ,,настройки по умолчанию,,)
	case "confirmYNCl_def": 
		//если настройки отличны от настроек по умолчанию 
		if (!scr_map_equ(obj_ctrl_set.ctrl_set_map_curr, obj_ctrl_set.ctrl_set_map_def)) {
			//говорим, что нужно создать диалог
			obj_ctrl_dlg.ctrl_dlg_need = true;
			//передаем тип диалога
			obj_ctrl_dlg.type = type;
			//передаем действия
			obj_ctrl_dlg.action = action;
		} else {	//если настройки равны настройка по умолчанию, выводим уведомление
			//говорим, что нужно создать диалог
			obj_ctrl_dlg.ctrl_dlg_need = true;
			//передаем тип диалога
			obj_ctrl_dlg.type = "confirmYCl";
			//передаем действия
			obj_ctrl_dlg.action = ["alreadYdefaultSet", "cansel"];
		}
		///new/ /*
		var str = sprite_get_name(sprite_index);
		var str1 = string_copy(str, 0, string_length(str) - 1); 
		sprite_index = asset_get_index(str1 + "1");
		btn_enter = false;
		image_speed = -1;
		btn_pressed = false;
		//*/
	break;
	//отдельно для меню новой игры с условием
	case "confirmYNCl_new": 
		//если есть начатая игра
		if (directory_exists("saves")) {
			//говорим, что нужно создать диалог
			obj_ctrl_dlg.ctrl_dlg_need = true;
			//передаем тип диалога
			obj_ctrl_dlg.type = "confirmYNCl";
			//передаем действия
			obj_ctrl_dlg.action = ["newGm", "cansel", "cansel"];
		} else {	//если это первая начатая игра
			action = "newGm";
			event_user(14);
		}
		///new/ /*
		var str = sprite_get_name(sprite_index);
		var str1 = string_copy(str, 0, string_length(str) - 1); 
		sprite_index = asset_get_index(str1 + "1");
		btn_enter = false;
		image_speed = -1;
		btn_pressed = false;
		//*/
	break;
	case "confirmYNCl": 
		obj_ctrl_dlg.ctrl_dlg_need = true;
		obj_ctrl_dlg.type = type;
		obj_ctrl_dlg.action = action;
		///new/ /*
		var str = sprite_get_name(sprite_index);
		var str1 = string_copy(str, 0, string_length(str) - 1); 
		sprite_index = asset_get_index(str1 + "1");
		btn_enter = false;
		image_speed = -1;
		btn_pressed = false;
		//*/
	break;
	//кнопки перехода в другую комнату 
	case "transition": 
		//в некоторых случаях нужно задержаться в текущей комнате перед переходом
		if (btn_transitionDelay == 0) {
			event_user(14);
		} else {
			alarm[7] = btn_transitionDelay * room_speed;
		}
	break;
	//выполняющие определенные функции
	case "func": 
		event_user(14);
		//для функциональных кнопок надо отменить нажатие после появления диалога. т.к. в step 
		//это теперь не делается, чтобы после нажатия и снятия курсора с кнопки, действие нажатия не отменялось
		///new/ /*
		var str = sprite_get_name(sprite_index);
		var str1 = string_copy(str, 0, string_length(str) - 1); 
		sprite_index = asset_get_index(str1 + "1");
		btn_enter = false;
		image_speed = -1;
		btn_pressed = false;
		//*/
	break;
	//кнопки диалогов
	case "dlg_btn": 
		event_user(14);
	break;
}