update crm_lead_tarefa t, crm_lead l 
set t.status = 'I', l.idcrm_funil_marcador = '[]'
where    
    t.dt_inicio >= CURRENT_DATE()      
    and t.login_usuario not in ('lssilva', 'SystemPSSaude')
    and t.idcrm_lead = l.idcrm_lead
    and l.idcrm_origem_lead not in ('328', '327', '325', '326', '324', '323', '27', '28', '59', '58', '78', '25', '31', '32', '50', '53', '49', '54', '114', '307', '37', '8', '26', '77')
    and f_json_table(l.idcrm_funil_marcador, 449) 
	and t.ie_tipo_tarefa = 4
	and t.ds_titulo ='Automação Funil'
	and DATE_FORMAT(dt_inicio, '%H:%i') = '15:47'
	and t.status = 'A'