update crm_lead_tarefa t, crm_lead l
  set l.idcrm_funil_marcador = JSON_REMOVE(COALESCE(idcrm_funil_marcador, '[]'), JSON_UNQUOTE(JSON_SEARCH(idcrm_funil_marcador, 'one', '449'))),
  t.status = 'I'
where    
    t.dt_inicio >= CURRENT_DATE()      
    and t.login_usuario in ('SystemPSSaude')
    and t.idcrm_lead = l.idcrm_lead
    and l.idcrm_origem_lead in ('328', '327', '325', '326', '324', '323', '27', '28', '59', '58', '78', '25', '31', '32', '50', '53', '49', '54', '114', '307', '37', '8', '26', '77')
    and f_json_table(l.idcrm_funil_marcador, 447) 
	and t.ie_tipo_tarefa = 4
	and t.ds_titulo ='Automação Funil'	
	and t.status = 'A';