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
	break;
	//отдельно для меню настроек с условием (кнопка ,,настройки по умолчанию)
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
	break;
	case "confirmYNCl": 
		obj_ctrl_dlg.ctrl_dlg_need = true;
		obj_ctrl_dlg.type = type;
		obj_ctrl_dlg.action = action;
	break;
	//кнопки перехода в другую комнату 
	case "transition": 
		event_user(14);
	break;
	//выполняющие определенные функции
	case "func": 
		event_user(14);
	break;
	//кнопки диалогов
	case "dlg_btn": 
		event_user(14);
	break;
}