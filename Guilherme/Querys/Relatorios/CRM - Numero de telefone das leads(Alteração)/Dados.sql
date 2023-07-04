SELECT
	r.idcrm_lead,
	r.ds_origem,
	r.ds_titulo,
	r.ds_etapa,
f_replace_emoji(r.nm_contato) as nm_contato,
	r.nr_telefone,
	r.ds_email,
	r.ds_marcador,
	r.idtipo_perda,
	r.ds_historico_perda,
	r.dt_lead,
	r.dt_movimento_lead
FROM
	(
	SELECT
		DISTINCT
        cl.idcrm_lead,
		col.ds_origem,
		cl.ds_titulo,
		cfe.ds_etapa,
		if(cl.idcrm_pessoa,
		cp2.nm_pessoa,
		COALESCE(ce.nome_fantasia, ce.ds_razao_social)) nm_contato,
		if(cl.idcrm_pessoa,
		CONCAT('+', COALESCE(cpc.nr_ddi_telefone, '55'), ' (', cpc.nr_ddd_telefone, ') ', cpc.nr_telefone),
		CONCAT('+', COALESCE(cec.nr_ddi_telefone, '55'), ' (', cec.nr_ddd_telefone, ') ', cec.nr_telefone)) nr_telefone,
		if(cl.idcrm_pessoa,
		cpc.ds_email,
		cec.ds_email) ds_email,
		(
		select
			GROUP_CONCAT(cfm.ds_marcador order by icl.idcrm_lead SEPARATOR '; ') ds_combo_marcador
		from
			crm_lead icl
		LEFT JOIN JSON_TABLE(icl.idcrm_funil_marcador,
			'$[*]' COLUMNS (cod INT PATH '$')) j ON
			j.cod > 0
		left join crm_funil_marcador cfm on
			cfm.idcrm_funil_marcador = j.cod
			and cfm.idcrm_funil = icl.idcrm_funil
		where
			icl.idcrm_lead = cl.idcrm_lead
		group by
			icl.idcrm_lead) ds_marcador,
		(
		select
			clh.idtipo_perda
		from
			crm_lead_historico clh
		inner join tipo_historico th on
			th.idtipo_historico = clh.idtipo_perda
		where
			clh.idcrm_lead = cl.idcrm_lead
			and clh.idtipo_perda is not null
		order by
			clh.idcrm_lead_historico
		limit 1) idtipo_perda,
		(
		select
			th.ds_historico
		from
			crm_lead_historico clh
		inner join tipo_historico th on
			th.idtipo_historico = clh.idtipo_perda
		where
			clh.idcrm_lead = cl.idcrm_lead
			and clh.idtipo_perda is not null
		order by
			clh.idcrm_lead_historico
		limit 1) ds_historico_perda,
		DATE_FORMAT(cl.dt_insert, '%d/%m/%Y %H:%ih') dt_lead,
		DATE_FORMAT(cl.dt_evento, '%d/%m/%Y %H:%ih') dt_movimento_lead
	FROM
		crm_lead cl
	INNER JOIN crm_funil cf ON
		cf.idcrm_funil = cl.idcrm_funil
		and cf.status = 'A'
	INNER JOIN crm_projeto cp ON
		cp.idcrm_projeto = cf.idcrm_projeto
		and cp.status = 'A'
	LEFT JOIN crm_pessoa cp2 ON
		cp2.idcrm_pessoa = cl.idcrm_pessoa
		and cp2.status = 'A'
	LEFT JOIN crm_pessoa_contato cpc on
		cpc.idcrm_pessoa = cp2.idcrm_pessoa
		and cpc.ie_principal = 'S'
		and cpc.status = 'A'
	LEFT JOIN crm_empresa ce ON
		ce.idcrm_empresa = cl.idcrm_empresa
		and ce.status = 'A'
	LEFT JOIN crm_empresa_contato cec ON
		cec.idcrm_empresa = cl.idcrm_empresa
		and cec.ie_principal = 'S'
		and cec.status = 'A'
	INNER JOIN crm_funil_etapa cfe ON
		cfe.idcrm_funil_etapa = cl.idcrm_funil_etapa
		and cfe.status = 'A'
		and coalesce(cfe.ie_tipo_etapa, 'P') = 'P'
	LEFT JOIN crm_origem_lead col ON
		col.idcrm_origem_lead = cl.idcrm_origem_lead
		and col.status = 'A'
	LEFT JOIN JSON_TABLE(cl.idcrm_funil_marcador,
		'$[*]' COLUMNS (cod INT PATH '$')) j on
		j.cod > 0
		or j.cod is null
	WHERE
		cp.idestabelecimento = {{:idestabelecimento}}
		and cf.idcrm_funil = :idcrm_funil
		and cl.status = 'A'
		and date(cl.dt_evento) BETWEEN :dt_inicio and :dt_fim
		and (((COALESCE(:idmarcador, j.cod)) = j.cod)
 		or  (f_json_table(:idmarcador, j.cod)))
) r
where
	((COALESCE(:idtipo_perda, r.idtipo_perda) = r.idtipo_perda)
	or f_json_table(:idtipo_perda, r.idtipo_perda));