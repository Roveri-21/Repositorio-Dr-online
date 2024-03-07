-- VERIFICAR CAMPANHAS GERADAS
    -- Traz as CAMPANHA GERADAS das semana
    SELECT 	
        * 
    FROM
     	TEL_CAMPANHA tc 
    WHERE
     	ID IN (561,562,563,564)
    ORDER BY ID DESC;

    -- Traz os CLIENTES  da campanha
    SELECT
     	*
    FROM
     	TEL_CLIENTE tc 
    WHERE
        ID_CAMPANHA IN (561,562,563,564);
    
    --Traz os PRODUTOS da campanha
    SELECT
     	*
    FROM
     	TEL_CAMPANHA_PRODUTO_DESCONTO tcpd 
    WHERE
     	ID_CAMPANHA IN (561,562,563,564);

    -- TELEFONES QUE SERÃO ENVIADOS
    SELECT
      * 
    FROM
        TEL_CLIENTE_TELEFONES_CAMPANHA
    WHERE   ID_CAMPANHA IN (561,562,563,564);
    
-- ENVIO 
    -- SQL TELEVENDAS
    SELECT
        *	
    FROM
        TEL_ENVIO_TELEVENDAS tet 
    WHERE
     tet."ds_email" IN (561,562,563,564)
    -- NOTIFICAÇÃO: 145	Dep. Televendas - Envio de promoção positivação clientes
    