/// @description отключение света

var t_id = layer_background_get_id("Backgrounds_2");
if (layer_background_get_visible(t_id)) {
	layer_background_visible(t_id, false);
	alarm[0] = 5 * room_speed;
} else {
	layer_background_visible(t_id, true);
	alarm[0] = room_speed * 2;
}
