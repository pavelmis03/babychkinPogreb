/// @description 

//если игрок еще ,,не определился,, с кем именно он взаимодействует, то назначаем для 
//взаимодействия свой id
if (other.player_col[?type] == 0) {
	other.player_col[?type] = id;
}

if (!enemy_attack) {
	enemy_attack = true;
	sprite_index = enemy_spr_attack;
	image_index = 0;
	speed = 0;
}
