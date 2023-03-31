/// @function scr_arr_fingEl(arr, el, dimension);
/// @param {} arr массив для поиска
/// @param {} el элемент 
/// @param {} dimension мерность массива
/// @description возвращает номер индекс в массиве
function scr_arr_fingEl(arr, el, dimension) {
	if (dimension == 1) {
		for (var i = 0; i < array_length(arr); i++) {
			if (el == arr[i]) {
				return i;
			}
		}
	} else {
		for (var i = 0; i < array_length(arr); i++) {
			for (var j = 0; j < array_length(arr[i]); j++) {
				if (el == arr[i][j]) {
					return [i, j];
				}
			}
		}
	}
	return -1;
}

/// @function scr_arr_readFromStr(str);
/// @param {} str строка, из которой читаем массив "[ [, ], [, ], ...[, ] ]" или [, , ,...]
/// @description преобразует строку в массив. РЕКУРСИВНАЯ
function scr_arr_readFromStr(str) {
	//получает на вход строку "[ [, ], [, ], ...[, ] ]", ищет самый вложенный массив, разбирает его
	//возвращает в виде (ВНИМАНИЕ) массива строк (это надо будет преобразовавать уже в самом объекте
	//в событии UE0
	var arr = [];	//массив - ответ
	var br = 0;	//количество открывающих и закрывающих скобок
	var a = -1, b = -1; //промежуток строки от [ до ]
	var sStr = "";	//промежуточный массив
	
	//удаляю пробелы
	str = string_replace_all(str, " ", "");
	str = string_replace_all(str, "\"", "");
	
	//удаляю внешние скобки 
	str = string_delete(str, 1, 1);
	str = string_delete(str, string_length(str), 1);
	
	//рекурсивно, если встречаем скобки в начале строки, ищем хвост этого 
	//подмассива и вызываем от него функцию, результат добавляем в наш массив
	var i = 1;
	while (str != "") {
		//сохраняем индекс первой скобки
		if (string_char_at(str, i) == "[") {
			if (br == 0) {
				a = i;
			}
			br++;
		}
		//сохраняем индекс второй скобки
		if (string_char_at(str, i) = "]") {
			br--;
			if (br == 0) {
				b = i;
			}
		}
		//когда мы нашли подмассив 
		if ((a != -1) and (b != -1)) {
			sStr = string_copy(str, a, b);	//копируем его (со скобками)
			//и добавляем в наш, прогнав его через функцию, чтобы убедиться, что в нем нет других подмассивов
			array_push(arr, scr_arr_readFromStr(sStr));
			//копируем строку без этого массива (+ 2 потому что запятую тоже не надо копировать)
			str = string_copy(str, b + 2, string_length(str));
			a = -1;	//обнуляем счетчики
			b = -1;
			i = 0;
		} else {
			//это случается, когда в массиве нет открывающей скобки, иначе она на первой
			//итерации сохраняется в а. Это значит, что мы нашли самый вложенный (глубокий)
			//подмассив и его можно возвращать обратно
			if (string_count("[", str) == 0) {	//хз, зачем, на всякий 
				//объединяем (чтобы не создавать массив в массиве через push) наш массив разбитой на элементы строкой
				var tArr = string_split(str, ",");
				arr = array_concat(arr, tArr);
				str = "";
			}
		}
		i++;
	}
	
	return arr;
}