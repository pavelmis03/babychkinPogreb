/// @description
var player = scr_player_type();

if (!init) {
	event_user(0);	
}

//провeрка нахождения игрока рядом
if (player.player_col[?type] == id) {
	inv_nearPlayer = true;	
} else {
	inv_nearPlayer = false;	
}

//проверка смотрит ли игрок в сторону предмета
//if (point_direction(player.x, player.y, x, y) == player.image_angle) {
//	inv_dirIsSatisfies = true;
//} else {	
//	inv_dirIsSatisfies = false;
//}

//проверка возможности будущего взаимодейтсвия с предметом
if (inv_hp == 0 or inv_cnt == 0) {
	inv_canLoot = false;	
}

//проверка возможности непостредственного взаимодейтсвия с предметом
if (inv_nearPlayer and inv_dirIsSatisfies and inv_canLoot) {
	//если игрок нажал на кнопку E и он взаимодействует с экз. нашего объекта, то выполнить дейтсвие
	if (player.player_pressE) {
		//obj_ctrl_gm_inv.action = "add_item";
		scr_inv_addItem();
		player.player_pressE = false;
		//если предмет забран полностью и его необходимо удалить, то происходит удаление
		if (inv_cnt == 0 and inv_isRmv) {
			instance_destroy();	
		}
	}
}


