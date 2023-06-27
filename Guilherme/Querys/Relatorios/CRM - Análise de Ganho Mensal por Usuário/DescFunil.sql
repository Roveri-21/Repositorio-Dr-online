select
 DISTINCT
  cf.idcrm_funil,
  cf.ds_funil
from crm_lead cl
inner join crm_funil cf on cf.idcrm_funil = cl.idcrm_funil
inner join crm_projeto cp on cp.idcrm_projeto = cf.idcrm_projeto
where
  cp.idestabelecimento = {{:idestabelecimento}}
  and cf.idcrm_funil = :idcrm_funil;