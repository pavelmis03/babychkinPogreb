/// @description 

//объект игрока
player = scr_player_type();

//если персонаж не существует, рисовать нечего
//если персонаж погиб, прекращаем отрисовку интерфейса
//если первая часть игры, интерфейс не отображается
//if ((player == -1) or (player.hp <= 0) or (obj_ctrl_gm.ctrl_gm_stage == 1)) { //!D
if ((player == -1) or (player.hp <= 0) or (obj_ctrl_gm.ctrl_gm_stage == 10)) { //D
	visible = 0;
} else {
	visible = 1;
}