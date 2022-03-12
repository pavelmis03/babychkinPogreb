//игрок всегда смотрит на курсор
image_angle = point_direction(x, y, mouse_x, mouse_y);
//во время удара персонаж не может перемещаться
if (!player_attack) {
	//тип движения 
	scr_player_moveType();
}
