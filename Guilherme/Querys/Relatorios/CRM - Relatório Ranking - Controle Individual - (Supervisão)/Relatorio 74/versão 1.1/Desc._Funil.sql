select 
  cfp.idcrm_funil,
  u.login,
  ue.idestabelecimento,
  cf.ds_funil
from crm_funil_participante cfp  
  inner join crm_equipe_membro cem on cem.idcrm_equipe = cfp.idcrm_equipe 
  inner join crm_funil cf on cf.idcrm_funil = cfp.idcrm_funil   
  inner join usuario u on u.idusuario = cem.idusuario
  inner join usuario_estab ue on u.idusuario = ue.idusuario
  inner join crm_projeto cp on cf.idcrm_projeto = cp.idcrm_projeto and ue.idestabelecimento = cp.idestabelecimento
where
  u.idusuario = :idusuario  
and cem.idcrm_equipe = :idcrm_equipe
  and ue.idestabelecimento = {{:idestabelecimento}}
  and EXISTS (select 
  cff.idcrm_funil 
from crm_lead clf    
  inner join crm_funil cff ON cff.idcrm_funil = clf.idcrm_funil 
  inner join crm_projeto cpf on cff.idcrm_projeto = cpf.idcrm_projeto
where  
  clf.login = u.login 
  and cpf.idestabelecimento = ue.idestabelecimento 
  and clf.idcrm_funil = cfp.idcrm_funil 
  and clf.status = 'A'
  and clf.dt_ganho is not null
  and DATE_FORMAT(clf.dt_ganho, '%m/%Y') = DATE_FORMAT(:dt_ref, '%m/%Y'))
order by idcrm_funil;