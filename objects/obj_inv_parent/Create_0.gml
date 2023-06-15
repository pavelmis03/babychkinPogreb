/// @description объект родителя предмета, который можно поднять


//main
//ПОТОМ УБРАТЬ ИЗ РОДИТЕЛЯ И ПОМЕСТИТЬ В НУЖНЫЕ ОБЪЕКТЫ
need_sv = 1;	//нужно ли сохранять данный объект
nonSvVar = ["nonSvVar", "init", "need_sv", "action", "can_interact", "player_obj"];	
action = "";
init = false;	//инициализация
type = "inv";	//для взаимодействия с игроком

//interaction
inv_canLoot = true;		//возможно ли использовать/поднять предмет в принципе
can_interact = false;	//можно ли взаимодествавать сейчас
player_obj = scr_player_type();	//какой игрок в комнате на момент создания
//inv_nearPlayer = false;		//находиться ли игрок рядом
//inv_dirIsSatisfies = false;	//смотрит ли игрок в сторону предмета
//inv_isLoot = false;	//было ли взаимодействие игрока с этим предметом

inv_keyName = "parent";	//ключ для поиска информации по предмету в константном массиве
inv_isCustom = false;	//задается в creation code и отвечает на вопрос: 
						//задаются ли переменные hp, cnt и inv_isRmv (см. user_ev(0)) вручную или берутся из констант

//draw
hint = "take_inv";	//стандартная подсказка для объекта инвентаря. При необходимости заменяется.
inv_empty_spr = sprite_index;	//спрайт пустой коробки/предмета (по умолчанию изначальный спрайт)
inv_death_spr = sprite_index;	//спрайт уничтоженных коробки/предмета (по умолчанию изначальный спрайт)



