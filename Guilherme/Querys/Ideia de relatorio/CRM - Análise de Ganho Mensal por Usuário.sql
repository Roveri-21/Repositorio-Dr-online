--Forma mais otimizada 
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
  cp.idestabelecimento = :idestabelecimento
  and cf.idcrm_funil = :idcrm_funil  
  and DATE_FORMAT(cl.dt_ganho, '%Y') = :ref_ano
GROUP BY cl.login,pf.nm_pessoa
ORDER BY pf.nm_pessoa;

-- segunda forma menos otimizada

select   
  v.nm_pessoa,
  (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 1 AND clm.login = v.login) AS vlr_janeiro,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 2 AND clm.login = v.login) AS vlr_fevereiro,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 3 AND clm.login = v.login) AS vlr_marco,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 4 AND clm.login = v.login) AS vlr_abril,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 5 AND clm.login = v.login) AS vlr_maio,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 6 AND clm.login = v.login) AS vlr_junho,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 7 AND clm.login = v.login) AS vlr_julho,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 8 AND clm.login = v.login) AS vlr_agosto,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 9 AND clm.login = v.login) AS vlr_setembro,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 10 AND clm.login = v.login) AS vlr_outubro,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 11 AND clm.login = v.login) AS vlr_novembro,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 12 AND clm.login = v.login) AS vlr_dezembro,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND clm.login = v.login) AS vlr_total_ano
from  
(select
  DISTINCT
  cl.login,  
  pf.nm_pessoa  
from crm_lead cl
inner join crm_funil cf on cf.idcrm_funil = cl.idcrm_funil
inner join crm_projeto cp on cp.idcrm_projeto = cf.idcrm_projeto
inner join usuario u on u.login = cl.login
inner join pessoa_fisica pf on pf.idpessoa_fisica = u.idpessoa_fisica
where
  cp.idestabelecimento = :idestabelecimento
  and cf.idcrm_funil = :idcrm_funil  
  and DATE_FORMAT(cl.dt_ganho, '%Y') = :ref_ano) v
order by v.nm_pessoa;


--Terceira forma mau otimizada (Não usar)
select
  DISTINCT
  cl.login,  
  pf.nm_pessoa,
(SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 1 AND clm.login = cl.login) AS vlr_janeiro,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 2 AND clm.login = cl.login) AS vlr_fevereiro,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 3 AND clm.login = cl.login) AS vlr_marco,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 4 AND clm.login = cl.login) AS vlr_abril,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 5 AND clm.login = cl.login) AS vlr_maio,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 6 AND clm.login = cl.login) AS vlr_junho,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 7 AND clm.login = cl.login) AS vlr_julho,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 8 AND clm.login = cl.login) AS vlr_agosto,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 9 AND clm.login = cl.login) AS vlr_setembro,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 10 AND clm.login = cl.login) AS vlr_outubro,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 11 AND clm.login = cl.login) AS vlr_novembro,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND MONTH(clm.dt_ganho) = 12 AND clm.login = cl.login) AS vlr_dezembro,
    (SELECT COALESCE(SUM(clm.ds_valor), 0) FROM crm_lead clm WHERE clm.idcrm_funil = :idcrm_funil AND YEAR(clm.dt_ganho) = :ref_ano AND clm.login = cl.login) AS vlr_total_ano
from crm_lead cl
inner join crm_funil cf on cf.idcrm_funil = cl.idcrm_funil
inner join crm_projeto cp on cp.idcrm_projeto = cf.idcrm_projeto
inner join usuario u on u.login = cl.login
inner join pessoa_fisica pf on pf.idpessoa_fisica = u.idpessoa_fisica
where
  cp.idestabelecimento = :idestabelecimento
  and cf.idcrm_funil = :idcrm_funil  
  and DATE_FORMAT(cl.dt_ganho, '%Y') = :ref_ano;