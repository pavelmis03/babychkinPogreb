/// @description 

//main

//moving
//нажатые клавиши движения
player_move_key_list = ds_list_create();
player_moveType = "stand";	//тип движения
/*
forward
lforward
rforward
backward
lbackward
rbackward
left
right
*/
player_main_speed = 3;	//константа скорости

//attack
player_attack = false;	//показывает, что персонаж собирается ударить