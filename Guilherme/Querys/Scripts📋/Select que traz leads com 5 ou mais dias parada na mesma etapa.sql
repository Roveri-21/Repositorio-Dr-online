SELECT
    cl.idcrm_lead,
	TIMESTAMPDIFF(day,cl.dt_evento,CURRENT_TIMESTAMP()) tempo_na_etapa
from
	crm_lead cl
WHERE
	cl.idcrm_funil_etapa = 23
	and cl.status = 'A'
	and cl.login <> 'lssilva'
	and cl.idcrm_origem_lead in ('328', '327', '325', '326', '324', '323', '27', '28', '59', '58', '78', '25', '31', '32', '50', '53', '49', '54', '114', '307', '37', '8', '26', '77') 
	and TIMESTAMPDIFF(day,cl.dt_evento,CURRENT_TIMESTAMP()) > 4
order by cl.idcrm_lead desc;