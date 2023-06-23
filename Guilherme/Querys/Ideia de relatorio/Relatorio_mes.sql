-- Caso queria gerar um relatorio pelo mes escrito em ingles
SELECT
 	pf.nm_pessoa,
 	cl.ds_valor
FROM
	crm_lead cl
INNER JOIN crm_funil_etapa cfe on cfe.idcrm_funil_etapa = cl.idcrm_funil_etapa
INNER JOIN usuario u on u.login = cl.login 
INNER JOIN pessoa_fisica pf on pf.idpessoa_fisica =u.idpessoa_fisica 
WHERE 
	cl.idcrm_funil = :idcrm_funil
	and cfe.ie_tipo_etapa ='G'
 	and MONTHNAME(date(cl.dt_ganho))= :dt_ganho;