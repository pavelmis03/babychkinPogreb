/// @description инициализация

//этот контроллер сохраняется в файл. Если в переменную словаря при выгрузке из файла
//поместили строку, значит, это содержимое этого словаря
var t = buh_map_info;
buh_map_info = ds_map_create();	
//информация о буханке из файла
if (typeof(t) == "string") {
	ds_map_read(buh_map_info, t);
} else { //по умолчанию
	//buh_map_info[?"x"] = 1690;	//D
	//buh_map_info[?"y"] = 1205;	//D
	//buh_map_info[?"depth"] = 0;	//D
	//buh_map_info[?"room"] = rm_gm_fp_parking;	//D
	buh_map_info[?"x"] = 1108;	//!D
	buh_map_info[?"y"] = 505;	//!D
	buh_map_info[?"depth"] = 0;	//!D
	buh_map_info[?"room"] = rm_gm_fp_office;	//!D
	
	buh_map_info[?"dir"] = 0;
}

//писать дальше ниже этой строки

init = true;


