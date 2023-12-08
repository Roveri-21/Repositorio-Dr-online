SELECT
	cc.ds_nome as nm_contato,
	cc.nr_telefone as nr_contato
FROM
	chat_atendimento ca 
inner join contato_chatbot cc on
	cc.idcontato_chatbot = ca.idcontato_chatbot
CROSS JOIN json_table(ca.tags_atendimento, '$[*]' COLUMNS (cod varchar(50) PATH '$')) AS jt
where
	ca.idestabelecimento = 6
	and ca.idusuario is not null
	and ca.dt_inicio is not NULL 
	and ca.dt_finalizacao  is not null
	and jt.cod = '32'
	and ca.dt_chamada BETWEEN DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 7 DAY) and CURRENT_TIMESTAMP();