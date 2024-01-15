select   
  sum(COALESCE(cl.ds_quantidade, 0)) ds_quantidade,
  sum(COALESCE(cl.ds_valor, 0)) ds_valor
from crm_lead cl    
  inner join crm_funil cf ON cf.idcrm_funil = cl.idcrm_funil 
  inner join crm_projeto cp on cf.idcrm_projeto = cp.idcrm_projeto
where  
  cl.login = (select u.login from usuario u where u.idusuario = :idusuario)
  and cl.idcrm_funil in (select cfp.idcrm_funil from crm_funil_participante cfp where cfp.idcrm_equipe = :idcrm_equipe)
  and cp.idestabelecimento = {{:idestabelecimento}}
  and cl.status = 'A'
  and cl.dt_ganho is not null
  and DATE_FORMAT(cl.dt_ganho, '%m/%Y') = DATE_FORMAT(:dt_ref, '%m/%Y')   
order by cl.dt_ganho desc;