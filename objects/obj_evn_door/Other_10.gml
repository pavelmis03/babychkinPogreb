/// @description инициализация
/*
//стена, которая находится под дверью
//здесь потому, что creation code, в котором назначается спрайт, срабатывает после create
door_wall = instance_create_depth(x - sprite_width / 2, y - sprite_height / 2, depth - 1, obj_simple_wall);
//настраиваю ширину стены по размерам маски двери
door_wall.sprite_width = bbox_right - bbox_left;
door_wall.image_xscale = sprite_width / (bbox_right - bbox_left);
door_wall.image_yscale = sprite_height / (bbox_bottom - bbox_top);

init = true;