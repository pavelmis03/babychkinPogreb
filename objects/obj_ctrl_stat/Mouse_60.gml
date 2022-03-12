/// @description прокрутка вида в меню статистики

//если игрок зашел в меню статистики
if (ctrl_stat_menu) {
	//двигаем камеру вверх, если она не уперлась в нижнюю стенку
	var t_y = camera_get_view_y(view_camera[0]);
	if (t_y > 20) {
		camera_set_view_pos(view_camera[0], 0, t_y - 20);
	}
}