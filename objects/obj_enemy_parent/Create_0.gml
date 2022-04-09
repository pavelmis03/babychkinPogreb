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
enemy_baseX = x;		//коородината, от которой отсчитывается область, в которой может бродить враг
enemy_basey = y;
enemy_wanderDist = 100;	//расстояние, на которое может ото

//drawing
enemy_isDrawHp = true;	//нужно ли отображать жизни врагам

//setting
alarm[6] = 10;	//бесцельное перемещение

