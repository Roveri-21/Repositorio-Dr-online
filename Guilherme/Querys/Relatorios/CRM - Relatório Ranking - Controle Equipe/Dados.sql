select 
  pf.nm_pessoa,
  DATE_FORMAT(cl.dt_ganho, '%m/%Y') mes_ref,
  sum(COALESCE(cl.ds_quantidade, 0)) ds_quantidade,
  sum(COALESCE(cl.ds_valor, 0)) vl_total   
from crm_lead cl
   inner join crm_funil cf on cl.idcrm_funil = cf.idcrm_funil 
   inner join usuario u ON u.login = cl.login 
   inner join pessoa_fisica pf on pf.idpessoa_fisica = u.idpessoa_fisica 
where
  cl.idcrm_funil = :idcrm_funil
  and cl.status = 'A'
  and DATE_FORMAT(cl.dt_ganho, '%m/%Y') = DATE_FORMAT(:dt_ref, '%m/%Y')
and (select 
                cl2.idcrm_lead 
              from crm_lead cl2 
              LEFT JOIN JSON_TABLE(cl.cd_produto_ganho, '$[*]' COLUMNS (cod INT PATH '$')) j ON j.cod > 0
              where cl2.idcrm_lead = cl.idcrm_lead
                    and (((COALESCE(:cd_produto_ganho, j.cod)) = j.cod)
                            or  (f_json_table(:cd_produto_ganho, j.cod)))
                    )
group by pf.nm_pessoa, DATE_FORMAT(cl.dt_ganho, '%m/%Y')
order by pf.nm_pessoa;