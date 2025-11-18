/// @description инициализация

var t = global.CONST_MAP_SOLIDOBJ[?name];

if ((need_sv != 1) or (hp == t[0])) {	// только если не были сохранены изменения в объект
	maxHp = t[0];	
	hp = t[0];	
	mapObj_dmgCoef = t[1];		
	// mapObj_sprStg = spr_sys_none;	// спрайт изображений поломки
	sprite_index = t[2]
	mapObj_sprdeath = t[3];	
	mapObj_afterDeath = t[4];	

	image_speed = 0;
}

if (name == "simple_wall") {	// если это объект обычной стены, мы его не сохраняем
	need_sv = 0;
}

// разбираем массив-таблицу инвентаря 
// (в файле все хранится, как строки и возвращается массив в правильном виде, но все конечные значения - строки)
for (var i = 0; i < array_length(mapObj_dmgCoef); i++) {
	mapObj_dmgCoef[i] = real(mapObj_dmgCoef[i]);
}

init = true;