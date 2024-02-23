update crm_lead_tarefa t, crm_lead l 
  set t.dt_inicio = ADDDATE(t.dt_insert, INTERVAL 1 MINUTE), t.dt_fim = ADDDATE(t.dt_insert,INTERVAL  21 MINUTE), t.login_usuario = 'SystemPSSaude'
where    
    t.dt_inicio >= CURRENT_DATE()      
    and t.login_usuario not in ('lssilva', 'SystemPSSaude')
    and t.idcrm_lead = l.idcrm_lead
    and l.idcrm_origem_lead in ('328', '327', '325', '326', '324', '323', '27', '28', '59', '58', '78', '25', '31', '32', '50', '53', '49', '54', '114', '307', '37', '8', '26', '77')
    and f_json_table(l.idcrm_funil_marcador, 449) 
	and t.ie_tipo_tarefa = 4
	and t.ds_titulo ='Automação Funil'
	and DATE_FORMAT(dt_inicio, '%H:%i') = '15:47'
	and t.status = 'A';