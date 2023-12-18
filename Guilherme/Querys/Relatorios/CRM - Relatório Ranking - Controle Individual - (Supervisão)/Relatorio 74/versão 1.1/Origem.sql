SELECT
  col.ds_origem,
  count(cl.idcrm_lead) as Qtd_leads,
  sum(COALESCE(cl.ds_quantidade, 0)) ds_quantidade,
  SUM(COALESCE(cl.ds_valor, 0)) ds_valor
from
	crm_lead cl
inner join usuario u on u.login =cl.login and u.idusuario =:idusuario
inner join crm_funil_etapa cfe on cfe.idcrm_funil_etapa = cl.idcrm_funil_etapa and cfe.ie_tipo_etapa = 'G'
inner join crm_origem_lead col on col.idcrm_origem_lead = cl.idcrm_origem_lead
where
	DATE_FORMAT(cl.dt_ganho, '%m/%Y') = DATE_FORMAT(:dt_ref, '%m/%Y')
	and cl.status = 'A'
	and cl.dt_ganho is not null
	and cl.idcrm_funil = :idcrm_funil
	group by col.ds_origem                    
	order by cl.dt_ganho desc;