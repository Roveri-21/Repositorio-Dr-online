select
    CONCAT('QTD.Atend: ', count(x.id))as id,
    TIME_FORMAT(sec_to_time(avg(x.media_TME)), "%H:%i:%s") media_TME,
    TIME_FORMAT(sec_to_time(avg(x.media_TMA)), "%H:%i:%s") media_TMA
from
    (
    select
        ca.idchat_atendimento as id ,
        TIMESTAMPDIFF(SECOND,ca.dt_inicio,COALESCE(ca.dt_chamada,ca.dt_finalizacao)) as media_TME,
        TIMESTAMPDIFF(SECOND,ca.dt_chamada,ca.dt_finalizacao) as media_TMA
    from
        chat_atendimento ca
    INNER JOIN usuario u ON
        u.idusuario = ca.idusuario
    INNER JOIN pessoa_fisica pf ON
        pf.idpessoa_fisica = u.idpessoa_fisica
    where
        ca.idestabelecimento = {{:idestabelecimento}}
        AND DATE(ca.dt_inicio) BETWEEN :dt_inicial AND :dt_final        
        AND pf.idpessoa_fisica = :idpessoa_fisica) x;