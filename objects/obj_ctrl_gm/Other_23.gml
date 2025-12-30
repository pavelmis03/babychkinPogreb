/// @description начало игры

// создание контроллеров
// игровые
var obj;
obj = instance_create_depth(-10000, 0, 0, obj_ctrl_tml);
obj = instance_create_depth(-10000, 0, 0, obj_ctrl_gm_img);
obj = instance_create_depth(-10000, 0, 0, obj_ctrl_gm_pause);

// сохраняемые
if (action == "startNewGm") {	// если новая игра, создаем сами
	obj = instance_create_depth(-10000, 0, 0, obj_ctrl_gm_buh);
	obj = instance_create_depth(-10000, 0, 0, obj_ctrl_gm_inv);
	obj = instance_create_depth(-10000, 0, 0, obj_ctrl_gm_playerStatus);
	// отмечаем, что мы начали новую игру
	obj.player_isNewGm = true;
	obj = instance_create_depth(-10000, 0, 0, obj_ctrl_gm_iss);
	obj = instance_create_depth(-10000, 0, 0, obj_ctrl_gm_equ);
} // иначе они будут загружены из файла сохранений

// игрок
obj = instance_create_depth(-10000, 0, 0, obj_ctrl_gm_playerInterface);
obj = instance_create_depth(-10000, 0, 0, obj_ctrl_gm_hint);