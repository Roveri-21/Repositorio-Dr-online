select distinct
    idcrm_funil_etapa id,
    ds_etapa descricao  
from crm_funil_etapa cfe
where idcrm_funil in (
select j.name
                    from json_table(
                      :idcrm_funil,
                      '$[*]' columns (name int path '$')
                    )j
)