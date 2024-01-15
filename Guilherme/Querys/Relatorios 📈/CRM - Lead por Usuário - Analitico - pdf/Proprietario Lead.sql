select
    DISTINCT
    f_lead_dados(idcrm_lead,'U') nm_proprietario,
    (select distinct idusuario from usuario u where u.login = cl.login) p_idlogin
from crm_lead cl  	
where 
    DATE_FORMAT(cl.dt_insert,'%Y-%m-%d') between :dt_inicial and :dt_final
    and f_lead_dados(cl.idcrm_lead,'EST') = {{:idestabelecimento}}
    and (cl.login in (select j.name from json_table(
								:login_usuario,
								'$[*]' columns (name varchar(40) path '$')) j ) or :login_usuario is null)
    and (cl.idcrm_funil in (select j.name
                    from json_table(
                      :idcrm_funil,
                      '$[*]' columns (name int path '$')
                    )j) or :idcrm_funil is null)
    and (cl.idcrm_funil_etapa in (select j.name
                    from json_table(
                      :crm_funil_etapa,
                      '$[*]' columns (name varchar(25) path '$')
                    )j) or :crm_funil_etapa is null)
    and (cl.ie_etiqueta in (select j.name
                    from json_table(
                      :etiqueta,
                      '$[*]' columns (name varchar(25) path '$')
                    )j) or cl.ie_etiqueta in (select coalesce(:etiqueta,vl_dominio) from dominio_valor where iddominio = 612))
    and (cl.idcrm_origem_lead in (select j.name
                    from json_table(
                      :crm_origem_lead,
                      '$[*]' columns (name varchar(25) path '$')
                    )j) or :crm_origem_lead is null);