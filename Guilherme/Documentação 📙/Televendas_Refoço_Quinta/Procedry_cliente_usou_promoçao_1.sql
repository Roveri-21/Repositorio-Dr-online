-- Procedry Marca o cliente e numero do pedido que usaram a promição
BEGIN
    -- TELEVENDAS
    BEGIN
        FOR CAMP IN (
            SELECT 	ID 
            FROM 	TEL_CAMPANHA tc 
            WHERE 	tc.ORIGEMPED = 'T'
        )
        LOOP
            FOR VENDA IN (
                SELECT DISTINCT X.* FROM (
                        SELECT DISTINCT
                            C.ID,
                            M.NUMPED,
                            M.DATAOPERCAO,
                            M.CODCLI,
                            (SELECT N.VLTOTAL FROM PCNFSAID N WHERE N.NUMPED = M.NUMPED) AS VL_NOTA
                        FROM 			PALMED.MV_PBI_TESTE_FAT_2ANOS 	M
                        INNER JOIN 		TEL_CAMPANHA 					C 	ON (1=1)
                        INNER JOIN 		TEL_CAMPANHA_PRODUTO_DESCONTO 	P 	ON (
                            P.ID_CAMPANHA = C.ID 
                            AND P.CODPROD = M.CODPROD 
                        )
                        INNER JOIN TEL_CLIENTE 							CLI ON (
                            CLI.ID_CAMPANHA = C.ID 
                            AND CLI.CODCLI  = M.CODCLI 
                            AND CLI.CODGRUPOCOMERCIALMED = P.CODGRUPOCOMERCIALMED 
                        )
                        WHERE 1=1 
                            AND C.ID IN (CAMP.ID)
                            AND M.DATAOPERCAO BETWEEN C.DT_INICIO  AND C.DT_FIM  
                            AND decode(
                                M.TIPODESAIDA,
                                'TELEVENDAS',
                                CASE 
                                    WHEN (
                                        M.CODEMITENTE NOT IN (1,8888)
                                        AND (SELECT CODSETOR FROM PCEMPR WHERE MATRICULA = M.CODEMITENTE ) = 10
                                    ) 	THEN 'TELEVENDAS'
                                        ELSE 'OUTROS'
                                END,
                                TIPODESAIDA 
                            )= 'TELEVENDAS'	
                            AND M.NUMPED NOT IN (
                                SELECT TV.NUMPED 
                                FROM TEL_VENDA TV
                            )
                            AND (CAMP.ID, M.NUMPED) NOT IN (
                                SELECT ID_CAMPANHA, NUMPED 
                                FROM TEL_VENDA 
                            )
                    )X
            ) LOOP
                DECLARE EXISTE NUMBER;
                BEGIN
                    SELECT 	COUNT(1)
                    INTO 	EXISTE 
                    FROM 	TEL_VENDA TV 
                    WHERE 	1=1 
                        AND TV.ID_CAMPANHA 	= VENDA.ID
                        AND TV.NUMPED 		= VENDA.NUMPED;
                    
                    IF EXISTE = 0 
                        THEN 
                            INSERT INTO TEL_VENDA (
                                ID_CAMPANHA, NUMPED, 
                                DT_VENDA, CODCLI, VL_NOTA
                            )VALUES(
                                VENDA.ID, VENDA.NUMPED,
                                VENDA.DATAOPERCAO, VENDA.CODCLI, VENDA.VL_NOTA
                            );
                    END IF;
                END ;
            END LOOP;
        END LOOP;
    END; 
    -- PEDIDO ELETRÔNICO
    BEGIN
        FOR CAMP IN (
            SELECT 	ID 
            FROM 	TEL_CAMPANHA tc 
            WHERE 	tc.ORIGEMPED = 'P'
        )
        LOOP
            FOR VENDA IN (
                SELECT DISTINCT X.* FROM (
                        SELECT DISTINCT
                            C.ID,
                            M.NUMPED,
                            M.DATAOPERCAO,
                            M.CODCLI,
                            (SELECT N.VLTOTAL FROM PCNFSAID N WHERE N.NUMPED = M.NUMPED) AS VL_NOTA
                        FROM 			PALMED.MV_PBI_TESTE_FAT_2ANOS 	M
                        INNER JOIN 		TEL_CAMPANHA 					C 	ON (1=1)
                        INNER JOIN 		TEL_CAMPANHA_PRODUTO_DESCONTO 	P 	ON (
                            P.ID_CAMPANHA = C.ID 
                            AND P.CODPROD = M.CODPROD 
                        )
                        INNER JOIN TEL_CLIENTE 							CLI ON (
                            CLI.ID_CAMPANHA = C.ID 
                            AND CLI.CODCLI  = M.CODCLI 
                            AND CLI.CODGRUPOCOMERCIALMED = P.CODGRUPOCOMERCIALMED 
                        )
                        WHERE 1=1 
                            AND C.ID IN (CAMP.ID)
                            AND M.DATAOPERCAO BETWEEN C.DT_INICIO  AND C.DT_FIM  
                            AND M.TIPODESAIDA = 'PEDIDO ELETRÔNICO'
                            AND M.NUMPED NOT IN (
                                SELECT TV.NUMPED 
                                FROM TEL_VENDA TV
                            )
                            AND (CAMP.ID, M.NUMPED) NOT IN (
                                SELECT ID_CAMPANHA, NUMPED 
                                FROM TEL_VENDA 
                            )
                    )X
            ) LOOP
                DECLARE EXISTE NUMBER;
                BEGIN
                    SELECT 	COUNT(1)
                    INTO 	EXISTE 
                    FROM 	TEL_VENDA TV 
                    WHERE 	1=1 
                        AND TV.ID_CAMPANHA 	= VENDA.ID
                        AND TV.NUMPED 		= VENDA.NUMPED;
                    
                    IF EXISTE = 0 
                        THEN 
                            INSERT INTO TEL_VENDA (
                                ID_CAMPANHA, NUMPED, 
                                DT_VENDA, CODCLI, VL_NOTA
                            )VALUES(
                                VENDA.ID, VENDA.NUMPED,
                                VENDA.DATAOPERCAO, VENDA.CODCLI, VENDA.VL_NOTA
                            );
                    END IF;
                END ;
            END LOOP;
        END LOOP;
    END; 
END;