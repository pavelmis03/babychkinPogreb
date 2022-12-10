/// @description

//main
need_sv = 1;	//нужно ли сохранять данный объект

//взаимодейтсвие с инвентарём
ctrl_inv_row = 0;						//ячейка фокусе по строке
ctrl_inv_col = 0;						//ячейка фокусе по столбцу
ctrl_inv_maxRow = 5;					//количество строк в инвентаре
ctrl_inv_maxCol = 5;					//количество столбцов в инвентаре
ctrl_inv_items = [[]];					//модель инвенторя (в виде таблицы)
ctrl_inv_map_items = ds_map_create();	//количество предметов во всём инвенторе
ctrl_inv_maxWeight = 20;				//масксимально значение общего веса инвентаря
ctrl_inv_weight = 0;					//текущее значение общего веса инвенторя
ctrl_inv_page = 1;						//текущая страница инвенторя
ctrl_inv_pages = 1;						//максимальное количество страниц инвенторя

//заполнение инвенторя
for (var i = 0; i < ctrl_inv_maxRow; i++) {
	for (var j = 0; j < ctrl_inv_maxCol; j++) {
		ctrl_inv_items[i][j] = ["", 0];
	}
}


