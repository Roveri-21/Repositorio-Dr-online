-- A função json_overlaps serve para adicionar um varios valores sem usar a função json
-- vc consegue trazer varios valores informado de uma vez

-- parametros pode ser usado assim '[ "117"]' ou '[ "117","126"]'


-- exemplo de uso 

select 
    ds_marcadores, 
    count(idchat_atendimento), 
    TIME_FORMAT(SEC_TO_TIME(avg(segundos_atendimento)), '%H:%i:%s')Tempo_medio_atendimento
from (        
    SELECT
        (select group_concat(am.ds_marcador order by am.ds_marcador separator ', ')
            from atendimento_marcador am
            where am.idatendimento_marcador in (
                (select j.id from json_table(coalesce(ca.tags_atendimento,'[]'), '$[*]' columns (id int path '$'))j)
            )
        ) as ds_marcadores,
    ca.tags_atendimento,
    ca.idchat_atendimento,
    TIMESTAMPDIFF(second, COALESCE(ca.dt_chamada, ca.dt_inicio), ca.dt_finalizacao) segundos_atendimento
    from
        chat_atendimento ca
    inner join atendimento_chatbot_fila acf on acf.idatendimento_chatbot_fila = ca.idatendimento_chatbot_fila
    where
        ca.idusuario is not null
        and ca.idchatbot =:idchatbot
        and ca.dt_chamada is not null
        and ca.dt_finalizacao is not null 
        and (f_json_table(:ie_tipo_encerramento, ca.ie_tipo_encerramento) is not null or :ie_tipo_encerramento is null)
        and date(ca.dt_inicio) BETWEEN :dt_inicial AND :dt_final
        and ca.idestabelecimento = {{:idestabelecimento}}
        and (f_json_table(:idatendimento_chatbot_fila, acf.idatendimento_chatbot_fila) or :idatendimento_chatbot_fila is null)
        and (json_overlaps(ca.tags_atendimento, :tags_atendimento) or :tags_atendimento is null)      -- uso da função  
    ) x
group by ds_marcadores 
order by count(idchat_atendimento) desc;



