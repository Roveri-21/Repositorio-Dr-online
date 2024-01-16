SELECT
	*
from
	api_log al
where 
	al.dt_insert > NOW() - INTERVAL 4 MINUTE
	and al.tipo = 'erro'
order by al.idapi_log desc;