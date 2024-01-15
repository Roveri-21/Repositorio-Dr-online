SELECT 
	x.idx,
	x.texto as faixa_primeiro_contato,
	SUM(x.qts_lead) as QTD_LEADS,
	SUM(x.qtd_andamento)AS EM_ANDAMENTO,
	SUM(x.qtd_perdido)AS PERDIDAS,
	SUM(x.qtd_ganho)AS VENDIDAS
FROM( 
	SELECT
		(CASE
	    WHEN TIMESTAMPDIFF(MINUTE, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) <= 30 THEN 1
	    WHEN TIMESTAMPDIFF(MINUTE, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) > 30 AND TIMESTAMPDIFF(MINUTE, cl.dt_insert, COALESCE (clh.dt_historico,CURRENT_TIMESTAMP())) < 120 THEN 2
	    WHEN TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico,CURRENT_TIMESTAMP())) >= 2 AND TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico,CURRENT_TIMESTAMP())) < 8 THEN 3
	    WHEN TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) >= 8 AND TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico,CURRENT_TIMESTAMP())) < 24 THEN 4
	    WHEN TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) >= 24 AND TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico,CURRENT_TIMESTAMP())) < 48 THEN 5
	    WHEN TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) >= 48 AND TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico,CURRENT_TIMESTAMP())) < 72 THEN 6
	    WHEN TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) >= 72 THEN 7 end) as idx,
		CASE
	    WHEN TIMESTAMPDIFF(MINUTE, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) <= 30 THEN 'Até 30 minutos'
	    WHEN TIMESTAMPDIFF(MINUTE, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) > 30 AND TIMESTAMPDIFF(MINUTE, cl.dt_insert, COALESCE (clh.dt_historico,CURRENT_TIMESTAMP())) < 120 THEN 'De 31 minutos a 2 horas'
	    WHEN TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico,CURRENT_TIMESTAMP())) >= 2 AND TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico,CURRENT_TIMESTAMP())) < 8 THEN 'De 2 a 8 horas'
	    WHEN TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) >= 8 AND TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico,CURRENT_TIMESTAMP())) < 24 THEN 'De 8 a 24 horas'
	    WHEN TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) >= 24 AND TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico,CURRENT_TIMESTAMP())) < 48 THEN 'De 24 a 48 horas'
	    WHEN TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) >= 48 AND TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico,CURRENT_TIMESTAMP())) < 72 THEN 'De 48 a 72 horas'
	    WHEN TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) >= 72 THEN 'Tempo superior a 72 horas'
	END AS texto,
	1 as qts_lead,
	IF(COALESCE (cfe.ie_tipo_etapa, '0') not IN ('G', 'P'), 1, 0)as qtd_andamento,
	if(cfe.ie_tipo_etapa = 'P',1,0)as qtd_perdido,
	if(cfe.ie_tipo_etapa = 'G',1,0)as qtd_ganho
	from crm_lead cl
	left join crm_lead_historico clh on
		clh.idcrm_lead = cl.idcrm_lead and (cl.idcrm_funil_etapa = clh.idcrm_funil_etapa) 
	left join crm_lead_historico clh2 on
		clh2.idcrm_lead = cl.idcrm_lead and clh2.idcrm_funil_etapa is null
	inner join crm_funil cf on
		cf.idcrm_funil = cl.idcrm_funil
	inner join crm_projeto cp on
		cp.idcrm_projeto = cf.idcrm_projeto
	inner join crm_funil_etapa cfe on
		cfe.idcrm_funil_etapa = cl.idcrm_funil_etapa 
	where 
		cp.idestabelecimento = :idestabelecimento
		and cf.idcrm_funil = :idcrm_funil
		and cl.status = 'A'
		AND DATE(cl.dt_insert) BETWEEN :dt_inicial AND :dt_final		
		GROUP BY cl.idcrm_lead)x
GROUP BY x.idx,x.texto
ORDER by x.idx;
