/// @description инициализация

var t = global.CONST_MAP_SOLIDOBJ[?name];

maxHp = t[0];	
hp = t[0];	
mapObj_dmgCoef = t[1];		
//mapObj_sprStg = spr_sys_none;	//спрайт изображений поломки
sprite_index = t[2]
mapObj_sprdeath = t[3];	
mapObj_afterDeath = t[4];	

image_speed = 0;

if (name != "simple_wall") {	//если это не объект стены, мы его сохраняем
	need_sv = 1;
}

init = true;