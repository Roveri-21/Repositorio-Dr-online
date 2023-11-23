select ca.idchat_atendimento,ds_fila,ca.dt_inicio ,
      (SELECT round(AVG(diff)) AS media_diff
        FROM (
            SELECT idchat_mensagem, ie_tipo_mensagem, dt_insert,
                CASE WHEN ie_tipo_mensagem = 'E' AND LAG(ie_tipo_mensagem) OVER (ORDER BY dt_insert) != 'E'
                      THEN TIMESTAMPDIFF(SECOND, LAG(dt_insert) OVER (ORDER BY dt_insert), dt_insert)
                      ELSE NULL
                END AS diff
            FROM chat_mensagem
            WHERE chat_mensagem.idchat_atendimento = ca.idchat_atendimento
        )x
      ) as segundos_resposta_atendente
FROM chat_atendimento ca
left join atendimento_chatbot_fila on atendimento_chatbot_fila.idatendimento_chatbot_fila = ca.idatendimento_chatbot_fila
where
	ca.idestabelecimento = {{:idestabelecimento}}
	and ca.idchatbot <> 6
	and ca.idusuario is not null
	and ca.dt_inicio is not NULL 
	and ca.dt_finalizacao  is not null
	and ca.status = 'A';