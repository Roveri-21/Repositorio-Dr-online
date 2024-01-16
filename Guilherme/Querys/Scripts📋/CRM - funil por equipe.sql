SELECT
	DISTINCT 
	cf.idcrm_funil as id,
	cf.ds_funil as descricao
FROM
	crm_equipe ce
inner join crm_funil_participante cfp on
	cfp.idcrm_equipe = ce.idcrm_equipe
	and cfp.status = 'A'
inner JOIN crm_funil cf on
	cf.idcrm_funil = cfp.idcrm_funil
	and cf.status = 'A'
inner join crm_funil_etapa cfe on
	cfe.idcrm_funil = cf.idcrm_funil
	and cfe.status = 'A'
WHERE 
	ce.idcrm_equipe in (
select j.code
                    from json_table(
                      :idcrm_equipe,
                      '$[*]' columns (code int path '$')
                    )j
)
	and ce.idestabelecimento = {{:idestabelecimento}}
	and ce.status = 'A'
ORDER BY
	cfe.nr_sequencia ASC;