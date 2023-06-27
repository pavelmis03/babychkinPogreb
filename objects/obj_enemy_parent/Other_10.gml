/// @description инициализация

//main
//ПОТОМ УБРАТЬ ИЗ РОДИТЕЛЯ И ПОМЕСТИТЬ В НУЖНЫХ МОНСТРОВ
//need_sv = 1;	//нужно ли сохранять данный объект
//nonSvVar = ["nonSvVar", "init", "need_sv", "action", ];	
action = "";

//enemy info
/*
var arr = global.CONST_MAP_ENEMY[?enemy_keyName];
enemy_name = arr[0];		//название
enemy_spd = arr[1];			//скорость
//если враг бродит с момента создания, сразу задаем ему скорость
if (enemy_wander) {
	speed = enemy_spd;
}

enemy_type = arr[4];		//тип врага
enemy_discription = arr[5];	//описание
enemy_application = arr[6];	//редкость

enemy_seeDist = arr[7];		//дальность зрения

enemy_wanderMaxDist = arr[8];	//дальность, на которую враг уходит при рандомной хотьбе

if (!enemy_isCustom) {
	hp = arr[2];				//количество здоровья (-1 если бесконечное)
	maxHp = hp;					//изначальное количество жизней, нужно для рисования полоски жизней
	enemy_damage = arr[3];		//урон (ближний бой, дальний1, дальний2, ...)
}

init = true;



