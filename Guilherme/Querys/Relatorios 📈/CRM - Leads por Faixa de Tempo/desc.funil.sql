SELECT
	CONCAT(cf.idcrm_funil ,' - ' ,cf.ds_funil) as funil
from
	crm_funil cf  
where 
	 cf.idcrm_funil = :idcrm_funil;