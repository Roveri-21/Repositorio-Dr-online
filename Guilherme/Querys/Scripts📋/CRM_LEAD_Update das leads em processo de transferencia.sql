update crm_lead l, crm_lead_tarefa t
set l.login = 'lssilva', l.dt_evento = CURRENT_TIMESTAMP(), l.dt_update = CURRENT_TIMESTAMP(), t.status = 'I'   
where
  l.idcrm_lead = :idcrm_lead;