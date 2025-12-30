/// @description панки из первой части игры - первые враги


// main
action = "";
type = "enemy";
init = false; // инициализация
enemy_keyName = "punk1"; // ключ для константного массива (см. инициализацию)
enemy_isCustom = false; // задается в creation code и отвечает на вопрос: 
      // задаются ли переменные hp, damage и пр (см. user_ev(0)) вручную или берутся из констант

// interaction
enemy_needAttack = false; // если тру, враг движется к игроку
enemy_attack = false; // атака игрока
HP_MAX = 100; // максимальное здоровье панка
hp = 100; // текущее здоровье панка
enemy_spd = 5; // скорость движения врага

// рандомное перемещение при отсутсвии игрока
enemy_wander = true; // при отсутствии игрока враги, если могут, ходят в некоторой области
enemy_wanderBaseX = x;  // коородината, от которой отсчитывается область, в которой может бродить враг
enemy_wanderBaseY = y;
enemy_wanderMaxDist = 200; // расстояние, на которое может отойти враг при рандомной хотьбе

// drawing
enemy_isDrawHp = false; // нужно ли отображать жизни врагам
// основные спрайты !!!!!возможно стоит сделать массив спрайтов и передавать его из init с константами
enemy_spr_go = spr_enemy_punk1_run;
enemy_spr_state = spr_enemy_punk1_state;
enemy_spr_attack = spr_enemy_punk1_attack;

// setting
alarm[6] = 10; // бесцельное перемещение
