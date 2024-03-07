WITH produtos AS (
	SELECT 
		ID_CAMPANHA ,
		tcpd.CODPROD ,
		CODGRUPOCOMERCIALMED ,
		'*•* ' || prod.CODPROD || ' - ' || prod.DESCRICAO AS descricao ,   
		'De ' || tcpd.QT_MIN  || ' a ' || tcpd.QT_MAX || ' unidades por *R$' AS preco,
		tcpd.PERCDESC ,
		ROW_NUMBER() OVER (PARTITION BY tcpd.ID_CAMPANHA, tcpd.CODGRUPOCOMERCIALMED ORDER BY tcpd.CODPROD) AS rn
	FROM 			TEL_CAMPANHA_PRODUTO_DESCONTO 		tcpd 
	INNER JOIN 		pcprodut 							prod ON tcpd.codprod = prod.codprod 
)

(
SELECT
	0 																								                                    AS "ds_email"		,
	'Johnathan'																							             AS "nm_contato"		,
	0 																									AS "ds_subtitulo",
	6281110455 																					                                    AS "nr_contato"		,
	DECODE( T.UF, 'MA', 'Maranhão', 'PB', 'Paraíba', 'PA', 'Pará', 'PI', 'Piauí', 'TO', 'Tocantins', 'RO', 'Rondônia' )						AS "var_1"			,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 1 
	)                                                                                                                                       AS "var_2"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 1 
	)                                                                                                                                       AS "var_3"          ,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 2 
	)                                                                                                                                       AS "var_4"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 2
	)                                                                                                                                       AS "var_5"          ,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 3 
	)                                                                                                                                       AS "var_6"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 3
	)                                                                                                                                       AS "var_7"          ,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 4
	)                                                                                                                                       AS "var_8"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 4
	)                                                                                                                                       AS "var_9"          ,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 5
	)                                                                                                                                       AS "var_10"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 5 
	)                                                                                                                                       AS "var_11"          ,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 6 
	)                                                                                                                                       AS "var_12"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 6
	)                                                                                                                                       AS "var_13"          ,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 7
	)                                                                                                                                       AS "var_14"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 7 
	)                                                                                                                                       AS "var_15"          ,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 8 
	)                                                                                                                                       AS "var_16"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 8 
	)                                                                                                                                       AS "var_17"          ,
    to_char(T.DT_FIM , 'dd/MM/yyyy')                                                                                                                               AS "var_18"
FROM 		TEL_CLIENTE 					TC
INNER JOIN 	pcclient 						cli 	ON (tc.codcli = cli.codcli)
INNER JOIN 	TEL_CAMPANHA 					T 		ON (TC.ID_CAMPANHA = T.ID)
INNER JOIN 	TEL_CLIENTE_TELEFONES_CAMPANHA 	TCTC  	ON (TC.CODCLI = TCTC.CODCLI AND TC.ID_CAMPANHA = TCTC.ID_CAMPANHA)
WHERE 		1=1 
	AND cli.numregiaocli IS NOT NULL 
	AND trunc(sysdate) between t.dt_inicio and t.dt_fim
    and t.origemped = 'P'
	FETCH FIRST 1row ONLY
) UNION 
(
SELECT
	0 																								                                    AS "ds_email"		,
	'Joelton'																							             AS "nm_contato"		,
	0 																									AS "ds_subtitulo",
	6392853318 																					                                    AS "nr_contato"		,
	DECODE( T.UF, 'MA', 'Maranhão', 'PB', 'Paraíba', 'PA', 'Pará', 'PI', 'Piauí', 'TO', 'Tocantins', 'RO', 'Rondônia' )						AS "var_1"			,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 1 
	)                                                                                                                                       AS "var_2"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 1 
	)                                                                                                                                       AS "var_3"          ,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 2 
	)                                                                                                                                       AS "var_4"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 2
	)                                                                                                                                       AS "var_5"          ,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 3 
	)                                                                                                                                       AS "var_6"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 3
	)                                                                                                                                       AS "var_7"          ,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 4
	)                                                                                                                                       AS "var_8"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 4
	)                                                                                                                                       AS "var_9"          ,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 5
	)                                                                                                                                       AS "var_10"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 5 
	)                                                                                                                                       AS "var_11"          ,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 6 
	)                                                                                                                                       AS "var_12"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 6
	)                                                                                                                                       AS "var_13"          ,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 7
	)                                                                                                                                       AS "var_14"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 7 
	)                                                                                                                                       AS "var_15"          ,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 8 
	)                                                                                                                                       AS "var_16"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 8 
	)                                                                                                                                       AS "var_17"          ,
    to_char(T.DT_FIM , 'dd/MM/yyyy')                                                                                                                               AS "var_18"
