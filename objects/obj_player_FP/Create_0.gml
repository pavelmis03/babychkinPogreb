/// @description 

//ВНИМАНИЕ: ВСЕ ИЗМЕНЯЕМЫЕ ПАРАМЕТРЫ ХРАНЯТСЯ В КОНТРОЛЛЕРАХ ПЕРСОНАЖА

//main
need_sv = 2;			//нужно ли сохранять данный объект
player_isDeath = false;	//переменная, которая становится true, когда игрок умирает
						//нужна, чтобы отключить основные функции игрока на время подготовки перехода
						//в меню смерти

//moving
//бег
CONST_PLAYER_NORMALSPEED = 3;	//константа скорости шага
CONST_PLAYER_RUNSPEED = 2.1;	//константа коэффициента бега
CONST_PLAYER_RUNPOWERCONSUMPTION = 6.66; //потребление сил в секунду (чтобы хватило на 15 сек. бега)
CONST_PLAYER_RUNPOWERREGDELAY = 10;	//задержка перед восстановлением сил в секундах
CONST_PLAYER_RUNPOWERREGSPEED = 5;	//скорость восстановления сил для бега
player_wantRun = false;	//если нажат shift - true (персонаж хочет побежать)
player_run = false;		//персонаж бежит
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

//attack
player_attack = false;	//показывает, что персонаж собирается ударить
player_attackDamage = 15;		//урон игрока

//collisions
//в нужную ячейку списка записывается id объекта коллизии
player_col = ds_map_create();
player_col[?"enemy"] = 0;
player_col[?"npc"] = 0;
player_col[?"inv"] = 0;
player_col[?"mapObj"] = 0;
//player_col[?"solidObj"] = 0;
//player_col[?"sth"] = 0;
//объекты, через которые игрок не может пройти (стены и т.д.)
player_solidObj[0] = obj_simple_wall;
player_solidObj[1] = obj_inv_parent;
player_solidObj[2] = obj_env_door;
player_solidObj[3] = obj_env_terminal;

//interaction 
player_pressE = false;

//actions
//player_action = "";	//что в данный момент делает игрок


//СОСТОЯНИЯ
