select 
  concat(c.idchatbot,' - ', c.ds_chatbot) ds_chatbot,
  coalesce((select GROUP_CONCAT(dv.ds_dominio_valor order by dv.ds_dominio_valor separator ', ') from dominio_valor dv
    inner join (select id
     from json_table(
              :ie_tipo_encerramento,
              '$[*]' columns (id varchar(255) path '$')
            ) j) x on x.id = dv.vl_dominio 
    where iddominio = 692), 'Todos') ds_tipo_encerramento
from chatbot c 
where c.idchatbot = :idchatbot