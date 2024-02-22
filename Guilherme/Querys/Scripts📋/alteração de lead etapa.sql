
/*
 * Manutenção de Origem e Etapa solicitado pelo corretora america - Alessandra [2024-01-17]
 * */
select 
  d.idcrm_lead,
  d.import_idcrm_funil_etapa,
  d.lead_idcrm_funil_etapa,
  d.new_idcrm_funil_etapa,
  d.import_idcrm_origem_lead,
  d.lead_idcrm_origem_lead,
  d.new_idcrm_origem_lead,  
  if(COALESCE(d.up_etapa, d.up_origem) is not null, 'Alterado', '') situacao,
  d.up_etapa,
  d.up_origem, 
  if(COALESCE(d.up_etapa, d.up_origem) is not null, CONCAT('update crm_lead set ', if(d.up_etapa is not null, d.up_etapa, d.up_origem), if(d.up_etapa is not null and d.up_origem is not null, CONCAT(', ', d.up_origem), ''), ' where idcrm_lead = ', d.idcrm_lead, '; '), '') ds_script 
from (
select 
  s.idcrm_lead,
  s.import_idcrm_funil_etapa,
  s.lead_idcrm_funil_etapa,
  s.new_idcrm_funil_etapa,
  s.import_idcrm_origem_lead,
  s.lead_idcrm_origem_lead,
  s.new_idcrm_origem_lead,
  if(s.lead_idcrm_funil_etapa <> s.new_idcrm_funil_etapa, CONCAT('idcrm_funil_etapa = ', s.new_idcrm_funil_etapa), null) up_etapa,
  if(s.lead_idcrm_origem_lead <> s.new_idcrm_origem_lead, CONCAT('idcrm_origem_lead = ', s.new_idcrm_origem_lead), null) up_origem
from (
select
  clh.idcrm_lead,
  clh.idcrm_funil_etapa import_idcrm_funil_etapa,
  cl.idcrm_funil_etapa lead_idcrm_funil_etapa,
  (select x.idcrm_funil_etapa from crm_lead_historico x
where
  x.idcrm_lead = clh.idcrm_lead 
  and x.idcrm_funil_etapa is not null
  and x.login_hist <> 'avferreira'
  and x.ie_origem_acao is null
  and x.ie_tipo_historico_lead = 2
order by x.idcrm_lead_historico desc
limit 1) new_idcrm_funil_etapa,
  (select x.idcrm_origem_lead from crm_lead_historico x
where
  x.idcrm_lead = cl.idcrm_lead
  and x.ds_historico like 'Alteração da etapa %'
  and x.idcrm_origem_lead is not null
  and x.login_hist = 'avferreira'
  and x.ie_origem_acao = 'IA'
  and x.ie_tipo_historico_lead = 2
order by x.idcrm_lead_historico desc
limit 1) import_idcrm_origem_lead,
  cl.idcrm_origem_lead lead_idcrm_origem_lead,  
  (select x.idcrm_origem_lead from crm_lead_historico x
where
  x.idcrm_lead = clh.idcrm_lead
  and x.idcrm_origem_lead is not null
  and x.login_hist <> 'avferreira'
  and x.ie_origem_acao is null
  and x.ie_tipo_historico_lead = 0
order by x.idcrm_lead_historico desc
limit 1) new_idcrm_origem_lead
from crm_lead_historico clh
  inner join crm_lead cl on cl.idcrm_lead = clh.idcrm_lead 
where
  clh.ie_origem_acao = 'IA'
  and clh.login_hist = 'avferreira'
  and date(clh.dt_historico) = '2024-01-12'
  and clh.ds_historico = 'Alteração da lead!'
order by clh.idcrm_lead_historico desc
) s
) d
where
  d.new_idcrm_funil_etapa is not null
  or d.new_idcrm_origem_lead is not null;