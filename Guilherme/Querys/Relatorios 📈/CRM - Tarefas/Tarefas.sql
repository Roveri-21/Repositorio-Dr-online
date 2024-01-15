select distinct
	clt.idcrm_lead_tarefa,
	DATE_FORMAT(clt.dt_inicio,'%d/%m/%Y %H:%i') dt_tarefa,
	clt.ds_titulo titulo_tarefa,
	f_valor_iddominio(613,clt.ie_tipo_tarefa) tipo_tarefa,
	clt.ds_observacao obs_tarefa,
	DATE_FORMAT(dt_execucao,'%d/%m/%Y %H:%i') dt_execucao,
	if(clt.dt_execucao is not null,'S','N') ie_execucao,
	f_valor_iddominio(649,clt.ie_resultado) ie_sucesso
from crm_lead_tarefa clt 
		inner join crm_lead cl on cl.idcrm_lead = clt.idcrm_lead
where 
	COALESCE(:p_idcrm_lead, clt.idcrm_lead) = clt.idcrm_lead  
	and ((:tipo_tarefa = 'T' and DATE_FORMAT(clt.dt_inicio,'%Y-%m-%d') between :dt_inicial and :dt_final) or
			(:tipo_tarefa = 'A' and DATE_FORMAT(clt.dt_inicio,'%Y-%m-%d') < DATE_FORMAT(SYSDATE(),'%Y-%m-%d') and clt.dt_execucao is null) or 
			(:tipo_tarefa = 'F' and DATE_FORMAT(clt.dt_inicio,'%Y-%m-%d') > DATE_FORMAT(SYSDATE(),'%Y-%m-%d') and clt.dt_execucao is null) OR
			(:tipo_tarefa = 'T' and :dt_inicial is null and :dt_final is null))  
	-- and (cl.login = :login_usuario or :login_usuario is null)
	and clt.status = 'A'
order by 1,3;