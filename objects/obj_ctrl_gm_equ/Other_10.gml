/// @description инициализация

// этот контроллер сохраняется в файл. Если в переменную словаря при выгрузке из файла
// поместили строку, значит, это содержимое этого словаря
var t = equ_map_patrons;	
// количество патронов
if (typeof(t) == "string") {
	equ_map_patrons = ds_map_create();	
	ds_map_read(equ_map_patrons, t);
} 

var t = equ_map_equ;	
// снаряжение
if (typeof(t) == "string") {
	equ_map_equ = ds_map_create();	
	ds_map_read(equ_map_equ, t);
} 

equ_wpn_act = "Основное оружие";	// получаем основное оружие в руки
if (equ_map_equ[?"Основное оружие"][0] == "") {	// если основного нет, получаем дополнительное
	equ_wpn_act = "Вспомогательное оружие";
}
	

// писать дальше ниже этой строки

init = true;


