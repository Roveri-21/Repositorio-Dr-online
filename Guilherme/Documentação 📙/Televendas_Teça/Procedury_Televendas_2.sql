-- RODAR PROCEDURE PRA GERAR AS CAMPANHAS
    BEGIN
        PALMEDPROD.TEL_CRIAR_CAMPANHA(
            'PI',
            'S9TPI',-- deve ser pego do select de promoções cadastradas
            'T'
        );
        PALMEDPROD.TEL_CRIAR_CAMPANHA(
            'PA',
            'S9TPA',-- deve ser pego do select de promoções cadastradas
            'T'
        );
        PALMEDPROD.TEL_CRIAR_CAMPANHA(
            'MA',
            'S9TMA',-- deve ser pego do select de promoções cadastradas
            'T'
        );
        PALMEDPROD.TEL_CRIAR_CAMPANHA(
            'PB',
            'S9TPB', -- deve ser pego do select de promoções cadastradas
            'T'
        );
        
        --	p_UF			IN VARCHAR2,
        --	p_ID_PROMOCAO 	IN VARCHAR2,
        --	p_ORIGEMPED		IN CHAR			-- T -> TELEVENDAS , P -> PEDIDO ELETRÔNICO
    END;
    -- EDITAR IDENTIFICADOR DA CAMPANHA DE ACORDO COM O DA SEMANA ATUAL
--  pegue os valores gerados por elas e coloque nas verficações de campanha
-- apos essa procefury ser gerada pode executar o scripty 71 e esperar o processo de criação das leads