FROM 		TEL_CLIENTE 					TC
INNER JOIN 	pcclient 						cli 	ON (tc.codcli = cli.codcli)
INNER JOIN 	TEL_CAMPANHA 					T 		ON (TC.ID_CAMPANHA = T.ID)
INNER JOIN 	TEL_CLIENTE_TELEFONES_CAMPANHA 	TCTC  	ON (TC.CODCLI = TCTC.CODCLI AND TC.ID_CAMPANHA = TCTC.ID_CAMPANHA)
WHERE 		1=1 
	AND cli.numregiaocli IS NOT NULL 
	AND trunc(sysdate) between t.dt_inicio and t.dt_fim
        and t.origemped = 'P'
	FETCH FIRST 1row ONLY
)
(SELECT
	0 																								                                    AS "ds_email"		,
	'Guilherme'																							             AS "nm_contato"		,
	0 																									AS "ds_subtitulo",
	6281609324 																					                                    AS "nr_contato"		,
	DECODE( T.UF, 'MA', 'Maranhão', 'PB', 'Paraíba', 'PA', 'Pará', 'PI', 'Piauí', 'TO', 'Tocantins', 'RO', 'Rondônia' )						AS "var_1"			,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 1 
	)                                                                                                                                       AS "var_2"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 1 
	)                                                                                                                                       AS "var_3"          ,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 2 
	)                                                                                                                                       AS "var_4"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 2
	)                                                                                                                                       AS "var_5"          ,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 3 
	)                                                                                                                                       AS "var_6"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 3
	)                                                                                                                                       AS "var_7"          ,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 4
	)                                                                                                                                       AS "var_8"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 4
	)                                                                                                                                       AS "var_9"          ,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 5
	)                                                                                                                                       AS "var_10"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 5 
	)                                                                                                                                       AS "var_11"          ,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 6 
	)                                                                                                                                       AS "var_12"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 6
	)                                                                                                                                       AS "var_13"          ,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 7
	)                                                                                                                                       AS "var_14"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 7 
	)                                                                                                                                       AS "var_15"          ,
	(
		SELECT 		descricao
		FROM 		produtos 
		WHERE 		1=1 
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 8 
	)                                                                                                                                       AS "var_16"          ,
	(
		SELECT 		produtos.preco || 
					TO_CHAR(( pctabpr.ptabela * (1 - (produtos.PERCDESC / 100 ))), 'FM9999999990.00') || 
					'*'
		FROM 		produtos 
		INNER JOIN 	pctabpr ON (pctabpr.CODPROD = produtos.codprod)
		WHERE 		1=1 
			AND pctabpr.NUMREGIAO = cli.NUMREGIAOCLI
			AND produtos.id_campanha = t.id 
			AND produtos.codgrupocomercialmed = tc.CODGRUPOCOMERCIALMED 
			AND produtos.rn = 8 
	)                                                                                                                                       AS "var_17"          ,
    to_char(T.DT_FIM , 'dd/MM/yyyy')                                                                                                                               AS "var_18"
FROM 		TEL_CLIENTE 					TC
INNER JOIN 	pcclient 						cli 	ON (tc.codcli = cli.codcli)
INNER JOIN 	TEL_CAMPANHA 					T 		ON (TC.ID_CAMPANHA = T.ID)
INNER JOIN 	TEL_CLIENTE_TELEFONES_CAMPANHA 	TCTC  	ON (TC.CODCLI = TCTC.CODCLI AND TC.ID_CAMPANHA = TCTC.ID_CAMPANHA)
WHERE 		1=1 
	AND cli.numregiaocli IS NOT NULL 
	AND trunc(sysdate) between t.dt_inicio and t.dt_fim
        and t.origemped = 'P'
		FETCH FIRST 1row ONLY
)
