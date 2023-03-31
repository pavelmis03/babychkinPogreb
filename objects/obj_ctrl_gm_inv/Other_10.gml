/// @description инициальзация

//этот контроллер сохраняется в файл. Если в переменную словаря при выгрузке из файла
//поместили строку, значит, это содержимое этого словаря
var t = ctrl_inv_map_items;	
ctrl_inv_map_items = ds_map_create();	
//количество предметов во всём инвенторе
if (typeof(t) == "string") {
	ds_map_read(ctrl_inv_map_items, t);
} 

//писать дальше ниже этой строки

init = true;


