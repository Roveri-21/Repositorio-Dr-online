select 
  count(s.idchat_mensagem) qtd_ativo,
  count(s.dt_erro) qtd_erro,
  count(s.idchat_mensagem) - count(s.dt_erro) qtd_entregue,
  count(s.dt_ativo_lido) qtd_lido,
  concat(coalesce(round((count(s.dt_ativo_lido)/ (count(s.idchat_mensagem)-count(s.dt_erro))) * 100, 2),0.0), ' %') perc_lido,  
  count(IF(s.dt_erro is not null ,null,s.dt_respo_mens)) qtd_respota,
  concat(coalesce(round((count(IF(s.dt_erro is not null ,null,s.dt_respo_mens)) / (count(s.idchat_mensagem)- count(s.dt_erro))) * 100, 2),0.0), ' %') perc_resp, 
  TIME_FORMAT(SEC_TO_TIME(avg(s.sec_interval_resp)),'%H:%i:%s') as media_tempo_respota
from (
select
	ccm.ds_descricao,
    cm.dt_insert,
    cm.idusuario,
    cm.idchat_atendimento,
    cm.idchat_mensagem,
    cm.dt_insert dt_ativo_envio,    
    cr.dt_insert dt_respo_citacao,
    TIMESTAMPDIFF(SECOND, cm.dt_insert, coalesce(cr.dt_insert,(select min(crsm.dt_insert) from chat_mensagem crsm 
        where
          crsm.idcontato_chatbot = cm.idcontato_chatbot 
          and crsm.dt_insert >= cm.dt_insert 
          and crsm.idchatbot = cm.idchatbot 
          and crsm.idchatbot_canal = cm.idchatbot_canal  
          and crsm.ie_tipo_mensagem = 'R'))) sec_interval_resp,
    (select min(crsm.dt_insert) from chat_mensagem crsm 
        where
          crsm.idcontato_chatbot = cm.idcontato_chatbot 
          and crsm.dt_insert >= cm.dt_insert 
          and crsm.idchatbot = cm.idchatbot 
          and crsm.idchatbot_canal = cm.idchatbot_canal  
          and crsm.ie_tipo_mensagem = 'R') as dt_respo_mens, -- (R)= mensagem recebida |684
       (select min(cmh.dt_insert) from chat_mensagem_hist cmh 
        where
          cmh.idchat_mensagem = cm.idchat_mensagem
          and cmh.ie_situacao = 'R' -- (R) = lida |682
          and cmh.status = 'A') as dt_ativo_lido,       
       (select min(cmh.dt_insert) from chat_mensagem_hist cmh 
        where
          cmh.idchat_mensagem = cm.idchat_mensagem
          and cmh.ie_situacao in ('F','W') -- (f)=erro ou (w)=problema  |682
          and cmh.status = 'A') as dt_erro
from
    chat_mensagem cm
    left join chat_mensagem cr on
    cr.cd_mensagem_resp = cm.cd_mensagem 
    INNER  join chat_atendimento ca on
    ca.idchat_atendimento  = cm.idchat_atendimento -- analisar 
    inner join chatbot_canal_modelo ccm on -- analisar
    ccm.idchatbot_canal_modelo = cm.idchatbot_canal_modelo 
where
	ca.idestabelecimento = {{:idestabelecimento}}
	and cm.ie_tipo_conteudo = 'AT'
    and cm.idchatbot = :idchatbot
    and cm.idusuario = :idusuario
    and date(cm.dt_insert) BETWEEN :dt_inicial AND :dt_final
) s;