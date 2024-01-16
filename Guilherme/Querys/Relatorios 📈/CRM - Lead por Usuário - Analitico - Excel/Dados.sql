select
    cl.idcrm_lead,
    ds_titulo,
    cl.login,
    th.ds_historico  as ds_perda,
    clh.ds_observacao ds_observacao_perda,
    REGEXP_REPLACE(convert(cp.nm_pessoa USING utf8),'\\?','?') nm_pessoa,
    coalesce(ce.nome_fantasia, ce.ds_razao_social) nm_empresa,
    f_lead_dados(cl.idcrm_lead,'F') ds_funil,
    f_lead_dados(cl.idcrm_lead,'E') ds_etapa,
    f_lead_dados(cl.idcrm_lead,'O') ds_origem,
    f_lead_dados(cl.idcrm_lead,'U') nm_proprietario,
    f_valor_iddominio(612,ie_etiqueta) ds_etiqueta,
    (Select Concat('R$ ', Replace(Replace (Replace (Format(cl.ds_valor, 2), '.', '|'), ',', '.'), '|', ','))) ds_valor,
    cl.ds_observacao,
    date_format(cl.dt_insert,'%d/%m/%Y') dt_insert,
    date_format(dt_espera_fim,'%d/%m/%Y') dt_espera_fim,
    if((TIMESTAMPDIFF(DAY, COALESCE((select max(clh2.dt_historico) from crm_lead_historico clh2 where clh2.idcrm_lead = cl.idcrm_lead and clh2.ie_tipo_historico_lead = 2),cl.dt_insert), CURDATE())) = 0,'0',(TIMESTAMPDIFF(DAY, COALESCE((select max(clh2.dt_historico) from crm_lead_historico clh2 where clh2.idcrm_lead = cl.idcrm_lead and clh2.ie_tipo_historico_lead = 2),cl.dt_insert), CURDATE()))) dias_etapa,
    concat(coalesce(cpc.nr_ddi_telefone,''),coalesce(cpc.nr_ddd_telefone,''),coalesce(cpc.nr_telefone,'')) nr_telefone_pessoa,
    concat(coalesce(cec.nr_ddi_telefone,''),coalesce(cec.nr_ddd_telefone,''),coalesce(cec.nr_telefone,'')) nr_telefone_empresa
from crm_lead cl 
left join crm_funil cf on cf.idcrm_funil = cl.idcrm_funil 
left join crm_projeto cp2 on cp2.idcrm_projeto = cf.idcrm_projeto 
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
and cp2.idestabelecimento = :idestabelecimento
and EXISTS(select u.login from crm_equipe_membro cem inner JOIN crm_equipe ce on ce.idcrm_equipe = cem.idcrm_equipe inner join crm_funil_participante cfp on cfp.idcrm_equipe = ce.idcrm_equipe  inner join usuario u on u.idusuario = cem.idusuario where (cem.idcrm_equipe in (f_json_table(:idcrm_equipe,cem.idcrm_equipe))) and cl.login = u.login and cl.idcrm_funil =cfp.idcrm_funil  and ce.idestabelecimento = :idestabelecimento)  
and (cl.login in (f_json_table(:login_usuario,cl.login)) or :login_usuario is null)
and (cl.idcrm_funil in (f_json_table(:idcrm_funil, cl.idcrm_funil)) or :idcrm_funil is null)
and (cl.idcrm_funil_etapa in (f_json_table(:crm_funil_etapa, cl.idcrm_funil_etapa)) or :crm_funil_etapa is null)
and (cl.ie_etiqueta in (f_json_table(:etiqueta,cl.ie_etiqueta)) or cl.ie_etiqueta in (select coalesce(:etiqueta,vl_dominio) from dominio_valor where iddominio = 612))
and (cl.idcrm_origem_lead in (f_json_table(:crm_origem_lead,cl.idcrm_origem_lead)) or :crm_origem_lead is null)
and cl.status = 'A'
order by cl.login, cl.nr_seq_apresent;