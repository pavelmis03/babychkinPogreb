/// @description таймер перехода в новую комнату

room_goto(next_rm_list_[|ds_list_size(next_rm_list_) - 1]);
ds_list_delete(next_rm_list_, ds_list_size(next_rm_list_) - 1);
action = "addRm"; //добавляем комнату в которую перешли