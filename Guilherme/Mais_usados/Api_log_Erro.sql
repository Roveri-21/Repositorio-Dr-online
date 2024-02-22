SELECT -- busca os ultimos 4 minutos dos logs 
	*
from
	api_log al
where 
	al.dt_insert > NOW() - INTERVAL 4 MINUTE
	and al.tipo = 'erro'
order by al.idapi_log desc;

-- ////////////////////
SELECT -- traz as ultimas gravações na api que estão fazendo criação de leads, usamos isso para analisar se um site esta enviando algo para nossa api 
	*
FROM
	api_log al
WHERE
	al.dt_insert >= CURRENT_DATE()
	and al.url like 'POST:/crmLeadIntegracao/%'
-- 	AND al.tipo = 'utilizacao'
ORDER by al.idapi_log desc;	

