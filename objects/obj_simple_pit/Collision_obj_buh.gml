/// @description получение урона от наезда на яму

//если мы еще не получали урон при этом контакте
if (!pit_buhReceiveDmg) {
	//при максимальной скорости получаем максимальный урон
	var t = 120 / (pit_dmg[1] - pit_dmg[0]);	//коэффициент
	//таким образом значение ф-и будет изменяться от pit_dmg[0] при speed = 0 до pit_dmg[1] при speed * 3.6 = 120
	obj_ctrl_gm_buh.hp -= other.speed * 3.6 / t + pit_dmg[0];//зависит от скорости
	obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaPit";	
}

pit_buhReceiveDmg = true;