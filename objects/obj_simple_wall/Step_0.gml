/// @description 
if (!init) {
	event_user(0);	
}

if (hp > 0) {
	//в зависимости от количества жизней выставляем картинку поломанности
	image_index = image_number - clamp(hp / (maxHp / image_number), 0, image_number);	
} else {	//если предмет умер
	if (mapObj_afterDeath == 0) {	//умираем сразу
		instance_destroy();
	}
	if (mapObj_afterDeath == 1) {	//умираем после проигрывания спрайта смерти
		var obj = instance_create_depth(x, y, depth, obj_simple_forDrawSpr);	//создаем такой же объект, но уже не твердый
		obj.image_xscale = image_xscale;			//чтобы проиграть в нем спрайт смерти и убить его!
		obj.image_yscale = image_yscale;
		obj.sprite_index = mapObj_sprdeath;
		obj.image_index = 0;
		obj.image_speed = 1;
		obj.action = "destroyAfterAnimEnd";
		instance_destroy();	//уничтожаем твердый предмет
	}
	if (mapObj_afterDeath == 2) { //если не умираем вообще, проигрываем спрайт смерти
		sprite_index = mapObj_sprdeath;
		image_index = 0;
		image_speed = 1;
	}
}

//СКРИПТ ПОЛУЧЕНИЯ УРОНА ОТ ПУЛЬ ИГРОКА, МОНСТРОВ И Т.Д.


hp = clamp(hp, 0, hp);
