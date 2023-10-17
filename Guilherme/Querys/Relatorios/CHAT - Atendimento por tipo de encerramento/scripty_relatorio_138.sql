SELECT	
  acf.idatendimento_chatbot_fila as id,
  acf.ds_fila as descricao
from 
  atendimento_chatbot_fila acf
where 
  acf.idatendimento_chatbot = :idatendimento_chatbot