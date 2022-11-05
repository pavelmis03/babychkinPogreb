/// @description объект дверь, который нас либо отправляет куда-то, либо просто открывается


//main
action = "";
//открыть дверь, pre_room - закрыть. room name - перейти в комнату
destination = 0;
//door_open = false;
init = false;	//инициализация
type = "mapObj";//для взаимодействия с игроком

//interaction
can_interact = false;	//можно ли взаимодествавать
player_obj = scr_player_type();	//какой игрок в комнате на момент создания
