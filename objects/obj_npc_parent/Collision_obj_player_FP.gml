/// @description 

//если игрок еще ,,не определился,, с кем именно он взаимодействует, то назначаем для 
//взаимодействия свой id
if (other.player_map_col[?type] == 0) {
	other.player_map_col[?type] = id;
}
