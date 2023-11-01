SELECT
	tu.idtm_usuario,
	pf.nm_pessoa,
	CONCAT(pfc.nr_ddd_celular, ' ', pfc.nr_celular) as telefone,
	upper(CONCAT(pfc.ds_municipio, ' - ', pfc.sg_uf)) as localizacao,
	'CONSULTA AVULSA' AS modalidade_escolhida,
	nf.vl_total_nota,
	DATE_FORMAT(ap.dt_atend_medico, '%d/%m/%Y') as dt_atend_medico,
	DATE_FORMAT(nf.dt_emissao, '%d/%m/%Y') as dt_emissao,
	nf.nr_nota_fiscal
FROM
	nota_fiscal nf
left join pessoa_fisica pf
		USING(idpessoa_fisica)
left join tm_usuario tu
		using(idpessoa_fisica)
left join pessoa_fisica_compl pfc on
	pfc.idpessoa_fisica = nf.idpessoa_fisica
	and pfc.ie_tipo_complemento = '1'
left join atendimento_paciente ap
		using(idatendimento_paciente)
where
        DATE_FORMAT(nf.dt_emissao, '%m%Y') = :mes_ref
	and nf.nr_nota_fiscal is not null
	and nf.dt_cancelamento is null
	and nf.status = 'A'
order by
	nf.nr_nota_fiscal;