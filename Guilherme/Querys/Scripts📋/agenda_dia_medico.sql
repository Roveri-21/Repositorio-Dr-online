select 
  a.idpessoa_fisica, 
  a.var_3, -- nome do medico
  a.var_1, -- hora inicial
  a.var_2 --  hora final
from (SELECT
  DISTINCT 
	pf.idpessoa_fisica,
	f_primeiro_nome(pf.nm_pessoa)as var_3,
	min(at2.hr_inicial) as var_1,
	max(at2.hr_final) as var_2
FROM
	agenda_turno at2
inner join agenda a on
	a.idagenda = at2.idagenda 
inner join agenda_consulta ac on 
	ac.idagenda = at2.idagenda and ac.idagenda_turno =at2.idagenda_turno and ac.status ='A' and ac.ie_status_agenda <> 'C' -- traz a agenda do dia atravez das agendas disponiveis do dia, dessa forma ele sabe se e de hj ou não
inner join pessoa_fisica pf on 
	pf.idpessoa_fisica = a.idpessoa_fisica 
WHERE 
	date(ac.dt_agenda) = CURRENT_DATE()
	and at2.status = 'A' 	
GROUP by pf.idpessoa_fisica, f_primeiro_nome(pf.nm_pessoa)
order by hr_inicial asc
) a 
where
 	TIMESTAMPDIFF(MINUTE, CURRENT_TIME(), a.var_1) BETWEEN 1 and 29;

