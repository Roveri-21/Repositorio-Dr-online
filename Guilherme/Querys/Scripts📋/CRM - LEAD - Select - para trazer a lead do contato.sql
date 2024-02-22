SELECT
  cl.idcrm_lead
FROM
    crm_pessoa_contato cpc
inner join crm_pessoa cp on cp.idcrm_pessoa = cpc.idcrm_pessoa
inner JOIN crm_lead cl on cl.idcrm_funil = :idcrm_funil 
  and cl.idcrm_pessoa  = cp.idcrm_pessoa 
  and cl.status = 'A'  
inner join crm_funil_etapa cfe on cfe.idcrm_funil = cl.idcrm_funil 
  and cfe.idcrm_funil_etapa = cl.idcrm_funil_etapa
  and coalesce(cfe.ie_tipo_etapa,'') not in ('G','P')
WHERE
    COALESCE(cpc.nr_ddi_telefone, '55') = coalesce(f_extrair_numero_telefone(:nr_celular,'DDI'), '55')
    AND COALESCE(cpc.nr_ddd_telefone, '62') = coalesce(f_extrair_numero_telefone(:nr_celular,'DDD'), '62')
    AND f_extrair_numero_telefone(COALESCE(cpc.nr_telefone, '0'),'NR8') = f_extrair_numero_telefone(:nr_celular,'NR8')
    AND cpc.status = 'A';