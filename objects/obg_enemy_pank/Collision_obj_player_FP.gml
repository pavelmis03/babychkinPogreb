/// @description 

event_inherited();

//спрайт атаки и информация об атаке
if (!enemy_attack) {
	enemy_attack = true;
	sprite_index = spr_enemy_pank_attack;
	speed = 0;
}