SELECT
    ca.idatendimento_chatbot_fila,
    acf.ds_fila
FROM
    chat_atendimento ca
INNER JOIN atendimento_chatbot_fila acf ON
    acf.idatendimento_chatbot_fila = ca.idatendimento_chatbot_fila
INNER JOIN contato_chat cc ON
    cc.idcontato_chat = ca.idcontato_chatbot
INNER JOIN usuario u ON
    u.idusuario = ca.idusuario
INNER JOIN pessoa_fisica pf ON
    pf.idpessoa_fisica = u.idpessoa_fisica
INNER JOIN contato_chatbot cc2 on
	cc2.idcontato_chatbot = ca.idcontato_chatbot
where
     ca.idestabelecimento = {{:idestabelecimento}}
AND
  	date(ca.dt_inicio) BETWEEN :dt_inicial AND :dt_final 
AND 
	ca.idatendimento_chatbot_fila = :idatendimento_chatbot_fila
GROUP BY
    ds_fila;