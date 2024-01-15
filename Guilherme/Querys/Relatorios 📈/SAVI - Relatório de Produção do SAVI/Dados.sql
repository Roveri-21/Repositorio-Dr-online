SELECT
	DATE_FORMAT(DATE(tac.dt_execucao),'%d/%m/%Y')as dt_execucao,
	tac.nr_cartao_ps,
	tac.nm_paciente as usuario, 
	tac.nm_medico as Medico,
	tac.cd_procedimento,
	tac.ds_procedimento, 
	IF((tac.ie_urgencia) = 'T', null,tac.ie_urgencia) as urgencia,
	tac.qtd_autorizado,
	tac.qtd_realizado,
	tac.dt_autorizacao,
	tac.nr_guia,
	tac.ds_senha as senha,
	tac.nr_crm,
	tac.mes_ref
from
	tmp_agenda_cohp tac
WHERE 
	DATE(tac.dt_execucao) BETWEEN  :dt_inicial  and :dt_final
 	and COALESCE(tac.nr_cartao_ps = :nr_cartao_ps,tac.nr_cartao_ps)
   	and (((COALESCE(:nr_crm,tac.nr_crm)) = tac.nr_crm)
 		or  (f_json_table(:nr_crm,tac.nr_crm)))
 	and (((COALESCE(:cd_procedimento,tac.cd_procedimento)) = tac.cd_procedimento)
 		or  (f_json_table(:cd_procedimento,tac.cd_procedimento)))
AND (
			:ie_urgencia = 'T'  -- Esta condição ignora o filtro quando :ie_urgencia for 'T'
			OR ie_urgencia = COALESCE(:ie_urgencia, ie_urgencia)
		);