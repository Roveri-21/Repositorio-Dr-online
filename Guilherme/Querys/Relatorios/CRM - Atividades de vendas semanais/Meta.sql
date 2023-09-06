SELECT 
	MAX(x.Segunda)*2 as Segunda ,
	MAX(x.Terca)*2 as Terca,
	MAX(x.Quarta)*2 as Quarta,
	MAX(x.Quinta)*2 as Quinta,
	MAX(x.Sexta)*2 as Sexta,
	MAX(x.Sabado)*2 as Sabado,
	MAX(x.Domingo)*2 as Domingo
FROM
(SELECT 
    SUM(CASE WHEN DAYOFWEEK(cl.dt_ganho) = 2 THEN cl.ds_valor ELSE 0 END) AS Segunda,
    SUM(CASE WHEN DAYOFWEEK(cl.dt_ganho) = 3 THEN cl.ds_valor ELSE 0 END) AS Terca,
    SUM(CASE WHEN DAYOFWEEK(cl.dt_ganho) = 4 THEN cl.ds_valor ELSE 0 END) AS Quarta,
    SUM(CASE WHEN DAYOFWEEK(cl.dt_ganho) = 5 THEN cl.ds_valor ELSE 0 END) AS Quinta,
    SUM(CASE WHEN DAYOFWEEK(cl.dt_ganho) = 6 THEN cl.ds_valor ELSE 0 END) AS Sexta,
    SUM(CASE WHEN DAYOFWEEK(cl.dt_ganho) = 7 THEN cl.ds_valor ELSE 0 END) AS Sabado,
    SUM(CASE WHEN DAYOFWEEK(cl.dt_ganho) = 1 THEN cl.ds_valor ELSE 0 END) AS Domingo
FROM
    crm_lead cl
INNER JOIN crm_funil cf ON
    cf.idcrm_funil = cl.idcrm_funil
INNER JOIN crm_projeto cp ON
    cp.idcrm_projeto = cf.idcrm_projeto
INNER JOIN crm_funil_etapa cfe ON
    cfe.idcrm_funil_etapa = cl.idcrm_funil_etapa     
INNER JOIN usuario u ON 
    u.login = cl.login 
INNER JOIN pessoa_fisica pf ON
    pf.idpessoa_fisica = u.idpessoa_fisica 
INNER JOIN crm_origem_lead col ON 
    col.idcrm_origem_lead = cl.idcrm_origem_lead
WHERE
    cp.idestabelecimento = {{:idestabelecimento}}
    AND cf.idcrm_funil = :idcrm_funil
    AND cl.status = 'A'
    AND DATE(cl.dt_ganho) BETWEEN :dt_inicial AND :dt_final
    GROUP by cl.idcrm_origem_lead)x;