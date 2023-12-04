SELECT
    ca.idchat_atendimento,
f_replace_emoji(COALESCE (cc2.ds_contato_nome, cc2.ds_nome)) ds_nome,
    cc.nr_telefone telefone,
    DATE_FORMAT(ca.dt_inicio,'%d/%m/%Y %H:%i') AS dt_inicio,
    -- tempo de espera
    CASE
        WHEN TIMESTAMPDIFF(HOUR,
        ca.dt_inicio,
        COALESCE(ca.dt_chamada,ca.dt_finalizacao)) >= 24 THEN
            CONCAT(
                TIMESTAMPDIFF(DAY, ca.dt_inicio,COALESCE(ca.dt_chamada,ca.dt_finalizacao)),
                ' dia(s) ',
                MOD(TIMESTAMPDIFF(HOUR, ca.dt_inicio,COALESCE(ca.dt_chamada,ca.dt_finalizacao)), 24),
                ' hora(s)'
            )
        ELSE
            TIME_FORMAT(SEC_TO_TIME(TIMESTAMPDIFF(SECOND , ca.dt_inicio,COALESCE(ca.dt_chamada,ca.dt_finalizacao))), '%H:%i:%s')
    END AS TME,
    DATE_FORMAT(ca.dt_finalizacao,'%d/%m/%Y %H:%i') AS dt_finalizacao,
    -- tempo de atendimento
    CASE
        WHEN TIMESTAMPDIFF(HOUR,
        ca.dt_chamada,
        dt_finalizacao) >= 24 THEN
            CONCAT(
                TIMESTAMPDIFF(DAY, ca.dt_chamada, dt_finalizacao),
                ' dia(s) ',
                MOD(TIMESTAMPDIFF(HOUR, ca.dt_chamada, dt_finalizacao), 24),
                ' hora(s)'
            )
        ELSE
            TIME_FORMAT(SEC_TO_TIME(TIMESTAMPDIFF(SECOND, ca.dt_chamada, dt_finalizacao)), '%H:%i:%s')
    END AS TMA
FROM
    chat_atendimento ca
INNER JOIN atendimento_chatbot_fila acf ON
    acf.idatendimento_chatbot_fila = ca.idatendimento_chatbot_fila
INNER JOIN contato_chatbot cc ON
    cc.idcontato_chatbot = ca.idcontato_chatbot
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
AND 
        pf.idpessoa_fisica = :idpessoa_fisica
ORDER by
    idchat_atendimento DESC;