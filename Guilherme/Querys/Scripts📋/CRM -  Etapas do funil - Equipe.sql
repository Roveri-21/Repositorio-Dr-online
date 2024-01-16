SELECT
	cfe.idcrm_funil_etapa as id, 
	cfe.ds_etapa as descricao
from
	crm_funil_participante cfp
inner join crm_funil cf on
	cf.idcrm_funil = cfp.idcrm_funil
inner join crm_funil_etapa cfe on
	cfe.idcrm_funil = cf.idcrm_funil and cfe.status ='A'
WHERE 
	cfp.idcrm_equipe in (
select j.code
                    from json_table(
                      :idcrm_equipe,
                      '$[*]' columns (code int path '$')
                    )j
)
ORDER by cfe.nr_sequencia ASC;