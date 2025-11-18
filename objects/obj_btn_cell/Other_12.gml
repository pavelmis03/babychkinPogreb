/// @description спрайт в зависимости от типа

switch (type) {
	case "Еда и медикаменты":	// пища
		image_index = 2;
		cell_corrItems = [];	// любые
		cl_sublType = c_lime;
	break;
	case "Снаряжение":	// снаряжение
		image_index = 3;
		cell_corrItems = [];	// любые
		cl_sublType = c_green;
	break;
	case "Запчасти и инструменты":	// детали и инструменты
		image_index = 1;
		cell_corrItems = [];	// любые
		cl_sublType = c_purple;
	break;
	case "Сюжетный":	// сюжетные
		image_index = 4;
		cell_corrItems = [];	// любые
		cl_sublType = c_yellow;
	break;
	case "Прочее":	// остальное
		image_index = 0;
		cell_corrItems = [];	// любые
		cl_sublType = c_orange;
		// cl_sublType = make_color_rgb(255, 0, 0);
	break;
	
	case "Пистолет":	// пистолет
		image_index = 5;
		cell_corrItems = ["", "Пистолет"];	// доступные имена предметов
		cl_sublType = c_ltgray;
	break;
	case "Основное оружие":	// основное оружие
		image_index = 6;
		cell_corrItems = ["", "АК-74", "Дробовик", "ОНИХ"];	// доступные имена предметов
		cl_sublType = c_ltgray;
	break;
	case "Вспомогательное оружие":	// Вспомогательное оружие
		image_index = 7;
		cell_corrItems = ["", "АК-74", "Дробовик", "ОНИХ", "Гранатомет", "Печенег"];	// доступные имена предметов
		cl_sublType = c_ltgray;
	break;
	case "Шапка":	// шапка
		image_index = 8;
		cell_corrItems = ["", "..."];	// доступные имена предметов
		cl_sublType = c_ltgray;
	break;
	case "Куртка":	// куртка 
		image_index = 9;
		cell_corrItems = ["", "..."];	// доступные имена предметов
		cl_sublType = c_ltgray;
	break;
	case "Перчатки":	// перчатки
		image_index = 10;
		cell_corrItems = ["", "..."];	// доступные имена предметов
		cl_sublType = c_ltgray;
	break;
	case "Штаны":	// штаны
		image_index = 11;
		cell_corrItems = ["", "..."];	// доступные имена предметов
		cl_sublType = c_ltgray;
	break;
	case "Ботинки":	// валенки
		image_index = 12;
		cell_corrItems = ["", "..."];	// доступные имена предметов
		cl_sublType = c_ltgray;
	break;
	case "Бронежилет":	// броник
		image_index = 13;
		cell_corrItems = ["Бронежилет", "..."];	// доступные имена предметов
		cl_sublType = c_ltgray;
	break;
	case "Снаряга":	// снаряга в руках
		image_index = 14;
		cell_corrItems = ["Патрон_граната1", "Патрон_граната2", "Патрон_молотов", "..."];	// доступные имена предметов
		cl_sublType = c_ltgray;
	break;
	
	// нижнее подчеркивание значит, что нельзя менять тип ячейки (кастомные)
	case "_Еда и медикаменты":	// пища
		image_index = 2;
		cell_corrItems = [];	// любые
		cl_sublType = c_lime;
	break;
	case "_Оружие":	// снаряжение
		image_index = 3;
		cell_corrItems = ["Пистолет", "ПистолетМ1", "АК-74", "АК-74М1", "АК-74М2", "Дробовик", "Шмель", "Печенег", "ОНИХ", "ОНИХМ1", "ОНИХМ2", "Патрон_9х18мм", "Патрон_5_45х39мм", "Патрон_7_62х54мм", "Патрон_12", "Патрон_шмель", "Патрон ОНИХ", "Патрон_граната1", "Патрон_граната1", "Патрон_молотов", "Бронежилет", "", ];
		cl_sublType = c_green;
	break;
	case "_Снаряжение":	// снаряжение
		image_index = 3;
		cell_corrItems = [];	// любые
		cl_sublType = c_green;
	break;
	case "_Запчасти и инструменты":	// детали и инструменты
		image_index = 1;
		cell_corrItems = [];	// любые
		cl_sublType = c_purple;
	break;
	case "_Сюжетный":	// сюжетные
		image_index = 4;
		cell_corrItems = [];	// любые
		cl_sublType = c_yellow;
	break;
}