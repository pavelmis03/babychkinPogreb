/// @description выполняет сюжетное действие в зависимости от позиции игрока 
//работает так: кладется на область в комнате, 
//при контакте с игроком вызывает действие, назначенное в creation code

//main
need_sv = 1;	//нужно ли сохранять данный объект
//имена переменных, которые не нужно сохранять
nonSvVar = ["nonSvVar", "init", "need_sv"];	
action = "";
//задется в creationCode
//T - триггер, M - метка. Оличаются тем, что триггер выполняет некоторое действие 
//при активации, обычно невидим. Метка лишь указывает точку прибытия, при активации удаляется
type = "";	//posT/M - T/M по позиции, clickT/M - по клику
//для метки

//триггер перехода в другую комнату
target_rm = 0;	//комната, в которую нужно будет перекинуть объект, если он попадет в этот триггер
padding = 300;	//отступ от края комнаты, на котором нужно создавать игрока при переходе в соседнюю комнату локации
padding_buh = 400;//отступ от края комнаты, на котором нужно создавать буханку при переходе в соседнюю комнату локации

init = false;