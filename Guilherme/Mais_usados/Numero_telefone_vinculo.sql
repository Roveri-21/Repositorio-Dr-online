SELECT * FROM crm_empresa ce 
WHERE ce.cnpj = '11508361000240'; -- select para trazer o idcrm_empresa do cnp

SELECT * FROM pessoa_vinculo pv 
WHERE pv.idcrm_empresa = 7270; -- select para validação da pessoa 

SELECT * FROM crm_empresa_contato cec -- select que traz o numero de contato dessa pessoa
WHERE cec.idcrm_empresa = 7270;
