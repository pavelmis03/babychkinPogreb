/// @description объект дверь, который нас либо отправляет куда-то, либо просто открывается


//main
//открыть дверь, pre_room - закрыть. room name - перейти в комнату
destination = 0;
need_sv = 1;  //нужно сохранять
nonSvVar = ["nonSvVar", "init", "need_sv", "action", ];	


// Inherit the parent event
event_inherited();

