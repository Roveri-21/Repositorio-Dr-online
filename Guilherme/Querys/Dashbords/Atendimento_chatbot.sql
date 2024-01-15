select 
  ac.idestabelecimento, 
  pf.nm_pessoa nome, 
  coalesce(x.situacao, 'Off-line') situacao, 
  group_concat(acf.ds_fila order by acf.ds_fila separator ', ') ds_fila
from atendimento_chatbot ac 
inner join atendimento_chatbot_fila acf on acf.idatendimento_chatbot = ac.idatendimento_chatbot 
  and acf.status = 'A'
inner join atendimento_chatbot_fila_usuario acfu on acfu.idatendimento_chatbot_fila = acf.idatendimento_chatbot_fila 
  and acfu.status = 'A'
inner join usuario u on u.idusuario = acfu.idusuario 
  and u.status = 'A'
left join pessoa_fisica pf on pf.idpessoa_fisica = u.idpessoa_fisica
left join (select 
              ss.idsocket_sessao, at2.idusuario, f_valor_iddominio(686, ss.ie_situacao_socket) situacao
            from api_token at2
            inner join socket_sessao ss on ss.idapi_token = at2.idapi_token
              and ss.ie_tipo_sessao = 'T'
              and ss.status = 'A'
            where at2.idestabelecimento = {{:idestabelecimento}}) x on x.idusuario = acfu.idusuario
where ac.idestabelecimento = {{:idestabelecimento}}
  and ac.status = 'A'
group by 1,2,3
order by 3 desc, 2 asc