SELECT 
 cl.idcrm_lead 
FROM crm_lead cl
inner JOIN crm_lead_mensagem clm on clm.idcrm_lead = cl.idcrm_lead 
  and clm.dt_insert BETWEEN DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 3 HOUR) and CURRENT_TIMESTAMP()
inner join notificacao_regra_pessoa nrp on
    nrp.idrelacionada  = clm.idcrm_lead_mensagem 
    and nrp.idnotificacao_regra_via = clm.idnotificacao_regra_via 
    and nrp.idnotificacao_regra_via_texto = clm.idnotificacao_regra_via_texto 
inner join pessoa_fisica_notificacao pfn on 
    pfn.idnotificacao_regra_pessoa = nrp.idnotificacao_regra_pessoa
    and pfn.idnotificacao_regra= nrp.idnotificacao_regra 
    and pfn.idnotificacao_regra = nrp.idnotificacao_regra 
    and pfn.idnotificacao_regra_via_texto = nrp.idnotificacao_regra_via_texto 
inner join chat_mensagem cm on cm.idchatbot = 1
    and cm.dt_insert BETWEEN DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 3 HOUR) and CURRENT_TIMESTAMP()
    and cm.idpessoa_fisica_notificacao is not null
    and cm.idpessoa_fisica_notificacao  = pfn.idpessoa_fisica_notificacao
    and cm.ie_tipo_conteudo = 'AT'
inner join chat_mensagem_hist cmh on cmh.idchat_mensagem = cm.idchat_mensagem and cmh.ie_situacao in ('W','F')
WHERE 
  cl.idcrm_funil = 1
  and cl.status = 'A'
  and f_json_table(cl.idcrm_funil_marcador,451) is null
union  
select 
  ca.idcrm_lead 
from chat_atendimento ca
inner join crm_lead cl on cl.idcrm_lead = ca.idcrm_lead 
  and cl.status = 'A' 
  and cl.idcrm_funil = 1
  and f_json_table(cl.idcrm_funil_marcador,451) is null
 inner join chat_mensagem cm on cm.idchat_atendimento = ca.idchat_atendimento 
        and cm.dt_insert BETWEEN DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 3 HOUR) and CURRENT_TIMESTAMP()
        and cm.idchatbot = 1
        and cm.ie_tipo_conteudo = 'AT'
 inner join chat_mensagem_hist cmh on cmh.idchat_mensagem = cm.idchat_mensagem and cmh.ie_situacao in ('W','F')
 where ca.idchatbot = 1;









 -- update para adicionar o marcador nas leads que possuem erro ao enviar o ativo
 UPDATE crm_lead
SET idcrm_funil_marcador = JSON_ARRAY_APPEND(COALESCE(idcrm_funil_marcador, '[]'), '$', CAST('451' AS JSON)),
dt_evento = CURRENT_TIMESTAMP()  
WHERE idcrm_lead = :idcrm_lead;