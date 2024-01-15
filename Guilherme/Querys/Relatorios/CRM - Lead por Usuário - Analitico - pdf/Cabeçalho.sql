SELECT 
	concat('De: ', DATE_FORMAT(:dt_inicial,'%d/%m/%Y')) dt_inicial,
	concat('até: ', DATE_FORMAT(:dt_final,'%d/%m/%Y')) dt_final