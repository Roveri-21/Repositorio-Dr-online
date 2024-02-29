-- Apos validar todos os ponto adicione esse scripty a notificação 147
SELECT 
    "ds_email" || '.5' 	                AS "ds_email"           ,
    "nm_contato"	 		            AS "nm_contato"         ,
    "ds_subtitulo"						AS "ds_subtitulo"		,
    "nr_contato" 		                AS "nr_contato"         ,
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
	504,
	503,
	502,
	501
)
AND NOT EXISTS (
	SELECT 	1 
	FROM 	TEL_VENDA tv 
	WHERE 	tv.ID_CAMPANHA 	= tet."ds_email" 
	AND 	tv.CODCLI 		= "ds_subtitulo"  
)
-- e sempre bom validar a quantidade de linhas bate com a quantidade de disparo