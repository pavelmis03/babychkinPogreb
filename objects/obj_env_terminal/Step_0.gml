/// @description 

// Inherit the parent event
event_inherited();

//скрипт проверки на возможность взаимодействия с игроком
//передаю дополнительные условияв в массивах ([var], [val])
scr_env_canInteract([terminal_state], [["work", "empty", "destr"]]);

//если закончились сохранения
if (terminal_saves <= 0) {
	terminal_saves = 0;
	terminal_state = "empty"; //изменяю состояние
}

//если закончились жизни
if (hp <= 0) {
	hp = 0;
	terminal_state = "destr"; //изменяю состояние
}