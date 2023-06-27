select 	 
		pro.ds_proc_exame exame,
		pei.qt_exame qtd,
		if(pei.ds_justificativa is null, ' ', CONCAT('Justificativa: ',pei.ds_justificativa)) justificativa
from atendimento_pedido_exame_exter a
		inner join atendimento_paciente ap on ap.idatendimento_paciente = a.idatendimento
		inner join atendimento_pedido_exame_item pei on pei.idatendimento_pedido_exame = a.idatendimento_pedido_exame
		inner join procedimento_interno pro on pro.idprocedimento_interno = pei.idproc_interno		 
where a.idatendimento_pedido_exame = :idatendimento_pedido_exame
and a.status in ('A','L');  -- <<< alteração do campo status de and a.status ='L' 
