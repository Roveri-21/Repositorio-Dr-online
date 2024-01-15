SELECT 
	cpg.idcrm_produto_grupo,
	cpg.ds_grupo
from 
	crm_lead cl 	 
inner join crm_funil cf on
	cf.idcrm_funil = cl.idcrm_funil
left join json_table(coalesce(cl.cd_produto_ganho,'[]'), '$[*]' columns (id int path '$')) j on j.id = j.id
left join crm_produto cp on cp.idcrm_produto = j.id
left join crm_produto_grupo cpg on cp.idcrm_produto_grupo = cpg.idcrm_produto_grupo
inner join crm_funil_etapa cfe on cfe.idcrm_funil_etapa = cl.idcrm_funil_etapa
where
  cl.idcrm_funil =:idcrm_funil
  and date(cl.dt_insert) BETWEEN :dt_inicial AND :dt_final
  and j.id is not null
  and cfe.ie_tipo_etapa = 'G'
  and cl.status = 'A'
 GROUP BY cpg.idcrm_produto_grupo;