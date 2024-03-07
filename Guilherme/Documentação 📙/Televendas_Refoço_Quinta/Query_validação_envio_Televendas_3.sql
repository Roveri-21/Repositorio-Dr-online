(SELECT 
    0 || '.5' 	                AS "ds_email"           ,
    'Guilherme'	 		            AS "nm_contato"         ,
    0						AS "ds_subtitulo"		,
    '62981609324' 		                AS "nr_contato"         ,
    "var_1"                             as "var_1"              ,
    "var_18"                            as "var_2"              ,
    "var_2"                             as "var_3"              ,
    "var_3"                             as "var_4"              ,
    "var_4"                             as "var_5"              ,
    "var_5"                             as "var_6"              ,
    "var_6"                             as "var_7"              ,
    "var_7"                             as "var_8"              ,
    "var_8"                             as "var_9"              ,
    "var_9"                             as "var_10"             ,
    "var_10"                            as "var_11"             ,
    "var_11"                            as "var_12"             ,
    "var_12"                            as "var_13"             ,
    "var_13"                            as "var_14"             ,
    "var_14"                            as "var_15"             ,
    "var_15"                            as "var_16"             ,
    "var_16"                            as "var_17"             ,
    "var_17"                            as "var_18"             ,
    "var_18"                            as "var_19"  
FROM TEL_ENVIO_TELEVENDAS tet 
where tet."ds_email" in (	
	584,
583,
582,
581
)
AND NOT EXISTS (
	SELECT 	1 
	FROM 	TEL_VENDA tv 
	WHERE 	tv.ID_CAMPANHA 	= tet."ds_email" 
	AND 	tv.CODCLI 		= "ds_subtitulo"  
)
 FETCH FIRST 1row ONLY)
 union
(
   (SELECT 
    0 || '.5' 	                AS "ds_email"           ,
    'Adão'	 		            AS "nm_contato"         ,
    0						AS "ds_subtitulo"		,
    '6392518670' 		                AS "nr_contato"         ,
    "var_1"                             as "var_1"              ,
    "var_18"                            as "var_2"              ,
    "var_2"                             as "var_3"              ,
    "var_3"                             as "var_4"              ,
    "var_4"                             as "var_5"              ,
    "var_5"                             as "var_6"              ,
    "var_6"                             as "var_7"              ,
    "var_7"                             as "var_8"              ,
    "var_8"                             as "var_9"              ,
    "var_9"                             as "var_10"             ,
    "var_10"                            as "var_11"             ,
    "var_11"                            as "var_12"             ,
    "var_12"                            as "var_13"             ,
    "var_13"                            as "var_14"             ,
    "var_14"                            as "var_15"             ,
    "var_15"                            as "var_16"             ,
    "var_16"                            as "var_17"             ,
    "var_17"                            as "var_18"             ,
    "var_18"                            as "var_19"  
FROM TEL_ENVIO_TELEVENDAS tet 
where tet."ds_email" in (	
	584,
583,
582,
581
)
AND NOT EXISTS (
	SELECT 	1 
	FROM 	TEL_VENDA tv 
	WHERE 	tv.ID_CAMPANHA 	= tet."ds_email" 
	AND 	tv.CODCLI 		= "ds_subtitulo"  
)
 FETCH FIRST 1row ONLY) 
)
 union
(
   (SELECT 
    0 || '.5' 	                AS "ds_email"           ,
    'Joelton'	 		            AS "nm_contato"         ,
    0						AS "ds_subtitulo"		,
    '6392853318' 		                AS "nr_contato"         ,
    "var_1"                             as "var_1"              ,
    "var_18"                            as "var_2"              ,
    "var_2"                             as "var_3"              ,
    "var_3"                             as "var_4"              ,
    "var_4"                             as "var_5"              ,
    "var_5"                             as "var_6"              ,
    "var_6"                             as "var_7"              ,
    "var_7"                             as "var_8"              ,
    "var_8"                             as "var_9"              ,
    "var_9"                             as "var_10"             ,
    "var_10"                            as "var_11"             ,
    "var_11"                            as "var_12"             ,
    "var_12"                            as "var_13"             ,
    "var_13"                            as "var_14"             ,
    "var_14"                            as "var_15"             ,
    "var_15"                            as "var_16"             ,
    "var_16"                            as "var_17"             ,
    "var_17"                            as "var_18"             ,
    "var_18"                            as "var_19"  
FROM TEL_ENVIO_TELEVENDAS tet 
where tet."ds_email" in (	
	584,
583,
582,
581
)
AND NOT EXISTS (
	SELECT 	1 
	FROM 	TEL_VENDA tv 
	WHERE 	tv.ID_CAMPANHA 	= tet."ds_email" 
	AND 	tv.CODCLI 		= "ds_subtitulo"  
)
 FETCH FIRST 1row ONLY) 
)
 union
(
   (SELECT 
    0 || '.5' 	                AS "ds_email"           ,
    'Johnathan'	 		            AS "nm_contato"         ,
    0						AS "ds_subtitulo"		,
    '6281110455' 		                AS "nr_contato"         ,
    "var_1"                             as "var_1"              ,
    "var_18"                            as "var_2"              ,
    "var_2"                             as "var_3"              ,
    "var_3"                             as "var_4"              ,
    "var_4"                             as "var_5"              ,
    "var_5"                             as "var_6"              ,
    "var_6"                             as "var_7"              ,
    "var_7"                             as "var_8"              ,
    "var_8"                             as "var_9"              ,
    "var_9"                             as "var_10"             ,
    "var_10"                            as "var_11"             ,
    "var_11"                            as "var_12"             ,
    "var_12"                            as "var_13"             ,
    "var_13"                            as "var_14"             ,
    "var_14"                            as "var_15"             ,
    "var_15"                            as "var_16"             ,
    "var_16"                            as "var_17"             ,
    "var_17"                            as "var_18"             ,
    "var_18"                            as "var_19"  
FROM TEL_ENVIO_TELEVENDAS tet 
where tet."ds_email" in (	
	584,
583,
582,
581
)
AND NOT EXISTS (
	SELECT 	1 
	FROM 	TEL_VENDA tv 
	WHERE 	tv.ID_CAMPANHA 	= tet."ds_email" 
	AND 	tv.CODCLI 		= "ds_subtitulo"  
)
 FETCH FIRST 1row ONLY) 
)