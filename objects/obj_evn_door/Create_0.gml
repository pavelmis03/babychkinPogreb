/// @description обеъкт дверь, который нас либо отправляет куда-то, либо просто открывается


//main
action = "";
//next_room - открыть дверь, pre_room - закрыть. room name - перейти в комнату
destination = "next_room";	//куда идти 
//door_open = false;
init = false;	//инициализация

//interaction
can_interact = false;	//можно ли взаимодествавать
player_obj = scr_player_type();	//какой игрок в комнате на момент создания
