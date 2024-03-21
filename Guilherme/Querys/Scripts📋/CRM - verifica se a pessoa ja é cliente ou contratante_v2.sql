SELECT
	'S' ie_cliente
FROM
	(
	SELECT 
		cc.idpessoa_fisica
	FROM
		chat_atendimento ca
	INNER JOIN contato_chatbot cc ON
		ca.idcontato_chatbot = cc.idcontato_chatbot
	INNER JOIN pessoa_fisica pf ON
		cc.idpessoa_fisica = pf.idpessoa_fisica
	inner join tm_usuario tu on
		tu.idpessoa_fisica = pf.idpessoa_fisica 
	WHERE 
		ca.idchat_atendimento = :idchat_atendimento_corrente
		and tu.idpessoa_fisica is not null
		and tu.idtm_usuario is not null
		and tu.status = 'A'
	UNION 
	SELECT  
		cc.idpessoa_fisica
	FROM
		chat_atendimento ca
	INNER JOIN contato_chatbot cc ON
		ca.idcontato_chatbot = cc.idcontato_chatbot
	INNER JOIN pessoa_fisica pf ON
		cc.idpessoa_fisica = pf.idpessoa_fisica
	INNER JOIN contrato c ON
		c.idpessoa_contratante = pf.idpessoa_fisica
		AND c.status = 'A'
		AND c.ie_estagio = 'C'
		AND c.dt_encerramento IS NULL
		AND CURRENT_DATE() BETWEEN c.dt_inicio AND c.dt_fim
	WHERE 
		ca.idchat_atendimento = :idchat_atendimento_corrente
) as grupo
UNION 
SELECT 'N' ie_cliente
limit 1;