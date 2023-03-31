//возвращаю номер таймера в незанятые
ds_list_add(ctrl_tml_list_alarmFree, 0);
//выполняю действие
action = ctrl_tml_alarmAction_arr[0];
ctrl_tml_alarmAction_arr[0] = "";
