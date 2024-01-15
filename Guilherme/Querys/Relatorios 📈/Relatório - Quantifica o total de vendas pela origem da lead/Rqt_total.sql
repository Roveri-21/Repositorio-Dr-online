-- total

SELECT
	sum(c.Qtd_quantidade)as Qtd_total_ds_quantidade,
	c.total_ganho as total_ganho_c,
	c.total_perda as total_perda_c,
	c.Subtotal as Subtotal_c
from (select
	b.ds_origem,	
	sum(b.ds_quantidade) as Qtd_quantidade,
	SUM(b.ganho) as total_ganho,
	sum(b.perda) as total_perda,
	sum(b.Total) as Subtotal
from (SELECT
	if (cfe.ie_tipo_etapa = 'G',COALESCE (cl.ds_quantidade,1),0) as ds_quantidade,
-- 	cl.ds_quantidade as teste,
	cfe.ie_tipo_etapa,
	cl.idcrm_lead,
	col.ds_origem,
	cfe.ds_etapa,
	if (cfe.ie_tipo_etapa = 'G',1,0) ganho,
	0 perda,
	if (cfe.ie_tipo_etapa in ('G'),1,0) Total
from
	crm_lead cl
inner join crm_funil_etapa cfe on
	cfe.idcrm_funil_etapa = cl.idcrm_funil_etapa
inner join crm_origem_lead col on
	col.idcrm_origem_lead = cl.idcrm_origem_lead
INNER JOIN crm_funil cf on 
cf.idcrm_funil = cl.idcrm_funil 
INNER JOIN crm_projeto cp on 
cp.idcrm_projeto = cf.idcrm_projeto 
where
 	date(cl.dt_ganho) BETWEEN :dt_inicial AND :dt_final
 	AND cp.idestabelecimento = {{:idestabelecimento}}
 	AND cl.idcrm_funil = :idcrm_funil 
 	
 	UNION
 	
 	SELECT
 	cl.ds_quantidade,
	cfe.ie_tipo_etapa,
	cl.idcrm_lead,
	col.ds_origem,
	cfe.ds_etapa,
	0 ganho,
	if (cfe.ie_tipo_etapa = 'P',1,0) perda,
	if (cfe.ie_tipo_etapa in ('P'),1,0) Total
from
	crm_lead cl
inner join crm_funil_etapa cfe on
	cfe.idcrm_funil_etapa = cl.idcrm_funil_etapa
inner join crm_origem_lead col on
	col.idcrm_origem_lead = cl.idcrm_origem_lead
INNER JOIN crm_funil cf on 
cf.idcrm_funil = cl.idcrm_funil 
INNER JOIN crm_projeto cp on 
cp.idcrm_projeto = cf.idcrm_projeto 
where
 	date(cl.dt_evento) BETWEEN :dt_inicial AND :dt_final
 	AND cp.idestabelecimento = {{:idestabelecimento}}
 	AND cl.idcrm_funil = :idcrm_funil ) b ) c
 	GROUP By c.ds_origem;
