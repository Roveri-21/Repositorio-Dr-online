select 
        acf.idatendimento_chatbot_fila,
	CONCAT('Id: ', acf.idatendimento_chatbot_fila, ' Fila: ', acf.ds_fila) as ds_id_fila
from atendimento_chatbot_fila acf
where
	acf.idatendimento_chatbot = :atendimentochatbot
	and (f_json_table(:idatendimento_chatbot_fila, acf.idatendimento_chatbot_fila) or coalesce(:idatendimento_chatbot_fila,'') = '')
order by 2;