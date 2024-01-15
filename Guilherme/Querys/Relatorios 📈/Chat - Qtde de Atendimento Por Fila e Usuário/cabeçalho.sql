SELECT
    ue.idestabelecimento,
    e.ds_estabelecimento,
    e.url_logo,
    concat(DATE_FORMAT(DATE(:dt_inicial), '%d/%m/%Y'), ' até ', DATE_FORMAT(DATE(:dt_final), '%d/%m/%Y')) ds_data,
    DATE_FORMAT(DATE(:dt_inicial), '%d/%m/%Y') AS dt_inicial,
    DATE_FORMAT(DATE(:dt_final), '%d/%m/%Y') AS dt_final
FROM
    usuario u
INNER JOIN usuario_estab ue ON
    u.idusuario = ue.idusuario
INNER JOIN estabelecimento e ON
    ue.idestabelecimento = e.idestabelecimento
WHERE
    ue.idestabelecimento = {{:idestabelecimento}}
GROUP BY 
    ue.idestabelecimento;