select
 count(x.idchat_atendimento) qtd_atend,
 count(distinct x.idcontato_chatbot) qtd_cliente,
 concat(floor(avg(x.segundos_aguardando_fila) / 60), 'min ', round(avg(x.segundos_aguardando_fila)) % 60, 'seg') segundos_aguardando_fila,
 concat(floor(avg(x.segundos_primeira_resposta_atendente)  / 60), 'min ', round(avg(x.segundos_primeira_resposta_atendente)) % 60, 'seg') segundos_med_prim_resp_atend,
 concat(floor(avg(x.segundos_resposta_atendente) / 60), 'min ', round(avg(x.segundos_resposta_atendente)) % 60, 'seg') segundos_med_resp_atend,
 concat(floor(avg(x.segundos_resposta_cliente) / 60), 'min ', round(avg(x.segundos_resposta_cliente)) % 60, 'seg') segundos_med_resp_cliente,
 concat(floor(avg(x.segundos_atendimento) / 60), 'min ', round(avg(x.segundos_atendimento)) % 60, 'seg') segundos_atendimento
from (
select ca.idusuario, ca.idchat_atendimento, ca.idcontato_chatbot, ca.idchatbot, ca.idatendimento_chatbot_fila, ca.ie_tipo_encerramento, ca.dt_inicio,
      TIMESTAMPDIFF(second, coalesce(ca.dt_chamada, ca.dt_inicio), ca.dt_finalizacao) AS segundos_atendimento,
      TIMESTAMPDIFF(second, ca.dt_inicio, ca.dt_chamada) AS segundos_aguardando_fila,
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
      ) segundos_resposta_atendente,
      (SELECT round(AVG(diff)) AS media_diff
        FROM (
            SELECT idchat_mensagem, ie_tipo_mensagem, dt_insert,
                CASE WHEN ie_tipo_mensagem = 'R' AND LAG(ie_tipo_mensagem) OVER (ORDER BY dt_insert) != 'R'
                      THEN TIMESTAMPDIFF(SECOND, LAG(dt_insert) OVER (ORDER BY dt_insert), dt_insert)
                      ELSE NULL
                END AS diff
            FROM chat_mensagem
            WHERE chat_mensagem.idchat_atendimento = ca.idchat_atendimento
        )x
      ) segundos_resposta_cliente,
      (select TIMESTAMPDIFF(SECOND, ca.dt_chamada, x.dt_mensagem) seg_diff
       FROM (
            SELECT min(dt_insert) dt_mensagem
            FROM chat_mensagem
            WHERE chat_mensagem.idchat_atendimento = ca.idchat_atendimento
              and chat_mensagem.idusuario is not null
              and chat_mensagem.ie_tipo_mensagem = 'E'
              and chat_mensagem.status = 'A'
        )x
      ) segundos_primeira_resposta_atendente
FROM chat_atendimento ca
left join chatbot_canal on chatbot_canal.idchatbot_canal = ca.idchatbot_canal
left join atendimento_chatbot_fila on atendimento_chatbot_fila.idatendimento_chatbot_fila = ca.idatendimento_chatbot_fila
where ca.idchatbot = :idchatbot
  and ca.idusuario is not null
) x
where  (f_json_table(:idusuario, x.idusuario) is not null or :idusuario is null) 
    and (f_json_table(:ie_tipo_encerramento, x.ie_tipo_encerramento) is not null or :ie_tipo_encerramento is null)
    and date(x.dt_inicio) BETWEEN :dt_inicial AND :dt_final;