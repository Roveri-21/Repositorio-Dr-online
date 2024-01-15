select
count(cl.idcrm_lead) qtd
from crm_lead cl 
left join crm_lead_historico clh on clh.idcrm_lead = cl.idcrm_lead 
and clh.idtipo_perda is not null 
left join tipo_historico th on th.idtipo_historico = clh.idtipo_perda 
left join crm_pessoa cp on cp.idcrm_pessoa = cl.idcrm_pessoa
left join crm_pessoa_contato cpc on cpc.idcrm_pessoa = cp.idcrm_pessoa 
  and cpc.ie_principal = 'S'
left join crm_empresa ce on ce.idcrm_empresa = cl.idcrm_empresa 
left join crm_empresa_contato cec on cec.idcrm_empresa = cl.idcrm_empresa 
  and cec.ie_principal = 'S'
where DATE_FORMAT(cl.dt_insert,'%Y-%m-%d') between :dt_inicial and :dt_final
and f_lead_dados(cl.idcrm_lead,'EST') = {{:idestabelecimento}}
and (cl.login in (f_json_table(:login_usuario,cl.login)) or :login_usuario is null)
and (cl.idcrm_funil in (f_json_table(:idcrm_funil, cl.idcrm_funil)) or :idcrm_funil is null)
and (cl.idcrm_funil_etapa in (f_json_table(:crm_funil_etapa, cl.idcrm_funil_etapa)) or :crm_funil_etapa is null)
and (cl.ie_etiqueta in (f_json_table(:etiqueta,cl.ie_etiqueta)) or cl.ie_etiqueta in (select coalesce(:etiqueta,vl_dominio) from dominio_valor where iddominio = 612))
and (cl.idcrm_origem_lead in (f_json_table(:crm_origem_lead,cl.idcrm_origem_lead)) or :crm_origem_lead is null) 
order by cl.login, cl.nr_seq_apresent;