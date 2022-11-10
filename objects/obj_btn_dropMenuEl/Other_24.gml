/// @description конечные действия кнопки

switch (action) {
	//изменение уровня сложности
	case "difficultyLvl": 
		obj_ctrl_set.action = "difficultyLvlChange";
		//назначаем контроллеру настроект id объекта родителя выпадающего меню, чтобы он в дальнейшем сохранил его значение
		obj_ctrl_set.iid = id.iid;
		//удаляем субэлементы и очищаем массив родителя, в котором хранились индексы субэлементов
		//т.к. в один момент может быть открыт только один список, не нужна проверка на родителя 
		with (obj_btn_dropMenuEl) {
			ds_list_clear(iid.btn_list_dropEl);
			instance_destroy();
		}
	break;
	//режим экрана
	case "screenMode": 
		obj_ctrl_set.action = "screenModeChange";
		//назначаем контроллеру настроект id объекта родителя выпадающего меню, чтобы он в дальнейшем сохранил его значение
		obj_ctrl_set.iid = id.iid;
		//удаляем субэлементы и очищаем массив родителя, в котором хранились индексы субэлементов
		//т.к. в один момент может быть открыт только один список, не нужна проверка на родителя 
		with (obj_btn_dropMenuEl) {
			ds_list_clear(iid.btn_list_dropEl);
			instance_destroy();
		}
	break; 
	//разрешение экрана
	case "screenResolution": 
		obj_ctrl_set.action = "screenResolutionChange";
		//назначаем контроллеру настроект id объекта родителя выпадающего меню, чтобы он в дальнейшем сохранил его значение
		obj_ctrl_set.iid = id.iid;
		//удаляем субэлементы и очищаем массив родителя, в котором хранились индексы субэлементов
		//т.к. в один момент может быть открыт только один список, не нужна проверка на родителя 
		with (obj_btn_dropMenuEl) {
			ds_list_clear(iid.btn_list_dropEl);
			instance_destroy();
		}
	break;
}