SELECT 
	  R.idpessoa_fisica,
	  R.nm_pessoa,
	  R.nota_movimento_lead,
	  R.nota_insercao_contato,
	  R.nota_constancia_uso,
	  R.nota_jornada_venda,
	  (R.nota_movimento_lead + R.nota_insercao_contato + R.nota_constancia_uso + R.nota_jornada_venda) total_nota
	FROM (
	SELECT   
	  u.idpessoa_fisica,
	  pf.nm_pessoa,
	  coalesce((select sum(s.nota_lead) from (select  
	  DATE_FORMAT(clh.dt_historico, '%w') dia_semana,
	  count(DISTINCT clh2.idcrm_lead) qtd_lead_nova,       
	  count(DISTINCT clh3.idcrm_lead) qtd_lead_nova_mov_etapa,  
	  (count(DISTINCT clh.idcrm_lead) - count(DISTINCT clh3.idcrm_lead)) qtd_lead_mov,  
	  if(count(DISTINCT clh2.idcrm_lead) = 0, if((count(DISTINCT clh.idcrm_lead))> 0, 0.6, 0), ((count(DISTINCT clh3.idcrm_lead) / count(DISTINCT clh2.idcrm_lead)) * 0.6)) nota_lead
	from crm_lead_historico clh 
	  inner join crm_lead cl on clh.idcrm_lead = cl.idcrm_lead
	  left join crm_lead_historico clh2 on clh.idcrm_lead = clh2.idcrm_lead and clh2.ie_tipo_historico_lead = 8 and date(clh.dt_historico) = date(clh2.dt_historico)
	  left join crm_lead_historico clh3 on clh.idcrm_lead = clh3.idcrm_lead and clh3.ie_tipo_historico_lead = 2 and date(clh2.dt_historico) = date(clh3.dt_historico)
	where
	  cl.idcrm_funil = cfp.idcrm_funil
	  and date(clh.dt_historico) BETWEEN p_dt_inicio and p_dt_fim 
	  and CAST(DATE_FORMAT(clh.dt_historico, '%w') as UNSIGNED) BETWEEN 1 and 5
	  and clh.ie_tipo_historico_lead = 2
	  and clh.login_hist = u.login
	group by DATE_FORMAT(clh.dt_historico, '%w')
	order by date(clh.dt_historico)) s), 0) nota_movimento_lead,
	  coalesce((select sum(s.nota_lead) from (select
	  DATE_FORMAT(clh.dt_historico, '%w') dia_semana,
	  count(DISTINCT clh.idcrm_lead) qtd_lead_criada,
	  if(count(DISTINCT clh.idcrm_lead) > 0, 0.4, 0) nota_lead
	from crm_lead_historico clh
	  inner join crm_lead cl on clh.idcrm_lead = cl.idcrm_lead
	where
	  cl.idcrm_funil = cfp.idcrm_funil 
	  and date(clh.dt_historico) BETWEEN p_dt_inicio and p_dt_fim 
	  and CAST(DATE_FORMAT(clh.dt_historico, '%w') as UNSIGNED) BETWEEN 1 and 5  
	  and clh.ie_tipo_historico_lead = 0
	  and clh.login_hist = u.login group by DATE_FORMAT(clh.dt_historico, '%w')) s ), 0) nota_insercao_contato,
	  COALESCE((select sum(s.nota_lead) from (select
	  DATE_FORMAT(clh.dt_historico, '%w') dia_semana,
	  count(DISTINCT clh.idcrm_lead) qtd_lead_criada,
	  if(count(DISTINCT clh.idcrm_lead) > 0, 0.4, 0) nota_lead
	from crm_lead_historico clh
	  inner join crm_lead cl on clh.idcrm_lead = cl.idcrm_lead
	where
	  cl.idcrm_funil = cfp.idcrm_funil  
	  and date(clh.dt_historico) BETWEEN p_dt_inicio and p_dt_fim 
	  and CAST(DATE_FORMAT(clh.dt_historico, '%w') as UNSIGNED) BETWEEN 1 and 5   
	  and clh.login_hist = u.login group by DATE_FORMAT(clh.dt_historico, '%w')) s), 0) nota_constancia_uso,
	  COALESCE((select sum(s.nota_lead) from (select
  DATE_FORMAT(clh.dt_historico, '%w') dia_semana,
  count(DISTINCT clh.idcrm_lead) qtd_lead_criada,
  if (sum(if(date(clh.dt_historico) <> date(cl.dt_ganho), 1, 0))> 0, 0, if(sum(if(date(clh.dt_historico) = date(cl.dt_ganho), 1, 0)) > 0, 0.4, 0)) nota_lead,
  sum(if(date(clh.dt_historico) = date(cl.dt_ganho), 1, 0)) qtd_correto,
  sum(if(date(clh.dt_historico) <> date(cl.dt_ganho), 1, 0)) qtd_errado
from crm_lead_historico clh
  inner join crm_lead cl on clh.idcrm_lead = cl.idcrm_lead
  left join crm_funil_etapa cfe on cl.idcrm_funil_etapa = cfe.idcrm_funil_etapa and cfe.ie_tipo_etapa = 'G'
where
  cl.idcrm_funil = cfp.idcrm_funil  
  and date(clh.dt_historico) BETWEEN p_dt_inicio and p_dt_fim
  and CAST(DATE_FORMAT(clh.dt_historico, '%w') as UNSIGNED) BETWEEN 1 and 5
  and clh.ie_tipo_historico_lead = '2'
  and clh.idcrm_funil_etapa = cfe.idcrm_funil_etapa
  and clh.login_hist = u.login
group by DATE_FORMAT(clh.dt_historico, '%w')) s), 0) nota_jornada_venda  
	FROM crm_funil_participante cfp
	  inner join crm_equipe ce on cfp.idcrm_equipe = ce.idcrm_equipe and ce.status = 'A'
	  inner join crm_equipe_membro cem on cfp.idcrm_equipe = cem.idcrm_equipe and cem.status = 'A'
	  inner join usuario u ON cem.idusuario = u.idusuario and u.status = 'A'
	  inner join pessoa_fisica pf on pf.idpessoa_fisica = u.idpessoa_fisica
	where
	  cfp.idcrm_funil = p_idcrm_funil
	  and cfp.status = 'A'
	  and u.status = 'A'
	  and u.idpessoa_fisica not in (1, 2, 3, 4, 7, 14, 5528, 15596, 16974)  
	) R
	order by 7 desc, R.nm_pessoa; 