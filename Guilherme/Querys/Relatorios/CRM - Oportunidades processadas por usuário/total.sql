SELECT 
SUM(y.Qtd_Total),
SUM(y.Qtd_proc),
SUM(y.Qtd_Ganho),
SUM(y.valor_ganho),
SUM(y.Qtd_perda),
SUM(y.valor_perda)
 from
(SELECT
    x.nm_pessoa,    
    COUNT(x.idcrm_lead) as Qtd_Total,
    COUNT(CASE WHEN x.ie_tipo_etapa IN ('G', 'P') THEN x.idcrm_lead ELSE NULL END) as Qtd_proc,
    COUNT(if (x.ie_tipo_etapa = 'G',1,NULL)) as Qtd_Ganho,
    ROUND((COUNT(if (x.ie_tipo_etapa = 'G', 1, NULL)) / NULLIF(COUNT(CASE WHEN x.ie_tipo_etapa IN ('G', 'P') THEN x.idcrm_lead ELSE NULL END), 0)) * 100 ,2) as Taxa_Ganho,
    AVG(TIMESTAMPDIFF(day,x.dt_insert,x.dt_ganho)) as media_tempo_ganho,
    SUM(CASE WHEN x.ie_tipo_etapa = 'G' THEN x.ds_valor ELSE 0 END) as valor_ganho,
    COUNT(if (x.ie_tipo_etapa = 'P',1,NULL)) as Qtd_perda,
    ROUND((COUNT(if (x.ie_tipo_etapa = 'P',1,NULL)) / NULLIF(COUNT(CASE WHEN x.ie_tipo_etapa IN ('G', 'P') THEN x.idcrm_lead ELSE NULL END), 0)) * 100 ,2) as Taxa_Perda,
    AVG(TIMESTAMPDIFF(day,x.dt_insert,x.dt_perda)) as media_tempo_perda,
    SUM(CASE WHEN x.ie_tipo_etapa = 'P' THEN x.ds_valor ELSE 0 END) as valor_perda,
    ROUND(AVG(x.qtd_dia_ganho),2) as media_ganho,
    ROUND(AVG(x.qtd_dia_perda),2) as media_perda 
from
    (
    SELECT
    	pf.nm_pessoa,
        cl.login,
        cl.idcrm_lead,
        cfe.ie_tipo_etapa,
        cl.ds_valor,
        cl.dt_insert,
        cl.dt_ganho,
        (select max(dt_historico) from crm_lead_historico clh inner join crm_funil_etapa cfe on cfe.idcrm_funil_etapa = clh.idcrm_funil_etapa and cfe.ie_tipo_etapa = 'P' where clh.idcrm_lead = cl.idcrm_lead and clh.idtipo_perda is not null) dt_perda,
        TIMESTAMPDIFF(day, cl.dt_insert, cl.dt_ganho) qtd_dia_ganho,
        TIMESTAMPDIFF(day, cl.dt_insert, 
                           (select max(dt_historico) from crm_lead_historico clh inner join crm_funil_etapa cfe on cfe.idcrm_funil_etapa = clh.idcrm_funil_etapa and cfe.ie_tipo_etapa = 'P' where clh.idcrm_lead = cl.idcrm_lead and clh.idtipo_perda is not null)) qtd_dia_perda
    from
        crm_lead cl
    inner join crm_funil cf on
        cf.idcrm_funil = cl.idcrm_funil
    inner join crm_projeto cp on
        cp.idcrm_projeto = cf.idcrm_projeto
    inner join crm_funil_etapa cfe on
        cfe.idcrm_funil_etapa = cl.idcrm_funil_etapa     
    inner JOIN usuario u on 
		u.login = cl.login 
	inner JOIN pessoa_fisica pf on
		pf.idpessoa_fisica =u.idpessoa_fisica 
    WHERE
        cp.idestabelecimento = :idestabelecimento
        and cf.idcrm_funil = :idcrm_funil
        and cl.status = 'A'
        and date(cl.dt_insert)BETWEEN :dt_inicial AND :dt_final)x
 GROUP by x.login)y;
