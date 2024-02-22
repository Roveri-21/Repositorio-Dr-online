SELECT
	*
from
	crm_lead cl
inner join crm_pessoa cp on
	cp.idcrm_pessoa = cl.idcrm_pessoa -- and cp.nm_pessoa like '%Guilherme%' 
inner join crm_pessoa_contato cpc on 
	cpc.idcrm_pessoa = cp.idcrm_pessoa and cpc.nr_telefone LIKE '%9324'
WHERE
	cl.idcrm_funil = 17
	and cl.status = 'A';