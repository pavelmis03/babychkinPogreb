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
/*
//если есть контакт с объектом инвентаря
	if (player_col[?"inv"] != 0) {
		var obj_ind = asset_get_index(object_get_name(player_col[?"inv"].object_index));
		//если игрок смотрит в сторону объекта инвентаря
		if (collision_line(x, y, x + lengthdir_x(1000, image_angle), y + lengthdir_y(1000, image_angle), obj_ind, true, true) != noone) {
			//сообщаем предмету, что перс. ,,смотрит,, на него
			player_col[?"inv"].inv_dirIsSatisfies = true;
		} else {
			player_col[?"inv"].inv_dirIsSatisfies = false;
		}
	}*/

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


