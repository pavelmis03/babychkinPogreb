/// @description очистка данных

// удаляем игроков, если есть
for (var i = 0; i < array_length(player_arr); i++) {
	if (instance_exists(player_arr[i])) {
		instance_destroy(player_arr[i]);
	}	
}

// ds_map_destroy(player_map_sysParam);
ds_map_destroy(player_map_info);