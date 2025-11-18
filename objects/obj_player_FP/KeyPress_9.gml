/// @description инвентарь

if ((!player_attack) and (!player_pressE) and (!player_openInv)) {
	player_openInv = true;
	sprite_index = spr_playerFP_openInv;
	speed = 0;
	image_index = 0;
	image_speed = 1;
}
