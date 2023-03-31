/// @description только для перезагрузки измененных и несохраненных комнат

//чтобы комнаты при запуске не получали ложную постоянность
if (ctrl_sv_isRmPers != -1) {
	room_persistent = ctrl_sv_isRmPers;
	ctrl_sv_isRmPers = -1;
}




