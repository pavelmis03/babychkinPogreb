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
inv_sellCost = arr[8];		//минимальная стоимость предмета
inv_buyCost = arr[9];		//максимальная стоимость предмета
if (!inv_isCustom) {
	inv_cnt = irandom_range(arr[10], arr[11]);		//минимальное количество содержимого
	inv_hp = arr[12];			//количесвто здоровья (-1 если бесконечное)
	inv_isRmv = arr[13];		//необходимость удаления после поднятия/использования
} 

init = true;
