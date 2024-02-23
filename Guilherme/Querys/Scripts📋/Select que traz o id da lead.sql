SELECT
DISTINCT 
    cl.idcrm_lead,
    TIMESTAMPDIFF(day,cl.dt_evento,CURRENT_TIMESTAMP()) tempo_na_etapa
from
    crm_lead cl
    inner join crm_lead_historico clh on clh.idcrm_lead = cl.idcrm_lead and clh.login_hist = 'SystemPSSaude' and date(clh.dt_historico) = CURRENT_DATE()
WHERE    
    cl.idcrm_funil_etapa = 23
    and cl.status = 'A'
    and cl.login <> 'lssilva'    
    and TIMESTAMPDIFF(day, cl.dt_evento, CURRENT_TIMESTAMP()) > 4
order by cl.idcrm_lead desc;