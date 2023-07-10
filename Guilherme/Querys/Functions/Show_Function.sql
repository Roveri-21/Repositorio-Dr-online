-- para consultar os nomes das funções pode ser usado o seguinte comando

show function status
where name like '%co%';


-- para consultar o tipo de função 
SHOW CREATE FUNCTION f_json_table;


-- para consultar uma procedure
SELECT ROUTINE_NAME
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_TYPE = 'PROCEDURE'
    AND ROUTINE_SCHEMA = 'homologacao'
    AND ROUTINE_NAME like '%p_pivot_dynamic_qtd_lead_etapa_por_origem%';