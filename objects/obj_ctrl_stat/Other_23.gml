/// @description обновление массива отрисовки в соответствии со статистикой

ctrl_stat_arr_draw[0] = ["", false, 9, "", ""];		//общее
ctrl_stat_arr_draw[1] = ["Прогресс игры: ", false, 0, ctrl_stat_map[?"gameProgress"], "%"];
ctrl_stat_arr_draw[2] = ["Прогресс основной сюжетки: ", false, 0, ctrl_stat_map[?"plotProgress"], "%"];
ctrl_stat_arr_draw[3] = ["Прогресс дополнительных миссий: ", false, 0, ctrl_stat_map[?"subPlotProgress"], "%"];
ctrl_stat_arr_draw[4] = ["Достижений получено: ", false, 0, ctrl_stat_map[?"achieveCnt"], ""];
ctrl_stat_arr_draw[5] = ["Миссий завершено: ", false, 0, ctrl_stat_map[?"questCopmlete"], ""];
ctrl_stat_arr_draw[6] = ["Собрано особых предметов: ", false, 0, ctrl_stat_map[?"specialItems"], ""];
ctrl_stat_arr_draw[7] = ["Время в игре: ", false, 0, ctrl_stat_map[?"timeInGame"], ""];	
ctrl_stat_arr_draw[8] = ["Test: ", false, 0, "", ""];
ctrl_stat_arr_draw[9] = ["Test: ", false, 0, "", ""];
ctrl_stat_arr_draw[10] = ["", false, 8, "", ""];		//игрок
ctrl_stat_arr_draw[11] = ["Количество смертей: ", false, 0, "", ""];
ctrl_stat_arr_draw[12] = ["Смерти: ", false, 10, ctrl_stat_map[?"death"], ""];
ctrl_stat_arr_draw[13] = ["Убийства: ", false, 10, ctrl_stat_map[?"kill"], ""];
ctrl_stat_arr_draw[14] = ["Нанесенный урон: ", false, 10, ctrl_stat_map[?"giveDamage"], ""];
ctrl_stat_arr_draw[15] = ["Полученный урон: ", false, 10, ctrl_stat_map[?"getDamage"], ""];
ctrl_stat_arr_draw[16] = ["Пройденное расстояние: ", false, 10, ctrl_stat_map[?"dist"], "km"];
ctrl_stat_arr_draw[17] = ["Выстрелы: ", false, 10, ctrl_stat_map[?"shot"], ""];
ctrl_stat_arr_draw[18] = ["Точность (попадания/промахи): ", false, 10, ctrl_stat_map[?"accuracy"], "%"];
ctrl_stat_arr_draw[19] = ["", false, 3, "", ""];		//буханка
ctrl_stat_arr_draw[20] = ["Пробег: ", false, 0, ctrl_stat_map[?"mileage"], "km"];
ctrl_stat_arr_draw[21] = ["Прокачка: ", false, 0, ctrl_stat_map[?"pumping"], "%"];
ctrl_stat_arr_draw[22] = ["Не завелась: ", false, 0, ctrl_stat_map[?"integrity"], ""];
//создам заранее, потом буду динамически добавлять инфу
ctrl_stat_arr_draw[23] = ["", false, 1, "", ""];		//другое
ctrl_stat_arr_draw[24] = ["Что-то: ", false, 0, "", ""];		//другое

draw_txt_x = room_width * 0.15;
draw_txt_y = room_height * 0.35;
