/// @function scr_str_defEnding(word, num);
/// @param {} word слово без окончания, окончание подбирает скрипт
/// @param {} num число, по которому мы подбираем окончание
/// @description скрипт подбирает окончание (именно изменяемую часть) в зависимости от числа, которое стоит перед словом
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
/// @description скрипт находит в строке все числа и возвращет их в качестве массива строк или ^, если чисел не найдено
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
	
	if (array_length(numArr) == 0) {
		return "^";
	}
	
	return numArr;
}












