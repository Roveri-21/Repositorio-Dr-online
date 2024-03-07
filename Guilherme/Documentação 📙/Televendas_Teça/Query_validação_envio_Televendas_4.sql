    (SELECT 
    0 AS "ds_email", 
    'Guilherme' AS "nm_contato", 
    0 AS "ds_subtitulo", 
    '62981609324' AS "nr_contato", "var_1", "var_2", "var_3", "var_4", "var_5", "var_6", "var_7", "var_8", "var_9", "var_10", "var_11", "var_12", "var_13", "var_14", "var_15", "var_16", "var_17", "var_18" 	
    FROM TEL_ENVIO_TELEVENDAS tet 
    WHERE tet."ds_email" IN (501,502,503,504) -- altere para as campanhas atuais
    FETCH FIRST 1row ONLY)
   	union  
    (SELECT 
    0 AS "ds_email", 
    'Joelton' AS "nm_contato", 
    0 AS "ds_subtitulo", 
    '63992853318' AS "nr_contato", "var_1", "var_2", "var_3", "var_4", "var_5", "var_6", "var_7", "var_8", "var_9", "var_10", "var_11", "var_12", "var_13", "var_14", "var_15", "var_16", "var_17", "var_18" 	
    FROM TEL_ENVIO_TELEVENDAS tet 
    WHERE tet."ds_email" IN (501,502,503,504) -- altere para as campanhas atuais
    FETCH FIRST 1row ONLY)

    -- caso esse processo esteja correto basta apenas realizar o envio na notificação 145.




    (SELECT
0 AS "ds_email",
'Guilherme' AS "nm_contato",
0 AS "ds_subtitulo",
'62981609324' AS "nr_contato", "var_1", "var_2", "var_3", "var_4", "var_5", "var_6", "var_7", "var_8", "var_9", "var_10", "var_11", "var_12", "var_13", "var_14", "var_15", "var_16", "var_17", "var_18"
FROM TEL_ENVIO_TELEVENDAS tet
WHERE tet."ds_email" IN (581,582,583,584) -- altere para as campanhas atuais
FETCH FIRST 1row ONLY)
     UNION
(SELECT
0 AS "ds_email",
'Adão' AS "nm_contato",
0 AS "ds_subtitulo",
'6392518670' AS "nr_contato", "var_1", "var_2", "var_3", "var_4", "var_5", "var_6", "var_7", "var_8", "var_9", "var_10", "var_11", "var_12", "var_13", "var_14", "var_15", "var_16", "var_17", "var_18"
FROM TEL_ENVIO_TELEVENDAS tet
WHERE tet."ds_email" IN (581,582,583,584) -- altere para as campanhas atuais
FETCH FIRST 1row ONLY)
     UNION
(SELECT
0 AS "ds_email",
'Johnathan' AS "nm_contato",
0 AS "ds_subtitulo",
'6281110455' AS "nr_contato", "var_1", "var_2", "var_3", "var_4", "var_5", "var_6", "var_7", "var_8", "var_9", "var_10", "var_11", "var_12", "var_13", "var_14", "var_15", "var_16", "var_17", "var_18"
FROM TEL_ENVIO_TELEVENDAS tet
WHERE tet."ds_email" IN (581,582,583,584) -- altere para as campanhas atuais
FETCH FIRST 1row ONLY)
     union
(SELECT
0 AS "ds_email",
'Joelton' AS "nm_contato",
0 AS "ds_subtitulo",
'63992853318' AS "nr_contato", "var_1", "var_2", "var_3", "var_4", "var_5", "var_6", "var_7", "var_8", "var_9", "var_10", "var_11", "var_12", "var_13", "var_14", "var_15", "var_16", "var_17", "var_18"
FROM TEL_ENVIO_TELEVENDAS tet
WHERE tet."ds_email" IN (581,582,583,584) -- altere para as campanhas atuais
FETCH FIRST 1row ONLY)
    -- caso esse processo esteja correto basta apenas realizar o envio na notificação 145.