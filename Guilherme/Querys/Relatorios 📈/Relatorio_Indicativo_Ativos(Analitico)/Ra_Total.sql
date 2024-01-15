-- total
SELECT 
	SUM(z.qtd_ativo) as qtd_ativo,
	SUM(z.qtd_erro) as qtd_erro,
	SUM(z.qtd_entregue) as qtd_entregue,
	SUM(z.qtd_lido) as qtd_lido,
	SUM(z.qtd_respota) as qtd_respota
from(
select
   y.idusuario,   
-- f_primeiro_nome(pf.nm_pessoa) atendente,
   pf.nm_pessoa,
  count(y.idchat_mensagem) qtd_ativo,
  count(y.dt_erro) qtd_erro,
  count(y.idchat_mensagem) - count(y.dt_erro) qtd_entregue,
  count(y.dt_ativo_lido) qtd_lido,
  concat(coalesce(round((count(y.dt_ativo_lido) / (count(y.idchat_mensagem) - count(y.dt_erro))) * 100, 2),0.0), ' %') perc_lido,  
  TIME_FORMAT(SEC_TO_TIME(coalesce(avg(y.sec_interval_leitura),0)),'%H:%i:%s') media_tempo_leitura,
  count(y.dt_respo_mens) qtd_respota,
  concat(coalesce(round((count(y.dt_respo_mens) / (count(y.idchat_mensagem) - count(y.dt_erro))) * 100, 2),0.0), ' %') perc_resp,
  TIME_FORMAT(SEC_TO_TIME(coalesce(avg(y.sec_interval_resp),0)),'%H:%i:%s') media_tempo_respota  
from (select
  x.*, 
  CASE
    WHEN TIMESTAMPDIFF(HOUR,
    x.dt_ativo_envio,
     coalesce(x.dt_respo_citacao, x.dt_respo_mens)) >= 24 THEN
        CONCAT(
            TIMESTAMPDIFF(DAY, x.dt_ativo_envio, coalesce(x.dt_respo_citacao, x.dt_respo_mens)),
            ' dia(s) ',
            MOD(TIMESTAMPDIFF(HOUR, x.dt_ativo_envio, coalesce(x.dt_respo_citacao, x.dt_respo_mens)), 24),
            ' hora(s)'
        )
    ELSE
        TIME_FORMAT(SEC_TO_TIME(TIMESTAMPDIFF(SECOND, x.dt_ativo_envio, coalesce(x.dt_respo_citacao, x.dt_respo_mens))), '%H:%i:%s')
   END AS TMR, 
   TIMESTAMPDIFF(SECOND, x.dt_ativo_envio, coalesce(x.dt_respo_citacao, x.dt_respo_mens)) sec_interval_resp,
   TIMESTAMPDIFF(SECOND, x.dt_ativo_envio, x.dt_ativo_lido) sec_interval_leitura
from (     
select
    cm.idusuario,
    cm.idchat_atendimento,
    cm.idchat_mensagem,
    cm.dt_insert dt_ativo_envio,    
    cr.dt_insert dt_respo_citacao,
    (select min(crsm.dt_insert) from chat_mensagem crsm 
        where
          crsm.idcontato_chatbot = cm.idcontato_chatbot 
          and crsm.dt_insert >= cm.dt_insert 
          and crsm.idchatbot = cm.idchatbot 
          and crsm.idchatbot_canal = cm.idchatbot_canal  
          and crsm.ie_tipo_mensagem = 'R') as dt_respo_mens,
       (select min(cmh.dt_insert) from chat_mensagem_hist cmh 
        where
          cmh.idchat_mensagem = cm.idchat_mensagem
          and cmh.ie_situacao = 'R'
          and cmh.status = 'A') as dt_ativo_lido,       
       (select min(cmh.dt_insert) from chat_mensagem_hist cmh 
        where
          cmh.idchat_mensagem = cm.idchat_mensagem
          and cmh.ie_situacao in ('F','W')
          and cmh.status = 'A') as dt_erro
from
    chat_mensagem cm
    left join chat_mensagem cr on cr.cd_mensagem_resp = cm.cd_mensagem 
    INNER  join chat_atendimento ca on ca.idchat_atendimento  = cm.idchat_atendimento 
where
	ca.idestabelecimento = {{:idestabelecimento}}
 	and cm.ie_tipo_conteudo = 'AT'
    and cm.idchatbot = :idchatbot
    and date(cm.dt_insert) BETWEEN :dt_inicial AND :dt_final
order by cm.idchat_mensagem desc
) x) y
left join usuario u on u.idusuario = y.idusuario
left join pessoa_fisica pf on pf.idpessoa_fisica = u.idpessoa_fisica
group by y.idusuario
order by y.idusuario) z;


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
       and date(cm.dt_insert) BETWEEN :dt_inicial AND :dt_final
      and cm.idusuario in (select ue.idusuario from usuario_estab ue where ue.idestabelecimento = {{:idestabelecimento}})
) s;