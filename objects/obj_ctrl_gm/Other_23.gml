/// @description начало новой игры

//создание контроллеров
//игровые
instance_create_depth(-10000, 0, 0, obj_ctrl_gm_img);
instance_create_depth(-10000, 0, 0, obj_ctrl_gm_pause);

//игрок
//instance_create_depth(-10000, 0, 0, obj_ctrl_inv);
instance_create_depth(-10000, 0, 0, obj_ctrl_gm_playerInterface);




