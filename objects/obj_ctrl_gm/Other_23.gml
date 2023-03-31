/// @description начало игры

//создание контроллеров
//игровые
instance_create_depth(-10000, 0, 0, obj_ctrl_tml);
instance_create_depth(-10000, 0, 0, obj_ctrl_gm_img);
instance_create_depth(-10000, 0, 0, obj_ctrl_gm_pause);

//игрок
instance_create_depth(-10000, 0, 0, obj_ctrl_gm_playerInterface);
instance_create_depth(-10000, 0, 0, obj_ctrl_gm_hint);
//сохраняемые
if (action == "startNewGm") {	//если новая игра, создаем сами
	instance_create_depth(-10000, 0, 0, obj_ctrl_gm_inv);
	instance_create_depth(-10000, 0, 0, obj_ctrl_gm_playerStatus);
	instance_create_depth(-10000, 0, 0, obj_ctrl_gm_iss);
} //иначе они будут загружены из файла сохранений

