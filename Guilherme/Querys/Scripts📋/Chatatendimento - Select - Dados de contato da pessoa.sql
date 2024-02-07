SELECT
	cp.idcrm_pessoa,
	cc.ds_contato_nome,
	cc.dt_nascimento,
	cc.nr_documento,
	cc.ie_sexo,
	cc.idpessoa_fisica,
	pf.nm_mae,
	cc.ds_nome 
FROM
	chat_atendimento ca 
inner join crm_lead cl on
	cl.idcrm_lead = ca.idcrm_lead
inner join crm_pessoa cp on
	cp.idcrm_pessoa = cl.idcrm_pessoa and cp.idpessoa_fisica is null 
inner join contato_chatbot cc on
	cc.idcontato_chatbot = ca.idcontato_chatbot and cc.idpessoa_fisica is not null
inner JOIN  pessoa_fisica pf on
	pf.idpessoa_fisica = cc.idpessoa_fisica 
WHERE
	ca.idchat_atendimento  = :idchat_atendimento;