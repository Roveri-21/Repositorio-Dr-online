SELECT
	cfe.idcrm_funil_etapa as id,
	cfe.ds_etapa as descricao
from
	crm_funil_etapa cfe 
WHERE
	cfe.idcrm_funil = :idcrm_funil
	and cfe.status = 'A';