/// @description ежесекундный таймер и мысли-подсказки

ctrl_hint_TWH++;

//список ключей из которого будет рандомно выбираться один для мысли-подсказки
var keyList = ds_list_create();
var key = ds_map_find_first(ctrl_hint_hint_map);
//прохожу по словарю мыслей-подсказок
for (var i = 0; i < ds_map_size(ctrl_hint_hint_map); i++) {
	var arr = ctrl_hint_hint_map[?key];
	//первый элемент словаря не массив (см. create)
	if (!is_array(arr)) {
		continue;
	}
	//если эта подсказка не использовалась давно и подсказка является мыслью, запоминаю ключ 
	if ((arr[3] == 0) and (string_copy(key, 0, 3) == "RH_")) {
		ds_list_add(keyList, key);
	}
	//уменьшаю время до следующего вохможного использования мысли-подсказки
	if (arr[3] > 0) {
		arr[3]--;
		ctrl_hint_hint_map[?key] = arr;
	}
		
	key = ds_map_find_next(ctrl_hint_hint_map, key);
}

//если больше двух минут не выводилось никаких подсказок и есть что выводить
if ((ctrl_hint_TWH mod 120 == 0) and (ds_list_size(keyList) > 0)) {
	var t = irandom(ds_list_size(keyList) - 1);
	//var newH = ctrl_hint_hint_map[?keyList[|t]];
	//предлагаю новую подсказку на рассмотрение 
	ctrl_hint_newHint = keyList[|t];
	/* перенесено в UE(15)
	//объявляю, что подсказка использовалась и теперь не стоит ее брать в ближайшее время
	newH[3] = 15 * 60; //15 минут
	ctrl_hint_hint_map[?keyList[|t]] = newH;
	*/
}	
	
ds_list_destroy(keyList);



alarm[1] = 1 * room_speed;








