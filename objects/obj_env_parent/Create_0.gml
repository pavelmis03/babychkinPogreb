/// @description родительский элемент для всех объектов взаимодействия

//main
action = "";

init = false;	//инициализация
type = "mapObj";//для взаимодействия с игроком

//interaction
can_interact = false;	//можно ли взаимодествавать
interacting = false;	//сообщает о том, что сейчас происходит взаимодействие
player_obj = scr_player_type();	//какой игрок в комнате на момент создания

