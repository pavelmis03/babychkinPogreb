/// @description 

event_inherited();

//if (place_meeting(x, y, player)) {
	//спрайт атаки и информация об атаке
	if (!enemy_attack) {
		enemy_attack = true;
		sprite_index = spr_enemy_pank_attack;
		speed = 0;
	}
//}