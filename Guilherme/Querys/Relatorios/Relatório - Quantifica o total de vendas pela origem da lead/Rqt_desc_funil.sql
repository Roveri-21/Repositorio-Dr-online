-- Descrição funil
select 
  cf.ds_funil,
  cfp.idcrm_funil,
  ue.idestabelecimento
from crm_funil_participante cfp  
  inner join crm_equipe_membro cem on cem.idcrm_equipe = cfp.idcrm_equipe 
  inner join crm_funil cf on cf.idcrm_funil = cfp.idcrm_funil   
  inner join usuario u on u.idusuario = cem.idusuario
  inner join usuario_estab ue on u.idusuario = ue.idusuario
  inner join crm_projeto cp on cf.idcrm_projeto = cp.idcrm_projeto and ue.idestabelecimento = cp.idestabelecimento
where
  ue.idestabelecimento = {{:idestabelecimento}}
  and cfp.idcrm_funil = :idcrm_funil
  GROUP BY
  cfp.idcrm_funil;