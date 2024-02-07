UPDATE
	crm_pessoa_contato
set
	ds_email = :ds_email, ie_whatsapp = 'S' 
WHERE 
	idcrm_pessoa = :idcrm_pessoa
	and ie_principal = 'S'
	and ds_email is null;