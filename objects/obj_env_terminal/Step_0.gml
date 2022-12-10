/// @description 

// Inherit the parent event
event_inherited();

var spr_name = sprite_get_name(sprite_index);
var str = string_copy(spr_name, 0, 18);	//название спрайта без имени
var str1 = string_copy(spr_name, 19, string_length(spr_name));	//имя объекта
//если закончились сохранения
if (terminal_saves == 0) {
	//проверяю, что текущий спрайт не спрайт уничтоженного объекта
	if (str != "spr_terminal_empty") { 
		if (sprite_exists(asset_get_index("spr_terminal_empty" + str1))) {
			//назначаю спрайт уничтоженного объекта, добавляя имя самого объекта
			sprite_index = asset_get_index("spr_terminal_empty" + str1);
		}
	}
}


if (hp <= 0) {
	hp = 0;
	//проверяю, что текущий спрайт не спрайт уничтоженного объекта
	if (str != "spr_terminal_destr") {
		if (sprite_exists(asset_get_index("spr_terminal_destr" + str1))) {
			//назначаю спрайт уничтоженного объекта, добавляя имя самого объекта
			sprite_index = asset_get_index("spr_terminal_destr" + str1);
		}
	}
}