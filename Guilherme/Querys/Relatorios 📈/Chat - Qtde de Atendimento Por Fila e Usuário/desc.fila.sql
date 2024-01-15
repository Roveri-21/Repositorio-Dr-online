SELECT 
  ca.idatendimento_chatbot_fila,
    concat(ca.idatendimento_chatbot_fila, ' - ', acf.ds_fila) ds_fila
from
    chat_atendimento ca  
inner join atendimento_chatbot_fila acf on
	acf.idatendimento_chatbot_fila =ca.idatendimento_chatbot_fila 
where ca.idchatbot = :idchatbot
  and date(ca.dt_inicio) BETWEEN :dt_inicial AND :dt_final
  and (f_json_table(:idatendimento_chatbot_fila, ca.idatendimento_chatbot_fila) or :idatendimento_chatbot_fila is null)
  and (f_json_table(:idusuario, ca.idusuario) is not null or :idusuario is null)
  and (f_json_table(:ie_tipo_encerramento, ca.ie_tipo_encerramento) is not null or :ie_tipo_encerramento is null) 
 GROUP BY ca.idatendimento_chatbot_fila;