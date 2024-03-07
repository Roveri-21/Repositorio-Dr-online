-- VERIFICAR CAMPANHAS GERADAS
    --Verifica as CAMPANHA GERADAS
    SELECT 	
        * 
    FROM
     	TEL_CAMPANHA tc 
    WHERE
     	ID IN (546,547,548,549,550,551,552,553,554)
    ORDER BY ID DESC;

    -- Verifica os CLIENTES da base
    SELECT
     	*
    FROM
     	TEL_CLIENTE tc 
    WHERE
     ID_CAMPANHA IN (546,547,548,549,550,551,552,553,554)
    
    -- Verifica os PRODUTOS gerados
    SELECT 	
        *
    FROM
     	TEL_CAMPANHA_PRODUTO_DESCONTO tcpd 
    WHERE
     	ID_CAMPANHA IN (546,547,548,549,550,551,552,553,554)

    -- TELEFONES QUE SERÃO ENVIADOS
    SELECT  
        * 
    FROM
        TEL_CLIENTE_TELEFONES_CAMPANHA
    WHERE
       ID_CAMPANHA IN (546,547,548,549,550,551,552,553,554)
    
-- 
-- ENVIO 
    -- SQL TELEVENDAS
    SELECT 
        *	
    FROM
        TEL_ENVIO_TELEVENDAS tet 
    WHERE
        tet."ds_email" IN (546,547,548,549,550,551,552,553,554)
    -- NOTIFICAÇÃO: 145	Dep. Televendas - Envio de promoção positivação clientes
    -- NOTIFICAÇÃO: 164	Dep. Televendas - Envio de promoção positivação clientes
    
-- Validação de campanhas e novas campanhas
    SELECT
        ID_CAMPANHA,
        CODGRUPOCOMERCIALMED, 
        COD_ULT_GRUPO,
        COUNT(DISTINCT CODCLI) qtd_cli 
    FROM
        TEL_CLIENTE
    GROUP BY ID_CAMPANHA, CODGRUPOCOMERCIALMED, COD_ULT_GRUPO
    ORDER BY ID_CAMPANHA DESC, 4 desc;

-- traz os id mais recente das campanhas
    SELECT 
        * 
    FROM
        TEL_CAMPANHA
    ORDER BY ID DESC;

-- Traz as campanhas dos produtos com descontos
    SELECT
        * 
    FROM
        TEL_CAMPANHA_PRODUTO_DESCONTO
    ORDER BY ID_CAMPANHA desc;