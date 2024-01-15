select
  DISTINCT 
  cm.idusuario,
  pf2.nm_pessoa
from
    chat_mensagem cm
    left join chat_mensagem cr on
    cr.cd_mensagem_resp = cm.cd_mensagem 
    INNER  join chat_atendimento ca on
    ca.idchat_atendimento  = cm.idchat_atendimento -- analisar 
    inner join chatbot_canal_modelo ccm on -- analisar
    ccm.idchatbot_canal_modelo = cm.idchatbot_canal_modelo 
    inner join usuario u on u.idusuario = cm.idusuario
    inner join pessoa_fisica pf2 on pf2.idpessoa_fisica = u.idpessoa_fisica
where
    ca.idestabelecimento = {{:idestabelecimento}}
    and cm.ie_tipo_conteudo = 'AT'
    and cm.idchatbot = :idchatbot
    and date(cm.dt_insert) BETWEEN :dt_inicial AND :dt_final
    and cm.idusuario in (select ue.idusuario from usuario_estab ue where ue.idestabelecimento = {{:idestabelecimento}})
ORDER by pf2.nm_pessoa asc;