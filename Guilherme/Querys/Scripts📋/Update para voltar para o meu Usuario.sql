update crm_lead l
set l.login = 'lssilva', l.dt_evento = CURRENT_TIMESTAMP(), l.dt_update = CURRENT_TIMESTAMP()   
where
  l.idcrm_lead = :idcrm_lead;