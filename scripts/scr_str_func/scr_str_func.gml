/// @function scr_str_defEnding(word, num);
/// @param {} word слово без окончания, окончание подбирает скрипт
/// @param {} num число, по которому мы подбираем окончание
/// @description скрипт подбирает окончание слова (именно изменяемую часть) 
	//в зависимости от числа, которое стоит перед словом
function scr_str_defEnding(word, num) {
	var str = word;
	
	//пока работает только для таких окончаний: сохранение/я/й
	//можно еще сделать для ответ/а/ов, задача/и/
	if (num % 100 == 1) {
		str += "е";
	}
	if (2 <= num % 100 <= 4) {
		str += "я";
	}
	if ((5 <= num % 100 <= 19) or (num % 10 == 0)) {
		str += "й";
	}
	
	return str;
}

/// @function scr_str_extractNums(str);
/// @param {} str строка, с которой мы работаем 
/// @description скрипт находит в строке все числа и возвращет их 
	//в виде массива строк или ^, если чисел не найдено
/// input: str123jfdl45ks2
/// output: [123, 45, 2]
function scr_str_extractNums(str) {
	var numArr = [];
	var tStr = "";
	
	for (var i = 1; i <= string_length(str); i++) {
		var t = string_copy(str, i, 1);
		if (scr_arr_fingEl(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"], t, 1) != -1) {
			tStr += t;
		} else {
			if (tStr != "") {
				array_push(numArr, tStr);
			}
			tStr = "";
		}
	}
	//если на последней итерации была цифра 
	if (tStr != "") {
		array_push(numArr, tStr);
	}
	
	if (array_length(numArr) == 0) {
		return "^";
	}
	
	return numArr;
}

/// @function scr_str_parsPath(str);
/// @param {} str строка, с которой мы работаем 
/// @description скрипт разбирает путь к файлу сохранения
	//saves/game_n/save_n/branche_m... на Сохр. n>Ветвь m>...
function scr_str_parsPath(str) {
	//если попала строка без сохранений
	if (string_count("save_", str) == 0) {
		return str;
	}
	
	//копируем строку с первого сохранения
	str = string_copy(str, string_pos("save_", str), string_length(str));
	var arr = string_split(str, "/");
	var newS = "";
	
	for (var i = 0; i < array_length(arr); i++) {
		var t = string_split(arr[i], "_");
		if (t[0] == "save") {
			newS += "Сохр " + t[1] + ">";
		}
		if (t[0] == "branch") {
			newS += "Ветвь " + t[1] + ">";
		}
	}
	
	//копирую без последней стрелочки
	return string_copy(newS, 0, string_length(newS) - 1);
}

/// @function scr_str_spltStrOnSStrByLen(str, lenPx);
/// @param {} str строка, с которой мы работаем 
/// @param {} lenPx длина, на которой должна поместиться строка в пикселях
/// @description скрипт вставляет в строку переносы, чтобы получалась строка не длиннее заданной
function scr_str_spltStrOnSStrByLen(str, len) {
	var c = string_copy(str, 1, 1);
	var strLen = floor(len / string_width(c)); //количество символов в строке
	
	//собираем строку, добавляя в нее переносы
	var i = strLen;
	while (i < string_length(str)) {
		str = string_insert("\n", str, i);
		i += strLen + 1;
	}
	
	return str;
}

/// @function scr_str_cpSStrByLen(str, lenPx);
/// @param {} str строка, с которой мы работаем 
/// @param {} lenPx длина, на которой должна поместиться строка в пикселях
/// @description копирует часть строки, чтобы она поместилась на заданной длине
function scr_str_cpSStrByLen(str, len) {
	var sw = string_width(str);
	//получаем среднюю длину символа
	var cw = sw / string_length(str);
	//делим доступную длину на длину одного символа
	var newL = floor(len / cw);
	str = string_copy(str, 1, newL);	//возвращаем максимальное количество символов
	return str;
}




