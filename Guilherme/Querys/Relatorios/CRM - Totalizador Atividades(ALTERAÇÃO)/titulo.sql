 select 
 	sum(total_trabalhada) as total_trabalhada,
 	sum(total_outros)     as total_outros,
 	sum(total_etapa)	  as total_etapa,
 	abs(sum(total_ganhos))	  as total_ganhos,
 	sum(total_perca)       as total_perca
 from (
select 
  sum(ie_ganho) - 
  (select count(clh2.idcrm_lead_historico)  from crm_lead_historico clh2 
         left join crm_funil_etapa cfe2 on cfe2.idcrm_funil_etapa = clh2.idcrm_funil_etapa 
         where clh2.idcrm_lead = x.idcrm_lead
           and cfe2.ie_tipo_etapa = 'G' and clh2.login_hist = :login)  total_ganhos,
  sum(ie_perda) total_perca,
  sum(ie_criacao) total_criacao,
  sum(ie_outros) total_outros,
  sum(ie_etapa) total_etapa,
  count(distinct idcrm_lead) total_lead,
  count(distinct ie_trabalhada) total_trabalhada
from (select 
  case when coalesce(cfe.ie_tipo_etapa,'') = 'G' and cfe.idcrm_funil_etapa = cl.idcrm_funil_etapa and clh.login_hist = :login then 1 else 0 end ie_ganho,
  case when coalesce(cfe.ie_tipo_etapa,'') = 'P' and clh.login_hist = :login then 1 else 0 end ie_perda,
  case when coalesce(clh.ie_tipo_historico_lead,'') = '0' then 1 else 0 end ie_criacao,
  case when coalesce(clh.ie_tipo_historico_lead,'') = '2' and clh.login_hist  = :login  then 1 else 0 end ie_etapa,
  case when coalesce(clh.ie_tipo_historico_lead,'') not in ('0','14','15','1','2') and clh.login_hist  = :login  then 1 else 0 end ie_outros,
  case when coalesce(clh.ie_tipo_historico_lead,'') <> '0' and clh.login_hist  = :login then clh.idcrm_lead else null end ie_trabalhada,
  clh.idcrm_lead 
from crm_lead_historico clh 
left join crm_lead cl on cl.idcrm_lead = clh.idcrm_lead 
left join crm_funil_etapa cfe on cfe.idcrm_funil_etapa = clh.idcrm_funil_etapa 
where cl.idcrm_funil = :idcrm_funil
  and cl.login = :login
  and cl.status = 'A'
  and DATE(clh.dt_insert) BETWEEN  :dt_inicial  and :dt_final) x ) y;
  


  sum(IF(cfe.ie_tipo_etapa) = 'G', cl.ds_valor, 0) AS janeiro,