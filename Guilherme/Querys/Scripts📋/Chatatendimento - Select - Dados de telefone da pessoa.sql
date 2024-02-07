SELECT
	cp.idcrm_pessoa,
 	cc.ds_email 
FROM
	chat_atendimento ca 
inner join crm_lead cl on
	cl.idcrm_lead = ca.idcrm_lead
inner join crm_pessoa cp on
	cp.idcrm_pessoa = cl.idcrm_pessoa  
inner join contato_chatbot cc on
	cc.idcontato_chatbot = ca.idcontato_chatbot 
inner JOIN  pessoa_fisica pf on
	pf.idpessoa_fisica = cc.idpessoa_fisica 
inner JOIN crm_pessoa_contato cpc on
	cpc.idcrm_pessoa = cp.idcrm_pessoa and cpc.ie_principal = 'S' and cpc.ds_email is null
WHERE
	ca.idchat_atendimento  = :idchat_atendimento;