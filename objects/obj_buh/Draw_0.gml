/// @description 


draw_self();
//прямоугольник рамки
//draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1)
//для проверки collision line
var px = player_obj.x, py = player_obj.y;
draw_set_color(c_white)
draw_line(px, py, px + lengthdir_x(60, player_obj.image_angle), py + lengthdir_y(60, player_obj.image_angle))

draw_text(300, 330, "speed " + string(speed * 3.6));
draw_text(300, 350, "Fuel " + string(obj_ctrl_gm_buh.buh_fuel));
draw_text(300, 370, "Износ " + string(buh_decomposition + buh_decomposition1));
draw_text(300, 390, "Hp " + string(obj_ctrl_gm_buh.hp));
draw_text(300, 410, "Передача: " + string(buh_transmission));

