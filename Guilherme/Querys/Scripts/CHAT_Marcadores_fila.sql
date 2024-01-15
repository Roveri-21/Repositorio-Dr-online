select
	am.idatendimento_marcador as id,
	am.ds_marcador as descricao
from
	atendimento_chatbot_bot acb
left join atendimento_marcador am on
	am.idatendimento_chatbot = acb.idatendimento_chatbot 
where
	acb.idchatbot =:idchatbot
	and acb.status = 'A'
	and am.status = 'A';