select
  DISTINCT
  cl.login,  
  pf.nm_pessoa,
	sum(IF(MONTH(cl.dt_ganho) = 1, cl.ds_valor, 0)) AS janeiro,
    sum(IF(MONTH(cl.dt_ganho) = 2, cl.ds_valor, 0)) AS fevereiro,
    sum(IF(MONTH(cl.dt_ganho) = 3, cl.ds_valor, 0)) AS marco,
    sum(IF(MONTH(cl.dt_ganho) = 4, cl.ds_valor, 0)) AS abril,
    sum(IF(MONTH(cl.dt_ganho) = 5, cl.ds_valor, 0)) AS maio,
    sum(IF(MONTH(cl.dt_ganho) = 6, cl.ds_valor, 0)) AS junho,
    sum(IF(MONTH(cl.dt_ganho) = 7, cl.ds_valor, 0)) AS julho,
    sum(IF(MONTH(cl.dt_ganho) = 8, cl.ds_valor, 0)) AS agosto,
    sum(IF(MONTH(cl.dt_ganho) = 9, cl.ds_valor, 0)) AS setembro,
    sum(IF(MONTH(cl.dt_ganho) = 10, cl.ds_valor, 0)) AS outubro,
    sum(IF(MONTH(cl.dt_ganho) = 11, cl.ds_valor, 0)) AS novembro,
    sum(IF(MONTH(cl.dt_ganho) = 12, cl.ds_valor, 0)) AS dezembro,
    sum(cl.ds_valor)as total
from crm_lead cl
inner join crm_funil cf on cf.idcrm_funil = cl.idcrm_funil
inner join crm_projeto cp on cp.idcrm_projeto = cf.idcrm_projeto
inner join usuario u on u.login = cl.login
inner join pessoa_fisica pf on pf.idpessoa_fisica = u.idpessoa_fisica
where
  cp.idestabelecimento = {{:idestabelecimento}}
  and cf.idcrm_funil = :idcrm_funil  
  and DATE_FORMAT(cl.dt_ganho, '%Y') = :ref_ano
GROUP BY cl.login,pf.nm_pessoa
ORDER BY pf.nm_pessoa;