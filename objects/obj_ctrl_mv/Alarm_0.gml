/// @description таймер перехода в новую комнату

room_goto(next_rm[|ds_list_size(next_rm) - 1]);
ds_list_delete(next_rm, ds_list_size(next_rm) - 1);
action = "addRm"; //добавляем комнату в которую перешли