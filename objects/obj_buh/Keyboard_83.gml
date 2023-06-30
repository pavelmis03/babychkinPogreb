/// @description тормоз
if (scr_arr_fingEl([1, 2, 3], buh_status, 1) != -1) {	//если заведена или едет или заглохла (тормазить можно)
	
	var tt = instance_position(x, y, obj_ctrl_gm_surf);	//проверяю коллизию с поверхностью
	var t1 = 1;
	if (tt != noone) {	//если под нами определена поверхность
		t1 = tt.surf_params[1][0];	//уменьшенение торможения по поверхности 
	}
	
	var t2t = obj_ctrl_gm_buh.hp / (obj_ctrl_gm_buh.CONST_BUH_MAXHP * 4) + 0.75; //таким образом значение ф-и будет изменяться от 0.75 при hp = 0 до 1 при hp = maxHp
	var t2 = clamp(t2t, 0.75, 1);	//уменьшенение ускорения торможения по износу (до 1.5х раз уменьшение)
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