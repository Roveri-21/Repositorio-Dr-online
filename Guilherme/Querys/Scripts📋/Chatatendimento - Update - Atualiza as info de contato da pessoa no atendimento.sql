UPDATE 	
	contato_chatbot SET ds_cidade = :ds_municipio,ds_email = :ds_email, ds_contato_nome = :nm_pessoa, ie_sexo = :ie_sexo, nr_documento = :nr_cpf, dt_nascimento = :dt_nascimento, idpessoa_fisica = :idpessoa_fisica
WHERE
	idcontato_chatbot = :idcontato_chatbot
and idpessoa_fisica is NULL;