/// @description кнопка удара дубинкой 
if (!player_attack and !player_pressE) {
	player_attack = true;
	speed = 0;
	sprite_index = spr_playerFP_attack;
	image_index = 0;
	image_speed = 1;
	scr_snd_requestPlaySnd(snd_playerFP_swing, snd_playerFP_swing, 20, true);	//звук удара
}