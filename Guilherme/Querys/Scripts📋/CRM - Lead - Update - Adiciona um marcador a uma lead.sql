UPDATE crm_lead
SET idcrm_funil_marcador = JSON_ARRAY_APPEND(COALESCE(idcrm_funil_marcador, '[]'), '$', CAST('433' AS JSON)) -- adiciona um marcadores sem reomover os que ja existem 

WHERE idcrm_lead = :idcrm_lead;