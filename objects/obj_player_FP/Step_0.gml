//игрок всегда смотрит на курсор, кроме атаки
//во время удара персонаж не может перемещаться
if (!player_attack) {
	image_angle = point_direction(x, y, mouse_x, mouse_y);
	//тип движения 
	scr_player_moveType();
}

