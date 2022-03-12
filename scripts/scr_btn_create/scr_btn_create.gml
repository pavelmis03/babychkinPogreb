/// @function scr_btn_create(p_x, p_y, spr, p_depth, img_spd, action, type);
/// @param {} p_x абсцисса создаваемой кнопки
/// @param {} p_y ордината создаваемой кнопки
/// @param {} spr спрайт создаваемой кнопки
/// @param {} p_depth глубина создаваемой кнопки
/// @param {} img_spd скорость проигрывания спрайта создаваемой кнопки
/// @param {} btn_action действие создаваемой кнопки
/// @param {} btn_type тип создаваемой кнопки
/// @param {} snd_arr массив звуков создаваемой кнопки
/// @description создает кнопку по заданным параметрам
function scr_btn_create(p_x, p_y, spr, p_depth, img_spd, action, type, snd_arr) {
	var t_id = instance_create_depth(p_x, p_y, 0, obj_btn);
	t_id.sprite_index = spr;
	t_id.depth = p_depth;
	t_id.image_speed = img_spd;
	t_id.action = action;
	t_id.type = type;
	array_copy(t_id.sound, 0, snd_arr, 0, array_length(snd_arr));
	
	return t_id;
}