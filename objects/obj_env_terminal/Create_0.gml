/// @description объект сохранения. одновременно и игровой и системный объект: инициирует сохранение

//saves
terminal_saves = 9999999;	//сколько сохранений осталось (-1 не использовать)
terminal_state = "work";//функционирует ("destr" - уничтожен, "reload" - перезагружается после сохранения, "empty" - пустой)
hp = 9999999999;		//сколько жизней осталось (-1 не использовать!)
need_sv = 1;	//сохраняем
nonSvVar = ["nonSvVar", "init", "need_sv", "action", "terminal_state"];	

// Inherit the parent event
event_inherited();

