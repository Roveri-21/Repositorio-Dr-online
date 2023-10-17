select 
	ca.idusuario,
	pf.nm_pessoa,
	sum(if(ca.ie_tipo_encerramento = 'A', 1, 0)) as atendido,
	sum(if(ca.ie_tipo_encerramento = 'F', 1, 0)) as transferencia,
	sum(if(ca.ie_tipo_encerramento = 'U', 1, 0)) as cliente_finalizou,
	sum(if(ca.ie_tipo_encerramento = 'T', 1, 0)) as inatividade,
	sum(if(ca.ie_tipo_encerramento = 'S', 1, 0)) as supervisao,
	sum(if(ca.ie_tipo_encerramento = 'E', 1, 0)) as expirado,
	sum(if(ca.ie_tipo_encerramento = 'N', 1, 0)) as transicao,
	sum(if(ca.ie_tipo_encerramento = 'R', 1, 0)) as erro,
	count(ca.idchat_atendimento) as total
from
	chat_atendimento ca
inner join atendimento_chatbot_fila acf on
	acf.idatendimento_chatbot_fila = ca.idatendimento_chatbot_fila
inner join atendimento_chatbot ac on
	ac.idatendimento_chatbot = acf.idatendimento_chatbot
left join usuario u on
	u.idusuario = ca.idusuario
left join pessoa_fisica pf on
	pf.idpessoa_fisica = u.idpessoa_fisica
where
	ac.idatendimento_chatbot = :atendimentochatbot
	and ca.dt_finalizacao is not null
	and ca.idusuario is not null
	and DATE(ca.dt_finalizacao) BETWEEN  :dt_inicial  and :dt_final 
	and ca.idatendimento_chatbot_fila = :idatendimento_chatbot_fila
group by
	1,
	2
order by
	3 desc;