select 
	f_usuario_dados(ca.idusuario, 'NC')as idusuario,
	ca.idchat_atendimento,
	ca.idcontato_chatbot,
	ca.idchatbot,
	ca.idatendimento_chatbot_fila,
	ca.ie_tipo_encerramento,
	ca.dt_inicio,
	TIMESTAMPDIFF(second, coalesce(ca.dt_chamada, ca.dt_inicio), ca.dt_finalizacao) AS segundos_atendimento,
    TIMESTAMPDIFF(second, ca.dt_inicio,coalesce(ca.dt_chamada,dt_finalizacao)) AS segundos_aguardando_fila,
    (
    	SELECT 
    		round(AVG(diff)) AS media_diff
     	FROM 
	     	(
	        	SELECT 
	        		idchat_mensagem,
	        		ie_tipo_mensagem,
	        		dt_insert,
	                CASE WHEN ie_tipo_mensagem = 'E' AND LAG(ie_tipo_mensagem) OVER (ORDER BY dt_insert) != 'E'
	                      THEN TIMESTAMPDIFF(SECOND, LAG(dt_insert) OVER (ORDER BY dt_insert), dt_insert)
	                      ELSE NULL
	                END AS diff
	            FROM 
	            	chat_mensagem
	            WHERE
	            	chat_mensagem.idchat_atendimento = ca.idchat_atendimento
	        )x
    ) as segundos_resposta_atendente,
    (
    	SELECT 
    		round(AVG(diff)) AS media_diff
        FROM
        	(
	            SELECT 
	            	idchat_mensagem,
	            	ie_tipo_mensagem,
	            	dt_insert,
	                CASE WHEN ie_tipo_mensagem = 'R' AND LAG(ie_tipo_mensagem) OVER (ORDER BY dt_insert) != 'R'
	                      THEN TIMESTAMPDIFF(SECOND, LAG(dt_insert) OVER (ORDER BY dt_insert), dt_insert)
	                      ELSE NULL
	                END AS diff
	            FROM 
	            	chat_mensagem
	            WHERE
	            	chat_mensagem.idchat_atendimento = ca.idchat_atendimento
        	)x
    ) as segundos_resposta_cliente,
    (
    	select 
    		TIMESTAMPDIFF(SECOND,ca.dt_chamada,x.dt_mensagem) seg_diff
        FROM 
        	(
	            SELECT min(dt_insert) dt_mensagem
	            FROM chat_mensagem
	            WHERE chat_mensagem.idchat_atendimento = ca.idchat_atendimento
	              and chat_mensagem.idusuario is not null
	              and chat_mensagem.ie_tipo_mensagem = 'E'
	              and chat_mensagem.status = 'A'
	              and chat_mensagem.dt_insert >= ca.dt_chamada
        	)x
    ) as segundos_primeira_resposta_atendente
FROM
	chat_atendimento ca
left join chatbot_canal on
	chatbot_canal.idchatbot_canal = ca.idchatbot_canal
left join atendimento_chatbot_fila on
	atendimento_chatbot_fila.idatendimento_chatbot_fila = ca.idatendimento_chatbot_fila
where 
	ca.idestabelecimento = :idestabelecimento
	and (f_json_table(:idatendimento_chatbot_fila,atendimento_chatbot_fila.idatendimento_chatbot_fila) or :idatendimento_chatbot_fila is null)
  	and ca.idusuario is not null
 GROUP by ca.idusuario;