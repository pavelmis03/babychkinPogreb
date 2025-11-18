/// @description отключение света

var t_id = layer_background_get_id("Backgrounds_2");
if (layer_background_get_visible(t_id)) {
	layer_background_visible(t_id, false);
	alarm[0] = 5 * fps;
} else {
	layer_background_visible(t_id, true);
	alarm[0] = fps * 2;
}
