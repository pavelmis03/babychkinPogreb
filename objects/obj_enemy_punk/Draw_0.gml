/// @description 

// Inherit the parent event
event_inherited();


// код Макса
draw_text(x, y + 100, hp);
// красная заливка (жизни)
draw_set_color(c_red);
draw_rectangle(x - 50, y - 82, x + 50, y - 70, false);
// контур шкалы здоровья панка
draw_set_color(c_white);
draw_rectangle(x - 52, y - 84, x + 52, y - 68, true);
// черный прямоугольник, закрывающий пустоту при уменьшении жизней
draw_set_color(c_black);
var hpPerPixel = HP_MAX / 100;
var rectLen = hp / hpPerPixel; // длина прямоуг. текущего здоровья от левой границы
draw_rectangle(x - 50 + rectLen, y - 82, x + 50, y - 70, false);

