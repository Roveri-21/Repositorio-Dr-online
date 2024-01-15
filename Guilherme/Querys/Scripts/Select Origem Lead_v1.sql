select 
	idcrm_origem_lead id,
	ds_origem descricao
from crm_origem_lead
where idestabelecimento = {{:idestabelecimento}}
and status = 'A';