SELECT
	:idchat_atendimento as idchat_atendimento,
    :idcontato_chatbot as idcontato_chatbot,
    :nr_celular as nr_celular
FROM
contato_chatbot cc 
WHERE 
	cc.idcontato_chatbot = :idcontato_chatbot
	AND idpessoa_fisica is null;