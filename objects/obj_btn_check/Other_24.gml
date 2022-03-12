/// @description конечные действия кнопки


switch (action) {
	//НАСТРОЙКИ
	//выключить, включить звук
	case "sound": 
		obj_ctrl_set.action = "soundChange";
	break;
	//выключить, включить музыку
	case "music": 
		obj_ctrl_set.action = "musicChange";
	break;
	//выключить, включить эффекты
	case "effects": 
		obj_ctrl_set.action = "effectsChange";
	break;
	//выключить, включить подсказки
	case "hints": 
		obj_ctrl_set.action = "hintsChange";
	break;
	//выключить, включить эффекты шума (заполнение экрана пикселями)
	case "pixels": 
		obj_ctrl_set.action = "pixelsChange";
	break;
	//управление буханкой
	case "buhankaMvJL": 
		obj_ctrl_set.action = "buhankaMvJLChange";
	break;
	//двигается ли игрок к мышке или по сетке
	case "gridMv": 
		obj_ctrl_set.action = "gridMvChange";
	break;
	//открыть статистику 
	case "statCmnCompany": 
		obj_ctrl_stat.action = "statCmnCompany";
	break;
	//открыть статистику 
	case "statPlayerCompany": 
		obj_ctrl_stat.action = "statPlayerCompany";
	break;
	//открыть статистику 
	case "statBuhankaCompany": 
		obj_ctrl_stat.action = "statBuhankaCompany";
	break;
	//открыть статистику 
	case "statOtherCompany": 
		obj_ctrl_stat.action = "statOtherCompany";
	break;
}