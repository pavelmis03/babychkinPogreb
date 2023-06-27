/// @description 

draw_self();
/*
if (enemy_isDrawHp) { //нужно ли отображать жизни врагам
	//полоска жизней
	draw_set_color(c_white);
	var t = sprite_height / 2 + 15;
	draw_rectangle(x - 54, y - t, x + 54, y - t - 19, true); 
	draw_set_color(c_red);
	if (hp < 0) {	//чтобы полоска не улетала за границы при чрезмерном уроне
		hp = 0;
	}
	draw_rectangle(x - 49, y - t - 4, x - 50 + hp / maxHp * 100, y - t - 14, false);
}