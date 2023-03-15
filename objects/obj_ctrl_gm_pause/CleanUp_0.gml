/// @description 

/* к сожалению однажды посещенную комнату уже нельзя после этого сделать непостоянной с помощью функции room_set_persistent
	поэтому я просто не делаю комнаты постоянными и не парюсь
//очистка комнат, которым была назначена постоянность в случае выхода в меню 
for (var i = 0; i < ds_list_size(ctrl_pause_rmEscapeId); i++) {
	room_set_persistent(ctrl_pause_rmEscapeId[|i], 0);	
}

ds_list_destroy(ctrl_pause_rmEscapeId);
*/