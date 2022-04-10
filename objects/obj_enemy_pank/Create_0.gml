/// @description панки из первой части игры - первые враги

event_inherited();

//main
enemy_keyName = "pank1";

//setting
//enemy_isDrawHp = false;	//D

//draw
enemy_spr_go = spr_enemy_pank_run;
enemy_spr_state = spr_enemy_pank_state;
enemy_spr_attack = spr_enemy_pank_attack;
