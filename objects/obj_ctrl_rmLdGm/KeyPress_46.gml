/// @description удаление сохранения

//создаем диалог, как при нажатии на кнопку ,,удалить сохранение,, вызывая его из кнопки удаления сохранения
with (btn_delSvId) {
	obj_ctrl_dlg.ctrl_dlg_need = true;
	obj_ctrl_dlg.type = type;
	action[0] = "delSv";
	//если в папке есть ветви, выводим дополнительное предупреждение
	var t = file_find_first(obj_ctrl_rmLdGm.ctrl_ldGm_sv_currPath + "/*", fa_directory);
	if ((t != "") and (string_pos(".", t) == 0)) {	//второе условие, чтобы не находились файлы
		action[0] = "delSv1";
	}
	//выводим диалог предупреждения
	obj_ctrl_dlg.action = action;
}


