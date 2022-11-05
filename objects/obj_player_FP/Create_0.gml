/// @description 

//main
hp = 1080;
player_isDeath = false;	//переменная, которая становится true, когда игрок умирает
						//нужна, чтобы отключить основные функции игрока на время подготовки перехода
						//в меню смерти

//moving
//нажатые клавиши движения
player_move_key_list = ds_list_create();
player_moveType = "stand";	//тип движения
player_moveRun = false;	//если нажат shift - true
player_moveCanRun = true;	//бежать нельзя, например, когда игрок голоден или несет тяжелое оружее 
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
player_attackDamage = 15;		//урон игрока

//collisions
//в нужную ячейку списка записывается id объекта коллизии
player_col = ds_map_create();
player_col[?"enemy"] = 0;
player_col[?"inv"] = 0;
player_col[?"mapObj"] = 0;
//player_col[?"solidObj"] = 0;
//player_col[?"sth"] = 0;
//объекты, через которые игрок не может пройти (стены и т.д.)
player_solidObj[0] = obj_simple_wall;
player_solidObj[1] = obj_inv_parent;
player_solidObj[2] = obj_evn_door;

//interaction 
player_pressE = false;

//actions
//player_action = "";	//что в данный момент делает игрок


