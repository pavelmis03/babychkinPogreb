/// @function scr_file_findStr(file, str);
/// @param {} file файл, в котором ищем совпадения
/// @param {} str строка, которую надо найти
/// @description возвращает количество найденых совпадений (строки в файле), определяет тип файла автоматически
function scr_file_findStr(file, str) {
	var res = 0;	//количество совпадений
	
	switch (filename_ext(file)) {	//в зависимости от типа файла работать с ним будем по-разному
		case ".txt":
			file = file_text_open_read(file);
			var fileInStr = "";

			while (!file_text_eof(file)) {
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