select
  x.ds_descricao,
  x.idusuario,   
  DATE_FORMAT(date (x.dt_insert) ,'%d/%m/%Y') as dt_ativo_envio, 
  count(x.idchat_mensagem) qtd_ativo,
  count(x.dt_erro) qtd_erro,
  count(x.idchat_mensagem) - count(x.dt_erro) qtd_entregue,
  count(x.dt_ativo_lido) qtd_lido,
  concat(coalesce(round((count(x.dt_ativo_lido)/  (count(x.idchat_mensagem) - count(x.dt_erro))) * 100, 2),0.0), ' %') perc_lido, 
  TIME_FORMAT(SEC_TO_TIME(coalesce(avg(x.sec_interval_leitura),0)),'%H:%i:%s') media_tempo_leitura,
  count(IF(x.dt_erro is not null ,null,x.dt_respo_mens))qtd_respota,
  concat(coalesce(round((count(IF(x.dt_erro is not null ,null,x.dt_respo_mens)) / ( count(x.idchat_mensagem) - count(x.dt_erro))) * 100, 2),0.0), ' %') perc_resp, 
  TIME_FORMAT(SEC_TO_TIME(avg(x.sec_interval_resp)),'%H:%i:%s') media_tempo_respota     
from (     
select
    ccm.ds_descricao,
    date(cm.dt_insert) dt_insert,
    cm.idusuario,
    cm.idchat_atendimento,
    cm.idchat_mensagem,
    cm.dt_insert dt_ativo_envio,    
    cr.dt_insert dt_respo_citacao,
    TIMESTAMPDIFF(SECOND, cm.dt_insert, COALESCE(coalesce(cr.dt_insert, (select min(crsm.dt_insert) from chat_mensagem crsm 
        where
          crsm.idcontato_chatbot = cm.idcontato_chatbot 
          and crsm.dt_insert >= cm.dt_insert 
          and crsm.idchatbot = cm.idchatbot 
          and crsm.idchatbot_canal = cm.idchatbot_canal  
          and crsm.ie_tipo_mensagem = 'R')),0)) sec_interval_resp,
     TIMESTAMPDIFF(SECOND, cm.dt_insert, (select min(cmh.dt_insert) from chat_mensagem_hist cmh 
        where
          cmh.idchat_mensagem = cm.idchat_mensagem
          and cmh.ie_situacao = 'R' -- (R) = lida |682
          and cmh.status = 'A')) sec_interval_leitura,
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
    and date(cm.dt_insert) BETWEEN :dt_inicial AND :dt_final
    and cm.idusuario = :idusuario
) x
group by x.ds_descricao, x.idusuario,DATE_FORMAT(date (x.dt_insert) ,'%d/%m/%Y')
order by date (x.dt_insert) DESC , x.ds_descricao;