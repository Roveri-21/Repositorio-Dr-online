SELECT
    :idchat_atendimento as idchat_atendimento,
    :idcontato_chatbot as idcontato_chatbot,
	if (c.idcontrato is null,171,172)id_marcador,
	pf.nm_pessoa,
	pf.nr_cpf,
	pfc.ds_email,
	pfc.ds_municipio,
	pf.dt_nascimento,
	pf.ie_sexo,
	pf.idpessoa_fisica 
FROM
		pessoa_fisica_compl pfc
inner join pessoa_fisica pf on
		pf.idpessoa_fisica = pfc.idpessoa_fisica
inner join tm_usuario tu on
	tu.idpessoa_fisica = pf.idpessoa_fisica
left join contrato c on
	c.idpessoa_contratante = pf.idpessoa_fisica and c.status ='A' and c.ie_estagio = 'C' and c.dt_encerramento is null and CURRENT_DATE()BETWEEN c.dt_inicio and c.dt_fim  
WHERE 
	COALESCE(pfc.nr_ddi_celular, '55') = f_extrair_numero_telefone(:nr_celular,'DDI')
	AND COALESCE(pfc.nr_ddd_celular, '0')= f_extrair_numero_telefone(:nr_celular,'DDD')
	AND RIGHT(COALESCE(pfc.nr_celular, '0'),8) = f_extrair_numero_telefone(:nr_celular,'NR8')
	AND pfc.ie_tipo_complemento = 1
	AND pfc.status = 'A';