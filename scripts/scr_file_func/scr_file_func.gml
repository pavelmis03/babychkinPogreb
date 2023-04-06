/// @function scr_file_findStr(file, str);
/// @param {} file файл, в котором ищем совпадения
/// @param {} str строка, которую надо найти
/// @description возвращает количество найденых совпадений (строки в файле), определяет тип файла автоматически
/*
function scr_file_findStr(file, str) {
	var res = 0;	//количество совпадений
	
	switch (filename_ext(file)) {	//в зависимости от типа файла работать с ним будем по-разному
		case ".txt":
			file = file_text_open_read(file);
			var fileInStr = "";

			while (!file_text_eof(file)) { //собираю весь файл в одну строку
				fileInStr += file_text_readln(file);
			}
			res = string_count(str, fileInStr);
			
			file_text_close(file);
		break;
		case ".ini":
			file = ini_open(file);
			
			//реализую, если понадобится
			
			ini_close();
		break;
	}
	
	return res;
}
*/

/// @function scr_file_findLast(dir);
/// @param {} dir каталог, в котором ищем последнюю папку, например, .../path/ - поиск в path, или ...p1/p2 - поиск в p1
/// @description возвращает путь до последней директории в переданном каталоге или на уровень выше
function scr_file_findLast(dir) {
	//копируем путь без последней папки (т.к. по идее искать надо в предпоследней)
	dir = string_copy(dir, 0, string_last_pos("/", dir));
	var fn = file_find_first(dir + "*", fa_directory);	
	var lastF = "";
	while (fn != "") {
		if (string_pos(".", fn) == 0) { //если найденный путь не файл
			lastF = fn;
		}
		fn = file_find_next();
	}
	file_find_close();
	
	return dir + lastF;
}







