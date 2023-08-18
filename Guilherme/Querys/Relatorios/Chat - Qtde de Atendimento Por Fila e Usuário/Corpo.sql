SELECT
x.login,
COUNT(x.QTd_Atendimento)as QTd_Atendimento,
COUNT(DISTINCT x.idcontato_chatbot)as Qtd_Pessoa,
ROUND(AVG(x.tempo_min_espera)) as tempo_min_espera,
ROUND(AVG(x.tempo_min_atendimento))as tempo_min_atendimento
FROM (SELECT
    f_usuario_dados(idusuario,'NC')as login, 
    ca.idusuario,
    (idchat_atendimento)as QTd_Atendimento,
    f_valor_iddominio(692, ie_tipo_encerramento)as ds_tipo_encerramento,
    TIMESTAMPDIFF(minute, dt_inicio, coalesce(dt_finalizacao, ca.dt_chamada))as tempo_min_espera,
    TIMESTAMPDIFF(minute, dt_chamada, dt_finalizacao)as tempo_min_atendimento,
    ca.dt_inicio,
    ca.dt_chamada,
    ca.dt_finalizacao,
    ca.idchatbot,
    ca.idcontato_chatbot,
    ie_tipo_encerramento
from
    chat_atendimento ca
left join atendimento_chatbot_fila acf on acf.idatendimento_chatbot_fila = ca.idatendimento_chatbot_fila 
where ca.idchatbot = :idchatbot  
  and date(ca.dt_inicio) BETWEEN :dt_inicial AND :dt_final
  and ca.idestabelecimento = :idestabelecimento
  and ca.idatendimento_chatbot_fila is not null or COALESCE(:idatendimento_chatbot_fila,'')
  and (f_json_table(:idusuario, ca.idusuario) is not null or coalesce(:idusuario,'') = '')
  and (f_json_table(:ie_tipo_encerramento, ca.ie_tipo_encerramento) is not null or coalesce(:ie_tipo_encerramento,'') = '')
--   and ca.idatendimento_chatbot_fila =:idatendimento_chatbot_fila
) x
GROUP by x.login;