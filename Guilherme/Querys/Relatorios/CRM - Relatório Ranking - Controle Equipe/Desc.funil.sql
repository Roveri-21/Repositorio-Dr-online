select 
  cf.idcrm_funil,  
  cp.idestabelecimento,
  cf.ds_funil
from crm_funil cf   
  inner join crm_projeto cp on cf.idcrm_projeto = cp.idcrm_projeto
where  
  cf.idcrm_funil = :idcrm_funil
  and cp.idestabelecimento = {{:idestabelecimento}};