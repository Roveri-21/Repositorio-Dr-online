SELECT
pf.nm_pessoa,
pf.idpessoa_fisica
    FROM
        chat_atendimento ca
    INNER JOIN usuario u ON
        u.idusuario = ca.idusuario
    INNER JOIN pessoa_fisica pf ON
        pf.idpessoa_fisica = u.idpessoa_fisica
    WHERE
        ca.idestabelecimento = {{:idestabelecimento}}
        AND DATE(ca.dt_inicio) BETWEEN :dt_inicial AND :dt_final
        AND ca.idatendimento_chatbot_fila = :idatendimento_chatbot_fila
        GROUP BY pf.nm_pessoa ;