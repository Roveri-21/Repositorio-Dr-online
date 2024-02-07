UPDATE crm_pessoa 
SET nm_pessoa = :ds_contato_nome, dt_nascimento =:dt_nascimento, nr_cpf = :nr_documento, ie_sexo = :ie_sexo,  idpessoa_fisica = :idpessoa_fisica, nm_mae = :nm_mae, nm_social = :ds_nome
WHERE 
	idcrm_pessoa = :idcrm_pessoa 
	and idpessoa_fisica is null;