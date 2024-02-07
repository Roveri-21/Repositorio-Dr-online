SELECT
	ca.idchat_atendimento as idchat_atendimento_corrente, 
 	if (c.idcontrato is not null ,172,171) as id_marcador
FROM
	chat_atendimento ca
inner join contato_chatbot cc on
	cc.idcontato_chatbot = ca.idcontato_chatbot 
inner join tm_usuario tu on
	tu.idpessoa_fisica = cc.idpessoa_fisica  and tu.status ='A'
left join contrato c on
	c.idpessoa_contratante = cc.idpessoa_fisica and c.status ='A' and c.ie_estagio = 'C' and c.dt_encerramento is null and CURRENT_DATE()BETWEEN c.dt_inicio and c.dt_fim
WHERE
	ca.idchat_atendimento =:idchat_atendimento_corrente;