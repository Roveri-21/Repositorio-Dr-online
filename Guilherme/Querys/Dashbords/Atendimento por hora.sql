SELECT 
	ca.idchat_atendimento,
	ca.idestabelecimento,
	ca.dt_inicio,
    TIME_FORMAT(ca.dt_inicio, '%H')as horas_atendemento,
    ca.idatendimento_chatbot_fila, 
    acf.ds_fila 
from 
	chat_atendimento ca
inner join atendimento_chatbot_fila acf on
	acf.idatendimento_chatbot_fila = ca.idatendimento_chatbot_fila 
where 
	ca.dt_finalizacao is not NULL
	and ca.dt_inicio is not NULL
	and ca.dt_chamada is not NULL
order by 4 asc;