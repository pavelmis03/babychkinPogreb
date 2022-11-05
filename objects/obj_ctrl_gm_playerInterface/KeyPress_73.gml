/// @description открытие инвентаря

//если на кнопку открытия/закрытия кликнули, показываем/скрываем интерфейс
//если стрелка в углу экрана - интерфейс скрыт
if (x == camera_get_view_x(view_camera[0])) {
	//показать
	interface_on = true;
} else {
	interface_on = false;
}

