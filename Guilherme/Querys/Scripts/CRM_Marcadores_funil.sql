SELECT
	cfm.idcrm_funil_marcador as id,
	cfm.ds_marcador as descricao 
from
	crm_funil_marcador cfm
WHERE 
	cfm.idcrm_funil= :idcrm_funil
	and cfm.status ='A'
ORDER by cfm.idcrm_funil_marcador asc;