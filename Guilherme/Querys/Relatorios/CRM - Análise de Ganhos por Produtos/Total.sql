SELECT
	CONCAT('Qtd lead: ',COUNT(cl.idcrm_lead))as Qtd_lead, 
	CONCAT('Qtd Produtos: ',sum(cl.ds_quantidade)) as Qtd_Produtos,
	SUM(cl.ds_valor)as Valor
from
	crm_lead cl
inner join crm_funil cf on cf.idcrm_funil =cl.idcrm_funil 
inner join crm_funil_etapa cfe on cfe.idcrm_funil_etapa = cl.idcrm_funil_etapa
where
	cf.idcrm_funil =:idcrm_funil	
	and date(cl.dt_insert) BETWEEN :dt_inicial AND :dt_final
	and cl.status = 'A'
	and cfe.ie_tipo_etapa = 'G';