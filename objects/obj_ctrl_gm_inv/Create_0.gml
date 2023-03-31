/// @description

//main
need_sv = 2;	//нужно ли сохранять данный объект
//имена переменных, которые не нужно сохранять
nonSvVar = ["nonSvVar", "init", "need_sv", "ctrl_inv_row", "ctrl_inv_col", "ctrl_inv_maxRow",
			"ctrl_inv_maxCol", "ctrl_inv_page", "ctrl_inv_pages", "ctrl_inv_items", "action"];	
init = false;

//взаимодейтсвие с инвентарём
ctrl_inv_row = 0;			//ячейка фокусе по строке
ctrl_inv_col = 0;			//ячейка фокусе по столбцу
ctrl_inv_maxRow = 5;		//количество строк в инвентаре
ctrl_inv_maxCol = 5;		//количество столбцов в инвентаре
ctrl_inv_items = [[]];		//модель инвентаря (в виде таблицы)
//см. в UE0
//ctrl_inv_map_items = ds_map_create();	//количество предметов во всём инвентаре
ctrl_inv_map_items = 0;		//количество предметов во всём инвенторе
ctrl_inv_maxWeight = 20;	//масксимально значение общего веса инвентаря
ctrl_inv_weight = 0;		//текущее значение общего веса инвентаря
ctrl_inv_page = 1;			//текущая страница инвентаря
ctrl_inv_pages = 1;			//максимальное количество страниц инвентаря

//заполнение инвентаря
for (var i = 0; i < ctrl_inv_maxRow; i++) {
	for (var j = 0; j < ctrl_inv_maxCol; j++) {
		ctrl_inv_items[i][j] = ["", 0];
	}
}


