/// @description обновление массива подсказок в соответствии с частью игры

if (obj_ctrl_gm.ctrl_gm_stage == 1) {
	ctrl_hint_hint_map[?"gmPart"] = "1";
} else {
	ctrl_hint_hint_map[?"gmPart"] = "2";
}
