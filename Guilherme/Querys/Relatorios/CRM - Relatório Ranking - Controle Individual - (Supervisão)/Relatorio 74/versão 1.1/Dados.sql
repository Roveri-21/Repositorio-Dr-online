select 
  cl.idcrm_lead,
  cl.idcrm_pessoa,
  cl.idcrm_empresa,
  f_replace_emoji(COALESCE(COALESCE(cp2.nm_pessoa,COALESCE(ce.nome_fantasia,ce.ds_razao_social)),cl.ds_titulo)) as ds_titulo,
  DATE_FORMAT(cl.dt_ganho, '%d/%m/%Y') dt_ganho,
  COALESCE(cl.ds_quantidade, 0) ds_quantidade,
  COALESCE(cl.ds_valor, 0) ds_valor
from crm_lead cl    
  inner join crm_funil cf ON cf.idcrm_funil = cl.idcrm_funil 
  inner join crm_projeto cp on cf.idcrm_projeto = cp.idcrm_projeto
  left join crm_pessoa cp2 on cp2.idcrm_pessoa = cl.idcrm_pessoa
  left join crm_empresa ce on ce.idcrm_empresa = cl.idcrm_empresa
  inner join crm_funil_etapa cfe on cfe.idcrm_funil_etapa = cl.idcrm_funil_etapa 
where  
  cl.login = :login
  and cp.idestabelecimento = :idestabelecimento
  and cl.idcrm_funil = :idcrm_funil
  and cl.status = 'A'
  and cl.dt_ganho is not null
  and cfe.ie_tipo_etapa = 'G'
  and DATE_FORMAT(cl.dt_ganho, '%m/%Y') = DATE_FORMAT(:dt_ref, '%m/%Y') 
order by cl.dt_ganho desc;