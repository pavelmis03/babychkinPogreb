/// @description получение урона от буханки

// если мы не едем, то нам неважно, есть коллизия или нет
if (other.speed != 0) {
	var m = obj_ctrl_gm_buh.buh_invWeight + 1845;	//масса
	var p = abs(other.speed) * m;//импульс буханки при текущей скорости (кг*м/с)
	var s1 = hp / (mapObj_dmgCoef[1] * m);	//скорость, которая нужна для разрушения предмета
	var tc = 18;	//т.к. буханка может при макс параметрах нанести до 90к урона, то она должна получать урон соответственно этому значению (при макс параметрах получить 5к урона, а не 90к)
	
	//если мы разрушим предмет
	if (p * mapObj_dmgCoef[1] > hp) {
		//шанс заглохнуть, если жизней меньше 50% до удара
		if (obj_ctrl_gm_buh.hp < obj_ctrl_gm_buh.CONST_BUH_MAXHP * 0.5) {
			if (irandom_range(1, 5) == 3) {
				scr_buh_stallAction(false);	//глохнем
			}
		}
		//скорость, которую нужно потратить на импульс для разрушения предмета
		other.speed -= s1;
		//тот же урон за вычетом брони мы наносим буханке
		obj_ctrl_gm_buh.hp -= (1 - obj_ctrl_gm_buh.armor) * s1 * m / tc;//(/tc уменьшаем получаемый буханкой урон)
		//уменьшаем броню буханки: урон, поглощенный броней на коэффициент урона. Броню уменьшаем на весь урон так надо
		obj_ctrl_gm_buh.armor -= obj_ctrl_gm_buh.armor * s1 * m * obj_ctrl_gm_buh.CONST_BUH_MAXARMORDMGCOEF;
		hp = 0;	//разрушаем предмет
	} else {
		//скорость, которую нужно потратить на импульс для разрушения предмета
		other.speed = 0;
		scr_buh_stallAction(false);	//глохнет (если сломается, это уже будет отловлено в буханке)
		//тот же урон за вычетом брони мы наносим буханке
		obj_ctrl_gm_buh.hp -= (1 - obj_ctrl_gm_buh.armor) * p / tc;//(/tc уменьшаем получаемый буханкой урон)
		//уменьшаем броню буханки: урон, поглощенный броней на коэффициент урона. Броню уменьшаем на весь урон так надо
		obj_ctrl_gm_buh.armor -= obj_ctrl_gm_buh.armor * p * obj_ctrl_gm_buh.CONST_BUH_MAXARMORDMGCOEF;
		//сколько урона получает предмет
		hp -= p * mapObj_dmgCoef[1];
	}
	
	obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaObjCrash";	
}