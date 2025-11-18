/// @description 
draw_self();
// прямоугольник рамки
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1)
// для проверки collision line
draw_set_color(c_white)
draw_line(x, y, x + lengthdir_x(60, image_angle), y + lengthdir_y(60, image_angle));