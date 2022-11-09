/// @description обеъкт монстр


//main
action = "";
type = "enemy";
init = false;	//инициализация
enemy_keyName = "";	//ключ для константного массива (см. инициализацию)
enemy_isCustom = false;	//задается в creation code и отвечает на вопрос: 
						//задаются ли переменные hp, damage и пр (см. user_ev(0)) вручную или берутся из констант

//interaction
enemy_needAttack = false;	//если тру, враг движется к игроку
enemy_attack = false;		//атака игрока

//рандомное перемещение при отсутсвии игрока
enemy_wander = true;	//при отсутствии игрока враги, если могут, ходят в некоторой области
enemy_wanderBaseX = x;		//коородината, от которой отсчитывается область, в которой может бродить враг
enemy_wanderBaseY = y;
enemy_wanderMaxDist = 100;	//расстояние, на которое может отойти враг при рандомной хотьбе

//drawing
enemy_isDrawHp = true;	//нужно ли отображать жизни врагам
//основные спрайты	!!!!!возможно стоит сделать массив спрайтов и передавать его из init с константами
enemy_spr_go = spr_sys_none;
enemy_spr_state = spr_sys_none;
enemy_spr_attack = spr_sys_none;

//setting
alarm[6] = 10;	//бесцельное перемещение

