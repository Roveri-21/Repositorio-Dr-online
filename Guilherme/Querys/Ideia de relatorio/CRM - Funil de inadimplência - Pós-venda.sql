select
  DISTINCT
  MONTHNAME(cl.dt_ganho), 
  DATE_FORMAT(cl.dt_ganho,'%d/%m/%Y') as Data, 
  cl.ds_quantidade,
  cl.ds_valor,
  cl.idcrm_funil_marcador,
  pf.nm_pessoa,
  f_replace_emoji(COALESCE(COALESCE(cp2.nm_pessoa,COALESCE(ce.nome_fantasia,ce.ds_razao_social)),cl.ds_titulo)) as ds_titulo
from crm_lead cl
inner join crm_funil cf on cf.idcrm_funil = cl.idcrm_funil
inner join crm_projeto cp on cp.idcrm_projeto = cf.idcrm_projeto
inner join usuario u on u.login = cl.login
inner join pessoa_fisica pf on pf.idpessoa_fisica = u.idpessoa_fisica
left join crm_pessoa cp2 on cp2.idcrm_pessoa = cl.idcrm_pessoa
left join crm_empresa ce on ce.idcrm_empresa = cl.idcrm_empresa
where
  cp.idestabelecimento = :idestabelecimento
--   and cl.login = :login
  and cf.idcrm_funil = :idcrm_funil  
  and DATE_FORMAT(cl.dt_ganho, '%Y') = :ref_ano
ORDER BY pf.nm_pessoa;
