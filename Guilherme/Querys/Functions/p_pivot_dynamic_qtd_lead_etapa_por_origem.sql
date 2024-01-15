CREATE DEFINER=`apirest`@`%` PROCEDURE `dados`.`p_pivot_dynamic_qtd_lead_etapa_por_origem`(IN idestabelecimento int, in idcrm_funil int, in dt_inicial date, in dt_final date)
BEGIN
  SET @sql = (SELECT GROUP_CONCAT(DISTINCT
                                  CONCAT(
                                    'SUM(CASE WHEN x.status = "A" and x.idcrm_funil_etapa = ',
                                    x.idcrm_funil_etapa,
                                    ' THEN 1 ELSE 0 END) AS etapa_',
                                    x.row_num
                                  )
                                order by x.row_num)
                                                 
              FROM (select cfe.idcrm_funil_etapa,
					  ROW_NUMBER() OVER (ORDER by cfe.nr_sequencia) row_num
					  from crm_funil_etapa cfe
					  WHERE cfe.status = 'A' 
					    and cfe.idcrm_funil = idcrm_funil
					  order by cfe.nr_sequencia limit 9) x);
             
   SET @sql = CONCAT('SELECT col.idcrm_origem_lead, col.ds_origem,', @sql, ', COUNT(x.idcrm_origem_lead) AS total
                     FROM crm_projeto cp
						  inner join crm_funil cf on cp.idcrm_projeto = cf.idcrm_projeto
						  inner join crm_lead x on x.idcrm_funil = cf.idcrm_funil
						  inner join (select * from crm_funil_etapa cfe where cfe.status = "A" and cfe.idcrm_funil = ', idcrm_funil, ' order by cfe.nr_sequencia limit 9) cfe on x.idcrm_funil_etapa = cfe.idcrm_funil_etapa 
						  inner join crm_origem_lead col on x.idcrm_origem_lead = col.idcrm_origem_lead
                     WHERE 
                         cp.idestabelecimento = ', idestabelecimento, '
						 and x.idcrm_funil = ', idcrm_funil, '
						 and x.status = ''', 'A', '''
						 and date(x.dt_evento) BETWEEN ''', dt_inicial, ''' and ''', dt_final, '''
                     GROUP BY col.idcrm_origem_lead, col.ds_origem');

  PREPARE stmt FROM @sql;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;                           
END