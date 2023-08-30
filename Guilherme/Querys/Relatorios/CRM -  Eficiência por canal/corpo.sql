SELECT 
    col.ds_origem,
    COUNT(cl.idcrm_lead) as QTD_leads,
    round((COUNT(cl.idcrm_lead) / (select count(cl2.idcrm_lead) from crm_lead cl2 WHERE  cl2.idcrm_funil = :idcrm_funil AND DATE(cl2.dt_insert) BETWEEN :dt_inicial AND :dt_final AND cl2.status = 'A') * 100), 2) prec_lead_origem,
    SUM(CASE WHEN cl.ie_etiqueta = '3' AND cfe.ie_tipo_etapa != 'P' THEN 1 ELSE 0 END) as QTD_marcadores,
	ROUND((SUM(CASE WHEN cl.ie_etiqueta = '3' AND cfe.ie_tipo_etapa != 'P' THEN 1 ELSE 0 END) / COUNT(cl.idcrm_lead) * 100), 2) AS prec_marcadores,
	SUM(CASE WHEN cfe.ie_tipo_etapa = 'G' THEN 1 ELSE 0 END) as QTD_ganho,
	ROUND((SUM(CASE WHEN cfe.ie_tipo_etapa = 'G' THEN 1 ELSE 0 END)/ COUNT(cl.idcrm_lead) * 100), 2)as perc_ganho,
	sum(CASE WHEN cfe.ie_tipo_etapa = 'G' THEN cl.ds_valor ELSE 0 END) as  receita,
	COALESCE(AVG(CASE WHEN cfe.ie_tipo_etapa = 'G' THEN cl.ds_valor ELSE NULL END),0) as  receita
FROM crm_origem_lead col
INNER JOIN crm_lead cl ON cl.idcrm_origem_lead = col.idcrm_origem_lead
INNER JOIN crm_funil cf ON cf.idcrm_funil = cl.idcrm_funil
INNER JOIN crm_funil_etapa cfe ON cfe.idcrm_funil_etapa = cl.idcrm_funil_etapa
WHERE col.idestabelecimento = :idestabelecimento
    AND cf.idcrm_funil = :idcrm_funil
    AND DATE(cl.dt_insert) BETWEEN :dt_inicial AND :dt_final
    AND cl.status = 'A'
GROUP BY col.ds_origem
order by 3 desc;