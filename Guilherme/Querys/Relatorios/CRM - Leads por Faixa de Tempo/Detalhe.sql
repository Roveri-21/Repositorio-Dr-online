SELECT 
	x.idx,
	x.texto,
	SUM(x.qts_lead),
	SUM(x.qtd_andamento),
	SUM(x.qtd_perdido),
	SUM(x.qtd_ganho)
FROM( 
	SELECT
		(CASE
	    WHEN TIMESTAMPDIFF(MINUTE, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) <= 30 THEN 1
	    WHEN TIMESTAMPDIFF(MINUTE, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) > 30 AND TIMESTAMPDIFF(MINUTE, cl.dt_insert, clh.dt_historico) < 120 THEN 2
	    WHEN TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico,CURRENT_TIMESTAMP())) >= 2 AND TIMESTAMPDIFF(HOUR, cl.dt_insert, clh.dt_historico) < 8 THEN 3
	    WHEN TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) >= 8 AND TIMESTAMPDIFF(HOUR, cl.dt_insert, clh.dt_historico) < 24 THEN 4
	    WHEN TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) >= 24 AND TIMESTAMPDIFF(HOUR, cl.dt_insert, clh.dt_historico) < 48 THEN 5
	    WHEN TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) >= 48 AND TIMESTAMPDIFF(HOUR, cl.dt_insert, clh.dt_historico) < 72 THEN 6
	    WHEN TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) >= 72 THEN 7 end) as idx,
		CASE
	    WHEN TIMESTAMPDIFF(MINUTE, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) <= 30 THEN 'até 30 minutos'
	    WHEN TIMESTAMPDIFF(MINUTE, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) > 30 AND TIMESTAMPDIFF(MINUTE, cl.dt_insert, clh.dt_historico) < 120 THEN 'entre_31 minutos e 2h'
	    WHEN TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico,CURRENT_TIMESTAMP())) >= 2 AND TIMESTAMPDIFF(HOUR, cl.dt_insert, clh.dt_historico) < 8 THEN 'entre_2 e_8h'
	    WHEN TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) >= 8 AND TIMESTAMPDIFF(HOUR, cl.dt_insert, clh.dt_historico) < 24 THEN 'entre_8_24h'
	    WHEN TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) >= 24 AND TIMESTAMPDIFF(HOUR, cl.dt_insert, clh.dt_historico) < 48 THEN 'entre_24_48h'
	    WHEN TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) >= 48 AND TIMESTAMPDIFF(HOUR, cl.dt_insert, clh.dt_historico) < 72 THEN 'entre_48_72_h'
	    WHEN TIMESTAMPDIFF(HOUR, cl.dt_insert, COALESCE (clh.dt_historico, CURRENT_TIMESTAMP())) >= 72 THEN 'mais_de_72_h'
	END AS texto,
	1 as qts_lead,
	IF(COALESCE (cfe.ie_tipo_etapa, '0') not IN ('G', 'P'), 1, 0)as qtd_andamento,
	if(cfe.ie_tipo_etapa = 'P',1,0)as qtd_perdido,
	if(cfe.ie_tipo_etapa = 'G',1,0)as qtd_ganho
	from crm_lead cl
	left join crm_lead_historico clh on
		clh.idcrm_lead = cl.idcrm_lead and cl.idcrm_funil_etapa = clh.idcrm_funil_etapa 
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
		GROUP BY cl.idcrm_lead)x
GROUP BY x.idx,x.texto
ORDER by x.idx;