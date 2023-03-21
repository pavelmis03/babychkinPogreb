/// @description инициализация

//item info
var arr = global.CONST_ITEMS[?inv_keyName];
inv_name = arr[0];			//название предмета
inv_weight = arr[1];		//вес предмета
inv_maxCntInv = arr[2];		//максимальное количество предметов на инвентарь
inv_maxCntCell = arr[3];	//максимальное количество предметов на ячейку
inv_type = arr[4];			//тип предмета
inv_discription = arr[5];	//описание предмета
inv_use = arr[6];		//приминение предмета
inv_rarity = arr[7];		//редкость предмета
inv_sellCost = arr[8][0];		//минимальная стоимость предмета
inv_buyCost = arr[8][1];		//максимальная стоимость предмета
if (!inv_isCustom) {
	inv_cnt = irandom_range(arr[9][0], arr[9][1]);		//текущее количество подбираемых предметов
	inv_hp = arr[10];			//количесвто здоровья (-1 если бесконечное)
	inv_isRmv = arr[11];		//необходимость удаления после поднятия/использования
} 

init = true;


