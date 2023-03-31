/// @description загрузка игры

//КОПИРУЕМ ИНФОРМАЦИЮ ИЗ ПАПКИ ЗАГРУЗОК 
//проходим по папке сохранения и запоминаем комнаты, которые нужно будет обновить
var fn = file_find_first(ctrl_sv_ldDir + "/*.*", 0);
ctrl_sv_svDir = ctrl_sv_ldDir;	//сохранение изначально там же, где загрузка, потом добавим к пути загрузки либо ветвь, либо новое сохранение

while (fn != "") {
	if (fn == "saveInfo.ini") {
		/*
		загрузка игровых времени и даты 
		*/
	} else {
		if (fn == "travelersObj.txt") {//загрузка контроллеров
			//создаем контроллеры
			scr_ld_createObjFromFile(ctrl_sv_ldDir + "/" + fn);
		} else {
			//запоминаем комнаты, которые нужно будет обновлять
			if (string_copy(fn, string_pos(".", fn), 10) == ".txt") {
				//копируем название файла без расширения (только название комнаты)
				array_push(ctrl_sv_ldRms, string_copy(fn, 0, string_pos(".", fn) - 1));
			}
		}
	}
	fn = file_find_next();
}

file_find_close();
//копируем массив сохраненных комнат в такой же временный массив для загрузки посещенных 
//первый раз комнат, имеющих сохранения в данном сохранении
array_copy(ctrl_sv_ldRmsTmp, 0, ctrl_sv_ldRms, 0, array_length(ctrl_sv_ldRms));

//СОЗДАЕМ ПАПКУ НЕДЕЙСТВИТЕЛЬНОГО СОХРАНЕНИЯ
//находим последнюю папку сохранения в данной ветви
var tPath = scr_file_findLast(ctrl_sv_ldDir);
//номер папки последней папки в ветви и папки загрузки
var n1 = int64(string_copy(tPath, string_last_pos("_", tPath) + 1, 10));
var n2 = int64(string_copy(ctrl_sv_ldDir, string_last_pos("_", ctrl_sv_ldDir) + 1, 10));

//если мы загружаемся из середины, создаем сначала ветвь
if (n1 > n2) {	//если номер папки загрузки меньше, чем номер последней папки
	//создаем ветвь
	tPath = scr_file_findLast(ctrl_sv_ldDir + "/");	//находим последнюю папку ветви в выбранном сохранении, если она есть
	if (tPath == ctrl_sv_ldDir + "/") { //если мы не нашли ветвей 
		ctrl_sv_svDir += "/branch_1";
	} else {	//иначе берем последнюю ветвь + 1
		//последнее число
		var n = int64(string_copy(tPath, string_last_pos("_", tPath) + 1, 10));
		ctrl_sv_svDir += "/branch_" + string(n + 1);
	}
	directory_create(ctrl_sv_svDir);
}

event_user(7);	//создаем новое недействительное сохранение в выбранной папке


