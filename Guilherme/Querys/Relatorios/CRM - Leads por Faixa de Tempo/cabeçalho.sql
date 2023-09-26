SELECT
    ue.idestabelecimento,
    e.ds_estabelecimento,
    e.url_logo,
    DATE_FORMAT(DATE(:dt_inicial), '%d/%m/%Y') AS dt_inicial,
    DATE_FORMAT(DATE(:dt_final), '%d/%m/%Y') AS dt_final
FROM
    usuario u
INNER JOIN pessoa_fisica pf ON
    pf.idpessoa_fisica = u.idpessoa_fisica
INNER JOIN usuario_estab ue ON
    u.idusuario = ue.idusuario
INNER JOIN crm_funil cf on
	cf.idcrm_funil = ue.idcrm_funil_padrao 
INNER JOIN estabelecimento e ON
    ue.idestabelecimento = e.idestabelecimento
WHERE
    ue.idestabelecimento = {{:idestabelecimento}}
    and cf.idcrm_funil = :idcrm_funil
GROUP BY 
    ue.idestabelecimento;