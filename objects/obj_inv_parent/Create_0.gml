/*

СДЕЛАТЬ ПО АНАЛОГИИ С ДВЕРЬЮ И ОБЯЗАТЕЛЬНО ДОБАВИТЬ ПЕРЕМЕННУЮ can_interact




/// @description

//main
init = false;
type = "inv";

inv_keyName = "";	//ключ для поиска информации по предмету в константном массиве
inv_isCustom = false;	//задается в creation code и отвечает на вопрос: 
						//задаются ли переменные hp, cnt и inv_isRmv (см. user_ev(0)) вручную или берутся из констант


//inv_isLoot = false;	//было ли взаимодействие игрока с этим предметом

//collision
inv_canLoot = true;	//взможно ли взаимодействовать с предметом
inv_nearPlayer = false;		//находиться ли игрок рядом
inv_dirIsSatisfies = false;	//смотрит ли игрок в сторону предмета

//


