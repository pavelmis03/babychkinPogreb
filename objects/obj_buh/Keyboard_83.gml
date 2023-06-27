/// @description тормоз
if (scr_arr_fingEl([1, 3], buh_status, 1) != -1) {	//если заведена или едет
	var t1 = clamp(1, 0.5, 1);	//уменьшенение ускорения по сопротивлению поверхности (до 2х раз уменьшение)
	var t2t = obj_ctrl_gm_buh.hp / (obj_ctrl_gm_buh.CONST_BUH_MAXHP * 4) + 0.75; //таким образом значение ф-и будет изменяться от 0.75 при hp = 0 до 1 при hp = maxHp
	var t2 = clamp(t2t, 0.75, 1);	//уменьшенение ускорения по износу (до 1.5х раз уменьшение)
	if (buh_transmission == 5) {	//реверс
		speed += (CONST_BUH_DEBOOST * t1 * t2) / room_speed;	//все наоборот т.к. скорость отрицательная
		speed = clamp(speed, -15, 0);
	} else {
		speed -= (CONST_BUH_DEBOOST * t1 * t2) / room_speed;
		speed = clamp(speed, 0, 120);
	}
	if (speed != 0) {
		scr_snd_requestPlaySnd(snd_buh_squeak, snd_buh_squeak, 20, true);	//воспроизводим звук срипа тормозов
	} 
}